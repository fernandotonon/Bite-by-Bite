// Rule checks for the mission simulation, without Qt:  node tests/sim.test.js
// A tiny bot walks the active zombie along the simulation's own navigation paths, so these tests also
// prove the hospital level is connected the way the puzzle flow expects.
import { loadQmlJs } from "./qmljs-load.mjs"
import assert from "node:assert/strict"
import { fileURLToPath } from "node:url"
import { dirname, join } from "node:path"
const here = dirname(fileURLToPath(import.meta.url))
const cfg = (f) => loadQmlJs(join(here, "..", "app", "config", f))
const Ch = cfg("characters.js"), Mi = cfg("missions.js"), Tu = cfg("tuning.js").tuning
const { createSim } = loadQmlJs(join(here, "..", "app", "scripts", "Sim.js"))
const DT = 1 / 60

let passed = 0
function test(name, fn) { try { fn(); passed++; console.log("ok   " + name) } catch (e) { console.log("FAIL " + name + "\n     " + (e.stack || e)); process.exitCode = 1 } }
function make(squad, opts = {}) {
    const sim = createSim({ mission: Mi.get("hospital_night_shift"), characters: Ch.byId, tuning: Tu, squad: squad || ["standard"], rng: () => 0.37 })
    if (opts.blind) { for (const h of sim.state.humans) h.view = { angle: 0, range: 0 }; for (const c of sim.state.cameras) c.view = { angle: 0, range: 0 } }
    return sim
}
function run(sim, seconds) { for (let t = 0; t < seconds; t += DT) sim.step(DT); return sim.takeEvents() }
function ev(events, type) { return events.filter(e => e.type === type) }
// walk the active zombie to (x, z) along the sim's own path; returns collected events
function walkTo(sim, x, z, opts = {}) {
    const S = sim.state, events = []
    let t = 0
    while (t < (opts.timeout || 40)) {
        const zb = sim.activeZombie()
        if (Math.hypot(zb.x - x, zb.z - z) < 0.22) break
        if (S.phase !== "playing") break
        const path = sim.findPath(zb.x, zb.z, x, z)
        const p = path[0]
        const dx = p.x - zb.x, dz = p.z - zb.z, len = Math.hypot(dx, dz) || 1
        sim.setInput({ x: dx / len, z: dz / len, run: !!opts.run, sneak: !!opts.sneak })
        sim.step(DT); t += DT
        events.push(...sim.takeEvents())
    }
    sim.setInput({ x: 0, z: 0 }); sim.step(DT); events.push(...sim.takeEvents())
    return events
}
function guard(sim, id) { return sim.state.humans.find(h => h.id === id) }

test("start: one standard zombie in the patient room, door closed, interact opens it", () => {
    const sim = make()
    const S = sim.state
    assert.equal(S.squad.length, 1); assert.equal(S.squad[0].charId, "standard")
    assert.equal(S.phase, "playing")
    const door = S.doors.find(d => d.id === "door_room")
    assert.equal(door.open, false)
    walkTo(sim, 7.2, 4.8)
    assert.equal(sim.prompt().kind, "door")
    assert.ok(sim.interact())
    assert.equal(door.open, true)
    assert.ok(ev(sim.takeEvents(), "door").length === 1)
})

test("movement: walls block, the room door blocks while closed", () => {
    const sim = make()
    const zb = sim.activeZombie()
    sim.setInput({ x: 1, z: 0 }); run(sim, 6)            // push east into the closed door
    assert.ok(zb.x < 8 - Tu.zombieRadius + 0.01, "stopped by the door at x=" + zb.x)
    assert.ok(zb.x > 7.3, "walked up to the door " + zb.x)
})

test("detection: a guard fills its meter, goes alert, catches the zombie and the run restarts", () => {
    const sim = make()
    const S = sim.state
    const g = guard(sim, "guard_ward")
    // put the zombie in the corridor in front of the guard, in plain sight
    const zb = sim.activeZombie(); S.doors[0].open = true; zb.x = 9.5; zb.z = 6.0; g.x = 9.5; g.z = 3.0; g.facing = 0; g.waitLeft = 100
    let events = run(sim, 0.6)
    assert.ok(g.meter > 0, "meter fills " + g.meter)
    events = events.concat(run(sim, 1.5))
    assert.ok(ev(events, "suspicious").length >= 1, "suspicious event")
    assert.ok(ev(events, "alert").length >= 1, "alert event; state " + g.state)
    events = events.concat(run(sim, 4 + Tu.caughtRestartDelay))
    assert.ok(ev(events, "caught").length === 1, "caught")
    assert.ok(S.stats.fullAlerts >= 1)
    assert.ok(ev(events, "restart").length === 1, "restart after caught")
    assert.equal(sim.state.phase, "playing")
    assert.ok(Math.abs(sim.state.squad[0].x - 3.0) < 0.01, "back at the spawn (no checkpoint yet)")
    assert.equal(sim.state.stats.restarts, 1)
})

