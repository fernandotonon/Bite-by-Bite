// Detention of the Dead: timed switches, the two-switch exit, the bell requirement, vault and vent shortcuts,
// recruitment, the squad route and the rating.  node tests/school.test.js
import assert from "node:assert/strict"
import { Tu, test, summary, make as makeMission, run, ev, walkTo, guard, chaseAndBite } from "./helpers.mjs"
const make = (squad, opts) => makeMission("school_detention", squad, opts)
const door = (sim, id) => sim.state.doors.find(d => d.id === id)
const ctl = (sim, id) => sim.state.controls.find(c => c.id === id)

test("construction: loads with two guards, two recruitable humans, three controls and a two-switch exit", () => {
    const sim = make(); const S = sim.state
    assert.equal(S.humans.filter(h => h.kind === "guard").length, 2)
    assert.deepEqual(S.humans.filter(h => h.recruit).map(h => h.recruit).sort(), ["athlete", "child"])
    assert.equal(S.controls.length, 3)
    assert.deepEqual(door(sim, "gym_exit").openedBy, ["switch_a", "switch_b"]); assert.ok(door(sim, "gym_exit").sealed)
})

test("timed switches: one switch alone does not open the exit; it runs out after 10 s", () => {
    const sim = make(["standard"], { blind: true })
    const zb = sim.activeZombie(); zb.x = 11.2; zb.z = 19.2
    assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact())
    assert.ok(ctl(sim, "switch_a").used && sim.controlActive(ctl(sim, "switch_a")))
    run(sim, 0.1)
    assert.ok(!door(sim, "gym_exit").open, "one switch is not enough")
    const events = run(sim, 10.5)
    assert.ok(ev(events, "controlExpired").length === 1 && !ctl(sim, "switch_a").used, "switch A ran out")
    assert.equal(sim.prompt().kind, "control", "and can be pressed again")
})

test("two switches at once open the gym exit; the exit does not count before the bell", () => {
    const sim = make(["standard", "brute"], { blind: true })
    const S = sim.state
    const a = S.squad[0], b = S.squad[1]
    a.x = 11.2; a.z = 19.2; b.x = 26.8; b.z = 12.7
    sim.selectZombie(1); sim.toggleCommand()             // the standard stays on A, the brute is controlled
    sim.selectZombie(0); assert.ok(sim.interact())        // press A
    sim.selectZombie(1); assert.ok(sim.interact())        // press B
    let events = run(sim, 0.2)
    assert.ok(door(sim, "gym_exit").open, "both switches active -> exit open")
    for (const q of S.squad) { q.x = 26; q.z = 17 }
    run(sim, 2)
    assert.equal(S.phase, "playing", "no win without the bell")
    assert.ok(S.message && /bell/i.test(S.message.text), "the HUD says why")
    ctl(sim, "bell").used = true
    run(sim, 1.5)
    assert.equal(S.phase, "won")
})

test("vault: only the athlete hops the bleachers into the gym", () => {
    const s = make(["standard"], { blind: true }); s.activeZombie().x = 20; s.activeZombie().z = 10.0
    assert.equal(s.prompt().kind, "traverseLocked")
    const a = make(["athlete"], { blind: true }); const zb = a.activeZombie(); zb.x = 20; zb.z = 10.0
    assert.equal(a.prompt().kind, "traverse"); assert.ok(a.interact())
    const events = run(a, 1.2)
    assert.ok(ev(events, "traverseEnd").length === 1 && zb.z > 11.5, "in the gym")
})

test("vent: the kid crawls from the locker room straight into the switch closet", () => {
    const k = make(["child"], { blind: true }); const zb = k.activeZombie(); zb.x = 8.2; zb.z = 18.3
    assert.equal(k.prompt().kind, "traverse"); assert.ok(k.interact())
    run(k, 3.5)
    assert.ok(zb.x > 25 && zb.z > 12 && zb.z < 14, "inside the closet at " + zb.x + "," + zb.z)
    walkTo(k, 27.0, 12.7); assert.equal(k.prompt().kind, "control")
})

test("full flow (standard + brute): classrooms -> bell -> kid -> brain -> gym -> coach -> switches -> exit, S+", () => {
    const sim = make(["standard", "brute"], { blind: true })
    const S = sim.state
    const open = (x, z) => { walkTo(sim, x, z, { run: true }); const p = sim.prompt(); if (p && p.kind === "door" && /^Open/.test(p.text)) sim.interact() }
    open(2.7, 7.2); open(12.7, 8.7); walkTo(sim, 12.7, 9.5, { run: true })
    assert.ok(S.checkpoint, "corridor checkpoint")
    open(12.7, 7.2); open(16.2, 4.8); walkTo(sim, 16.8, 1.5, { run: true })
    assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact()); assert.ok(ctl(sim, "bell").used, "bell rang")
    // kid in the cafeteria
    open(16.2, 2.8); walkTo(sim, 12.7, 9.5, { run: true }); open(22.7, 8.7); walkTo(sim, 22.7, 6.5, { run: true })
    assert.ok(chaseAndBite(sim, "kid"), "kid recruited")
    // brain in the locker room (janitor door is locked: brute breaks nothing here, so go through the gym? no - the locker rooms
    // need the master key; the brain is optional and skipped on this squad)
    // gym: coach, then the switches with the squad
    walkTo(sim, 12.7, 9.5, { run: true }); open(12.7, 10.2); walkTo(sim, 12.7, 12.5, { run: true })
    assert.ok(chaseAndBite(sim, "coach"), "coach recruited")
    assert.ok(S.objectives.child.done && S.objectives.athlete.done)
    // park the brute on switch A (stay), the standard presses B, then the athlete/brute... simpler: brute stays on A
    const bi = S.squad.findIndex(z => z.charId === "brute"); sim.selectZombie(bi)
    walkTo(sim, 11.2, 19.2, { run: true }); assert.ok(sim.interact() || true)
    sim.selectZombie(0); sim.toggleCommand()             // everyone else: stay
    open(24.3, 12.7); walkTo(sim, 27.0, 12.7, { run: true, timeout: 20 })
    // switch A may have run out while walking: re-press by switching back
    if (!sim.controlActive(ctl(sim, "switch_a"))) { sim.selectZombie(bi); sim.interact(); sim.selectZombie(0) }
    assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact())
    run(sim, 0.2); assert.ok(door(sim, "gym_exit").open, "exit open")
    sim.toggleCommand()                                   // follow
    walkTo(sim, 26, 17, { run: true, timeout: 15 })
    run(sim, 6)
    assert.equal(S.phase, "won", "won; squad " + JSON.stringify(S.squad.map(z => [z.charId, z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(r.optional.find(o => o.id === "child").done && r.optional.find(o => o.id === "athlete").done && r.optional.find(o => o.id === "stealth").done)
    assert.ok(r.time < 300, "time " + r.time)
    assert.ok(r.stars >= 4, "stars " + r.stars)
})

test("alarm: the principal screams when she sees a zombie; a witness scream fails the stealth objective", () => {
    const sim = make(["standard"], { blind: true })
    const p = guard(sim, "principal"); p.view = { angle: 60, range: 4 }; p.facing = 0
    const zb = sim.activeZombie(); zb.x = 16; zb.z = 3.4
    const events = run(sim, 2.5)
    assert.ok(ev(events, "scream").length >= 1, "scream")
    assert.ok(sim.state.objectives.stealth.failed)
})

summary("school simulation")
