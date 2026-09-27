// Dead Air: the scream (directed noise, frozen civilians, hoarse), live microphones (alarm + stun, iron ears immune),
// the mic master, the broadcast desk, recruitment, routes and the rating.
import assert from "node:assert/strict"
import { Tu, test, summary, make as makeMission, run, ev, walkTo, guard, chaseAndBite } from "./helpers.mjs"
const make = (squad, opts) => makeMission("dead_air_studio", squad, opts)
const door = (sim, id) => sim.state.doors.find(d => d.id === id)
const ctl = (sim, id) => sim.state.controls.find(c => c.id === id)
const hz = (sim, id) => sim.state.hazards.find(h => h.id === id)

test("construction: three guards, the singer to recruit, a sonic zone, three controls, exit needs the broadcast", () => {
    const sim = make(); const S = sim.state
    assert.equal(S.humans.filter(h => h.kind === "guard").length, 3)
    assert.ok(S.humans.find(h => h.recruit === "screamer"))
    assert.equal(hz(sim, "mics").kind, "sonic"); assert.equal(S.controls.length, 3)
    assert.deepEqual(S.zones.find(z => z.kind === "exit").requires, ["broadcast"])
})

test("scream: lands ahead of the screamer, guards investigate it, civilians freeze, she is hoarse afterwards", () => {
    const sim = make(["screamer"], { blind: true })
    const zb = sim.activeZombie(); zb.x = 12; zb.z = 4; zb.facing = -Math.PI / 2     // facing west
    const g = guard(sim, "guard_lobby"); g.x = 4; g.z = 6.8; g.waitLeft = 100
    const singer = guard(sim, "singer")
    assert.ok(sim.prompt() === null || sim.prompt().kind === "scream")
    assert.ok(sim.ability())
    let events = run(sim, 0.3)
    const sc = ev(events, "screamAbility")[0]
    assert.ok(sc && sc.toX < zb.x - 3, "noise lands to the west " + sc.toX)
    assert.equal(g.state, "investigate", "the lobby guard goes to look")
    assert.ok(singer.interruptedUntil > sim.state.time, "the singer froze")
    assert.ok(sim.state.objectives.scream.done)
    assert.ok(!sim.state.alarm, "a scream outside the mic zone is not an alarm")
    sim.setInput({ x: 0, z: 1, sneak: true }); run(sim, 0.5)
    assert.ok(!zb.sneaking, "hoarse: cannot sneak")
    run(sim, Tu.hoarseTime + 0.5); sim.setInput({ x: 0, z: 1, sneak: true }); run(sim, 0.2)
    assert.ok(zb.sneaking, "voice back")
})

test("live microphones: running on the stage trips the alarm and stuns a normal zombie; the screamer shrugs it off; the mic master mutes them", () => {
    const s = make(["brute"], { blind: true }); let zb = s.activeZombie(); zb.x = 5; zb.z = 12
    s.setInput({ x: 1, z: 0, run: true }); let events = run(s, 1.2)
    assert.ok(ev(events, "sonicAlarm").length >= 1 && s.state.alarm, "on the speakers")
    assert.ok(zb.stunUntil > s.state.time - 1.6, "stunned")
    const k = make(["screamer"], { blind: true }); zb = k.activeZombie(); zb.x = 5; zb.z = 12; zb.facing = 0
    assert.ok(k.ability()); events = run(k, 0.3)
    assert.ok(ev(events, "sonicAlarm").length >= 1, "her scream on stage is an alarm too")
    assert.ok(zb.stunUntil <= k.state.time, "but iron ears are not stunned")
    const m = make(["standard"], { blind: true }); zb = m.activeZombie(); zb.x = 26.0; zb.z = 8.5
    assert.equal(m.prompt().kind, "control"); assert.ok(m.interact()); assert.ok(!hz(m, "mics").active)
    zb.x = 5; zb.z = 12; m.setInput({ x: 1, z: 0, run: true }); events = run(m, 1.2)
    assert.equal(ev(events, "sonicAlarm").length, 0, "muted")
})

test("routes: the electrician's panel opens the booth security door for a while; the guard zombie opens it for good; the kid ducts in", () => {
    const e = make(["electrician"], { blind: true }); e.activeZombie().x = 26.6; e.activeZombie().z = 11
    assert.ok(e.ability()); assert.ok(door(e, "door_booth").open); run(e, Tu.sabotageDuration + 0.5); assert.ok(!door(e, "door_booth").open)
    const g = make(["guard"], { blind: true }); g.activeZombie().x = 15.2; g.activeZombie().z = 14.75
    assert.ok(g.ability()); assert.ok(door(g, "door_booth").open)
    const k = make(["child"], { blind: true }); k.activeZombie().x = 15.4; k.activeZombie().z = 18.2
    assert.equal(k.prompt().kind, "traverse"); assert.ok(k.interact()); run(k, 2.5); assert.ok(k.activeZombie().x > 16.5)
})

test("full flow (standard + janitor): dressing rooms -> singer -> storage brain -> control room (mute + lights) -> booth stairs -> broadcast -> exit", () => {
    const sim = make(["standard", "janitor"], { blind: true })
    const S = sim.state
    const open = (x, z) => { walkTo(sim, x, z, { run: true }); const p = sim.prompt(); if (p && p.kind === "door" && /^Open/.test(p.text)) sim.interact() }
    open(7.2, 3.75); walkTo(sim, 9.2, 3.75, { run: true }); assert.ok(S.checkpoint, "dressing-room checkpoint")
    assert.ok(chaseAndBite(sim, "singer"), "singer recruited")
    // the janitor opens the prop storage for the brain
    const ji = S.squad.findIndex(z => z.charId === "janitor"); sim.selectZombie(ji)
    walkTo(sim, 15.2, 2.75, { run: true }); assert.ok(sim.ability(), "janitor unlocks storage")
    let events = walkTo(sim, 26.8, 1.2, { run: true, tolerance: 0.5 }); assert.ok(ev(events, "collect").length === 1, "brain")
    // control room: mute the mics, kill the stage camera, then the stairs down to the booth
    walkTo(sim, 15.2, 2.75, { run: true }); open(15.2, 7.25); walkTo(sim, 17.2, 7.25, { run: true })
    walkTo(sim, 26.0, 8.5, { run: true }); assert.ok(sim.interact(), "mic master")
    walkTo(sim, 18.4, 9.8, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact(), "lights")
    open(20.75, 11.2); walkTo(sim, 20.75, 13, { run: true })
    // the screamer diverts the booth guard (optional objective), then the broadcast desk is smashed
    const si = S.squad.findIndex(z => z.charId === "screamer"); sim.selectZombie(si)
    walkTo(sim, 20.75, 13, { run: true, timeout: 30 }); sim.activeZombie().facing = Math.PI / 2
    assert.ok(sim.ability(), "scream"); run(sim, 0.5); assert.ok(S.objectives.scream.done)
    sim.selectZombie(ji)
    open(21.3, 15.75); walkTo(sim, 26.4, 18.0, { run: true }); assert.equal(sim.prompt().kind, "controlSmash"); assert.ok(sim.interact(), "broadcast (smashed)")
    assert.ok(ctl(sim, "broadcast").used && S.objectives.broadcast.done)
    walkTo(sim, 25, 14, { run: true }); run(sim, 12)
    assert.equal(S.phase, "won", "won: " + JSON.stringify(S.squad.map(z => [z.charId, z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(r.optional.find(o => o.id === "screamer").done && r.optional.find(o => o.id === "brain").done && r.optional.find(o => o.id === "broadcast").done)
    assert.ok(r.time < 300)
})

summary("studio simulation")