test("detection: sneaking fills slower, hiding in the locker makes the zombie invisible", () => {
    const a = make(), b = make()
    for (const sim of [a, b]) { const S = sim.state; S.doors[0].open = true; const zb = sim.activeZombie(); zb.x = 9.5; zb.z = 6.0; const g = guard(sim, "guard_ward"); g.x = 9.5; g.z = 2.5; g.facing = 0; g.waitLeft = 100 }
    a.setInput({ x: 0, z: 0, sneak: false }); b.setInput({ x: 0, z: 0, sneak: true })
    run(a, 0.5); run(b, 0.5)
    assert.ok(guard(b, "guard_ward").meter < guard(a, "guard_ward").meter, "sneak slower")
    const sim = make()
    walkTo(sim, 1.2, 6.3)
    assert.equal(sim.prompt().kind, "hide")
    assert.ok(sim.interact())
    assert.ok(sim.activeZombie().hidden, "hidden")
    const g = guard(sim, "guard_ward"); g.x = 2.5; g.z = 5.5; g.facing = -Math.PI / 2; g.waitLeft = 100; sim.state.doors[0].open = true
    run(sim, 2)
    assert.equal(g.meter, 0, "hidden zombie is not seen")
    sim.interact(); assert.ok(!sim.activeZombie().hidden)
    const out = sim.activeZombie(), before = { x: out.x, z: out.z }
    assert.ok(sim.freeAt(out.x, out.z, Tu.zombieRadius), "standing on free floor after leaving the locker")
    sim.setInput({ x: 1, z: 0 }); run(sim, 0.5)
    assert.ok(out.x > before.x + 0.5, "can walk away after leaving the locker")
})

test("noise: throwing the radio makes the ward guard investigate the landing spot", () => {
    const sim = make(["standard"], { blind: true })
    const S = sim.state; S.doors[0].open = true
    walkTo(sim, 13.0, 6.0)
    assert.equal(sim.prompt().kind, "pickup")
    assert.ok(sim.interact()); assert.equal(S.pickups[0].heldBy, S.squad[0].id)
    const zb = sim.activeZombie(); zb.facing = Math.atan2(-1, -0.6)      // towards the corridor
    const g = guard(sim, "guard_ward"); g.x = 9.5; g.z = 6; g.state = "patrol"; g.waitLeft = 100
    assert.equal(sim.prompt().kind, "throw")
    assert.ok(sim.interact())
    let events = run(sim, 1.0)
    assert.ok(ev(events, "land").length === 1, "radio landed")
    assert.ok(ev(events, "noise").some(n => n.kind === "radio"))
    assert.equal(g.state, "investigate", "guard investigates")
    const land = ev(events, "land")[0]
    run(sim, 8)
    assert.ok(Math.hypot(g.x - land.x, g.z - land.z) < 2.0, "guard reached the radio " + Math.hypot(g.x - land.x, g.z - land.z))
    run(sim, 12)
    assert.ok(["return", "patrol"].includes(g.state), "guard goes back: " + g.state)
})

test("laser: crossing the active barrier stuns and raises an alarm; the brute is not stunned", () => {
    for (const [ch, stunned] of [["standard", true], ["brute", false]]) {
        const sim = make([ch], { blind: true })
        const zb = sim.activeZombie(); zb.x = 19.2; zb.z = 5.5
        sim.setInput({ x: 1, z: 0 })
        const events = run(sim, 1.0)
        assert.ok(ev(events, "laserTrip").length >= 1, ch + " tripped")
        assert.ok(ev(events, "alarm").length >= 1, ch + " alarm")
        assert.equal(sim.state.squad[0].stunUntil > 0, stunned, ch + " stunned")
    }
})

