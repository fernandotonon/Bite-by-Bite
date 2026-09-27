// Firehouse Fever: fire blocks, smoke coughs, valves need the firefighter, sprinklers/fan for everyone, rescue, routes, rating.
import assert from "node:assert/strict"
import { Tu, test, summary, make as makeMission, run, ev, walkTo, guard, chaseAndBite } from "./helpers.mjs"
const make = (squad, opts) => makeMission("firehouse_fever", squad, opts)
const door = (sim, id) => sim.state.doors.find(d => d.id === id)
const ctl = (sim, id) => sim.state.controls.find(c => c.id === id)
const hz = (sim, id) => sim.state.hazards.find(h => h.id === id)

test("construction: two guards, firefighter + jogger recruits, three hazards, five controls", () => {
    const sim = make(); const S = sim.state
    assert.equal(S.humans.filter(h => h.kind === "guard").length, 2)
    assert.deepEqual(S.humans.filter(h => h.recruit).map(h => h.recruit).sort(), ["athlete", "firefighter"])
    assert.equal(S.hazards.length, 3); assert.equal(S.controls.length, 5)
    assert.ok(S.hazards.every(h => h.active))
})

test("fire: blocks a standard zombie and the nav grid, the firefighter walks through", () => {
    const s = make(["standard"], { blind: true }); let zb = s.activeZombie(); zb.x = 23.6; zb.z = 3
    s.setInput({ x: 1, z: 0 }); run(s, 2)
    assert.ok(zb.x < 24.0, "stopped at the flames " + zb.x)
    assert.ok(!s.freeAt(25, 3, Tu.zombieRadius), "fire cell not free")
    const f = make(["firefighter"], { blind: true }); zb = f.activeZombie(); zb.x = 23.6; zb.z = 3
    f.setInput({ x: 1, z: 0 }); run(f, 2)
    assert.ok(zb.x > 25.5, "firefighter crossed " + zb.x)
})

test("smoke: a standard zombie coughs (slow, noisy, stunned), the firefighter does not; the fan clears it", () => {
    const s = make(["standard"], { blind: true }); let zb = s.activeZombie(); zb.x = 21; zb.z = 7
    const g = guard(s, "guard_tower"); g.x = 24; g.z = 12; g.waitLeft = 100
    s.setInput({ x: 0, z: 1, run: true }); let events = run(s, 3)
    assert.ok(ev(events, "cough").length >= 1, "coughed")
    assert.ok(zb.z < 7 + 3 * 3.8 * 0.7, "slowed " + zb.z)
    assert.equal(g.state, "investigate", "the guard heard the coughing")
    const f = make(["firefighter"], { blind: true }); zb = f.activeZombie(); zb.x = 21; zb.z = 7
    f.setInput({ x: 0, z: 1, run: true }); events = run(f, 3)
    assert.equal(ev(events, "cough").length, 0)
    const v = make(["standard"], { blind: true }); zb = v.activeZombie(); zb.x = 26.6; zb.z = 13.2
    assert.equal(v.prompt().kind, "control"); assert.ok(v.interact()); assert.ok(!hz(v, "smoke_e").active, "smoke off")
    zb.x = 21; zb.z = 7; v.setInput({ x: 0, z: 1, run: true }); events = run(v, 2); assert.equal(ev(events, "cough").length, 0, "no more coughing")
})

test("valves need the firefighter; the sprinkler master puts both fires out for anyone", () => {
    const s = make(["standard"], { blind: true }); s.activeZombie().x = 23.2; s.activeZombie().z = 5.6
    assert.equal(s.prompt().kind, "controlLocked"); assert.ok(!s.interact()); assert.ok(hz(s, "fire_kitchen").active)
    const f = make(["firefighter"], { blind: true }); f.activeZombie().x = 23.2; f.activeZombie().z = 5.6
    assert.equal(f.prompt().kind, "control"); assert.ok(f.ability()); assert.ok(!hz(f, "fire_kitchen").active)
    const sp = make(["standard"], { blind: true }); sp.activeZombie().x = 18.6; sp.activeZombie().z = 6.8
    assert.equal(sp.prompt().kind, "control"); assert.ok(sp.interact())
    assert.ok(!hz(sp, "fire_kitchen").active && !hz(sp, "fire_tower").active && sp.state.objectives.sprinklers.done)
    assert.ok(sp.freeAt(25, 3, Tu.zombieRadius), "kitchen passable now")
})

test("full flow (standard + janitor): storage side door -> sprinklers -> firefighter -> jogger -> smoke fan -> tower -> bay switch -> exit, S+", () => {
    const sim = make(["janitor", "standard"], { blind: true })
    const S = sim.state
    const open = (x, z) => { walkTo(sim, x, z, { run: true }); const p = sim.prompt(); if (p && p.kind === "door" && /^Open/.test(p.text)) sim.interact() }
    open(13.2, 7.75); walkTo(sim, 15, 7.75, { run: true })
    walkTo(sim, 18.6, 6.8, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact(), "sprinklers")
    // firefighter in the locker room (via the bay)
    walkTo(sim, 13.2, 7.75, { run: true }); open(13.2, 2.75); walkTo(sim, 15.5, 2.75, { run: true })
    assert.ok(S.checkpoint, "locker room checkpoint")
    assert.ok(chaseAndBite(sim, "fireman"), "firefighter recruited")
    // jogger behind the (now extinguished) kitchen fire
    open(21.2, 2.75); walkTo(sim, 25, 3, { run: true })
    assert.ok(chaseAndBite(sim, "jogger"), "jogger rescued")
    // the firefighter leads through the smoke corridor to the tower and the bay switch
    const fi = S.squad.findIndex(z => z.charId === "firefighter"); sim.selectZombie(fi)
    walkTo(sim, 21.2, 2.75, { run: true }); open(21.25, 5.2); walkTo(sim, 21.25, 7, { run: true })
    walkTo(sim, 26.6, 13.2, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact(), "fan")
    open(22.75, 13.2); walkTo(sim, 22.75, 15, { run: true })
    assert.ok(S.checkpointsTaken.cp_tower, "tower checkpoint")
    walkTo(sim, 25.6, 18.8, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact(), "bay switch")
    assert.ok(door(sim, "bay_door").open)
    // back through the tower stairs (fire out) into the bay and out
    open(14.75, 16.75); walkTo(sim, 13.2, 16.75, { run: true }); walkTo(sim, 10, 12.5, { run: true }); walkTo(sim, 4, 12, { run: true, timeout: 40 })
    run(sim, 14)   // three followers arrive
    assert.equal(S.phase, "won", "won: " + JSON.stringify(S.squad.map(z => [z.charId, z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(r.optional.every(o => o.done), JSON.stringify(r.optional))
    assert.equal(r.rating, "S+")
})

test("alarm: coughing through the smoke next to the tower guard ends in a chase", () => {
    const sim = make(["standard"])
    const g = guard(sim, "guard_tower"); g.x = 23; g.z = 16; g.facing = Math.PI; g.waitLeft = 100
    const zb = sim.activeZombie(); zb.x = 23, zb.z = 13
    sim.setInput({ x: 0, z: 1 }); const events = run(sim, 6)
    assert.ok(ev(events, "alert").length >= 1 || ev(events, "caught").length >= 1)
})

summary("firehouse simulation")