test("panel: a standard zombie smashes it (short outage + alarm + zap); the electrician sabotages it cleanly", () => {
    const a = make(["standard"], { blind: true })
    let zb = a.activeZombie(); zb.x = 26.6; zb.z = 16.0
    assert.equal(a.prompt().kind, "smash")
    assert.ok(a.interact())
    let events = a.takeEvents()
    assert.ok(ev(events, "smash").length && ev(events, "zap").length && ev(events, "alarm").length)
    assert.ok(!a.isLaserActive(a.state.lasers[0]) && !a.isCameraActive(a.state.cameras[0]))
    run(a, Tu.smashDuration + 0.2)
    assert.ok(a.isLaserActive(a.state.lasers[0]), "laser back after the smash outage")

    const b = make(["electrician"], { blind: true })
    zb = b.activeZombie(); zb.x = 26.6; zb.z = 16.0
    assert.equal(b.prompt().kind, "sabotage")
    assert.ok(b.ability())
    events = b.takeEvents()
    assert.ok(ev(events, "sabotage").length === 1 && ev(events, "zap").length === 0 && ev(events, "alarm").length === 0)
    assert.ok(!b.isLaserActive(b.state.lasers[0]))
    events = run(b, Tu.sabotageNoticeDelay + 0.5)
    assert.ok(ev(events, "panelNoticed").length === 1, "a guard is sent to check the panel later")
    assert.equal(guard(b, "guard_hall").state, "investigate")
})

test("nurse: cannot smash the panel, is noticed slower from afar, and is recruitable", () => {
    const n = make(["nurse"], { blind: true })
    const zb = n.activeZombie(); zb.x = 26.6; zb.z = 16.0
    assert.equal(n.prompt(), null, "no smash offered to the nurse")
    assert.ok(!n.ability())
    const a = make(["standard"]), b = make(["nurse"])
    for (const sim of [a, b]) { sim.state.doors[0].open = true; const z = sim.activeZombie(); z.x = 9.5; z.z = 8.5; const g = guard(sim, "guard_ward"); g.x = 9.5; g.z = 2.5; g.facing = 0; g.waitLeft = 100 }
    run(a, 0.5); run(b, 0.5)
    assert.ok(guard(b, "guard_ward").meter < guard(a, "guard_ward").meter * 0.6, "disguise fills slower at 6 m")
    const c = make(["standard"], { blind: true })
    const nurse = c.state.humans.find(h => h.id === "nurse"); const z2 = c.activeZombie(); z2.x = nurse.x; z2.z = nurse.z + 0.8; z2.facing = 0
    assert.ok(c.bite()); run(c, 2)
    assert.ok(c.state.squad.find(q => q.charId === "nurse"), "nurse joined the squad")
    assert.ok(c.state.objectives.nurse.done)
})

test("routes: the service door needs the janitor, the weak wall needs the brute", () => {
    const s = make(["standard"], { blind: true })
    let zb = s.activeZombie(); zb.x = 19.2; zb.z = 1.8
    assert.equal(s.prompt().kind, "unlock"); assert.ok(!s.interact()); assert.ok(s.state.doors[1].locked)
    const j = make(["janitor"], { blind: true })
    zb = j.activeZombie(); zb.x = 19.2; zb.z = 1.8
    assert.ok(j.ability()); assert.ok(!j.state.doors[1].locked && j.state.doors[1].open)
    const b = make(["brute"], { blind: true })
    zb = b.activeZombie(); zb.x = 25; zb.z = 9.0
    assert.equal(b.prompt().kind, "break"); assert.ok(b.ability())
    assert.ok(b.state.walls.find(w => w.weak).broken)
    walkTo(b, 25, 6.5, { timeout: 8 })
    assert.ok(b.activeZombie().z < 7.5, "brute walked through the broken wall into the bay")
})

test("full flow: escape room -> checkpoint -> bite the electrician -> switch -> sabotage -> both zombies exit -> won (S rating)", () => {
    const sim = make(["standard"], { blind: true })
    const S = sim.state
    walkTo(sim, 7.2, 4.8); assert.ok(sim.interact())
    let events = walkTo(sim, 12.0, 9.8, { run: true })
    assert.ok(ev(events, "checkpoint").length === 1, "checkpoint in the corridor")
    // collectible on the way
    events = walkTo(sim, 18.6, 18.6, { run: true })
    assert.ok(ev(events, "collect").length === 1, "brain collected")
    // the electrician wanders in the electrical room: chase them
    const el = S.humans.find(h => h.id === "electrician")
    let bitten = false
    for (let i = 0; i < 40 && !bitten; i++) {
        walkTo(sim, el.x, el.z, { run: true, timeout: 2 })
        if (sim.prompt() && sim.state.humans.find(h => h.id === "electrician") && Math.hypot(sim.activeZombie().x - el.x, sim.activeZombie().z - el.z) < Tu.biteRange + 0.3) {
            assert.ok(sim.bite(), "bite starts")
            events = run(sim, 2.2)
            if (ev(events, "recruit").length) bitten = true
        }
    }
    assert.ok(bitten, "electrician recruited")
    assert.equal(S.squad.length, 2); assert.equal(S.squad[1].charId, "electrician")
    assert.ok(S.recruited.includes("electrician"))
    assert.ok(S.objectives.capture.done)
    assert.ok(sim.switchZombie(1)); assert.equal(S.active, 1)
    walkTo(sim, 26.6, 16.0)
    assert.equal(sim.prompt().kind, "sabotage"); assert.ok(sim.ability())
    assert.ok(!sim.isLaserActive(S.lasers[0]))
    // both to the ambulance bay (the standard follows)
    events = walkTo(sim, 24.5, 5.5, { run: true, timeout: 30 })
    assert.ok(ev(events, "laserTrip").length === 0, "nobody tripped the disabled laser")
    run(sim, 6)   // let the follower arrive
    assert.equal(S.phase, "won", "won; squad at " + JSON.stringify(S.squad.map(z => [z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(r.won && r.optional.find(o => o.id === "capture").done && r.optional.find(o => o.id === "brain").done && r.optional.find(o => o.id === "stealth").done)
    assert.ok(r.time < 240, "fast enough: " + r.time)
    assert.equal(r.stars, 4); assert.equal(r.rating, "S")     // 4 of 5 optionals (the nurse was not recruited)
})

test("checkpoint: getting caught after the checkpoint reloads there, keeping the elapsed clock", () => {
    const sim = make(["standard"], { blind: true })
    walkTo(sim, 7.2, 4.8); sim.interact()
    walkTo(sim, 12.0, 9.8, { run: true })
    const S = sim.state
    assert.ok(S.checkpoint)
    const g = guard(sim, "guard_hall"); g.view = Tu.guardView
    const zb = sim.activeZombie(); zb.x = 14; zb.z = 9.8; g.x = 15.5; g.z = 9.8; g.facing = -Math.PI / 2; g.waitLeft = 100
    const before = S.elapsed
    let events = run(sim, 5 + Tu.caughtRestartDelay)
    assert.ok(ev(events, "caught").length === 1)
    assert.ok(ev(events, "restart").length === 1 && ev(events, "restart")[0].checkpoint)
    assert.ok(sim.state.squad[0].x > 11 && sim.state.squad[0].x < 13.2 && sim.state.squad[0].z > 8 && sim.state.squad[0].z < 11.5, "reloaded at the checkpoint")
    assert.ok(sim.state.elapsed > before, "elapsed keeps counting")
    assert.equal(sim.state.doors[0].open, true, "door state restored from the checkpoint")
})

test("camera: a zombie standing in the sweep triggers an alarm that sends guards to it", () => {
    const sim = make(["standard"], { blind: true })
    const cam = sim.state.cameras[0]; cam.view = Tu.cameraView
    const zb = sim.activeZombie(); zb.x = 22.5; zb.z = 10.6
    const events = run(sim, 6)
    assert.ok(ev(events, "cameraAlarm").length >= 1, "camera alarm")
    assert.equal(guard(sim, "guard_hall").state, "investigate")
    const p = sim.state.panels[0]; p.usedUntil = 0
    zb.x = 26.6; zb.z = 16
    sim.interact(); run(sim, 0.1)
    assert.ok(!sim.isCameraActive(cam), "panel outage disables the camera")
})

test("squad: stay/follow command and switching keep every member in the mission", () => {
    const sim = make(["standard", "brute"], { blind: true })
    const S = sim.state
    assert.equal(S.squad.length, 2)
    assert.equal(sim.toggleCommand(), "stay")
    walkTo(sim, 5.5, 3.0)
    assert.ok(Math.hypot(S.squad[1].x - 3.0, S.squad[1].z - 5.9) < 0.3, "brute stayed")
    assert.equal(sim.toggleCommand(), "follow")
    run(sim, 3)
    assert.ok(Math.hypot(S.squad[1].x - S.squad[0].x, S.squad[1].z - S.squad[0].z) < Tu.followDistance + 0.3, "brute followed")
    assert.ok(sim.switchZombie(1)); assert.equal(sim.activeZombie().charId, "brute")
    assert.ok(sim.switchZombie(1)); assert.equal(sim.activeZombie().charId, "standard")
})

test("cart: the active zombie pushes the medical cart, and it blocks sight afterwards", () => {
    const sim = make(["standard"], { blind: true })
    const cart = sim.state.props.find(p => p.id === "cart")
    const zb = sim.activeZombie(); zb.x = cart.x + cart.w / 2; zb.z = cart.z + cart.d + 0.4
    sim.setInput({ x: 0, z: -1 }); run(sim, 1.5)
    assert.ok(cart.z < 5.2 - 0.5, "cart pushed north to z=" + cart.z)
    assert.ok(!sim.lineOfSight(zb.x, zb.z, zb.x, cart.z - 1), "cart blocks sight")
})

console.log(passed + " simulation checks passed")
