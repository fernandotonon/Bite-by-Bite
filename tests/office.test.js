// Graveyard Shift Inc.: terminals vs. sabotage, the elevator, the server-room objective, routes, recruitment, rating.
import assert from "node:assert/strict"
import { Tu, test, summary, make as makeMission, run, ev, walkTo, guard, chaseAndBite } from "./helpers.mjs"
const make = (squad, opts) => makeMission("office_graveyard_shift", squad, opts)
const door = (sim, id) => sim.state.doors.find(d => d.id === id)
const ctl = (sim, id) => sim.state.controls.find(c => c.id === id)

test("construction: two guards, an office worker to recruit, four terminals, sealed elevator and server doors", () => {
    const sim = make(); const S = sim.state
    assert.equal(S.humans.filter(h => h.kind === "guard").length, 2)
    assert.ok(S.humans.find(h => h.recruit === "office"))
    assert.equal(S.controls.length, 4)
    assert.ok(door(sim, "elevator_door").sealed && door(sim, "door_server").sealed)
})

test("terminal: the office worker opens the elevator for good; anyone else smashes it with an alarm", () => {
    const o = make(["office"], { blind: true }); let zb = o.activeZombie(); zb.x = 15.2; zb.z = 10.2
    assert.equal(o.prompt().kind, "control"); assert.ok(o.ability())
    assert.ok(door(o, "elevator_door").open && !door(o, "elevator_door").sealed)
    run(o, 40); assert.ok(door(o, "elevator_door").open, "stays open")
    const s = make(["standard"], { blind: true }); zb = s.activeZombie(); zb.x = 15.2; zb.z = 10.2
    assert.equal(s.prompt().kind, "controlSmash"); assert.ok(s.interact())
    const events = s.takeEvents(); assert.ok(ev(events, "alarm").length === 1)
    assert.ok(door(s, "elevator_door").open)
})

test("sabotage: the electrician's wiring panel opens the readers only for a while, then they seal again", () => {
    const e = make(["electrician"], { blind: true }); const zb = e.activeZombie(); zb.x = 18.6; zb.z = 11.0
    assert.equal(e.prompt().kind, "sabotage"); assert.ok(e.ability())
    assert.ok(door(e, "elevator_door").open && door(e, "door_server").open, "both readers open")
    assert.ok(!e.isCameraActive(e.state.cameras[0]))
    const events = run(e, Tu.sabotageDuration + 0.5)
    assert.ok(ev(events, "doorClosed").length >= 2, "closed again after the outage")
    assert.ok(!door(e, "elevator_door").open && !door(e, "door_server").open)
})

test("routes: security guard passes reception, janitor takes the stairwell, brute breaks into the meeting room, kid ducts up", () => {
    const g = make(["guard"], { blind: true }); g.activeZombie().x = 7.2; g.activeZombie().z = 3.75
    assert.equal(g.prompt().kind, "unlock"); assert.ok(g.ability()); assert.ok(door(g, "door_reception").open)
    const s = make(["standard"], { blind: true }); s.activeZombie().x = 7.2; s.activeZombie().z = 3.75
    assert.ok(!s.interact(), "standard cannot pass the gate")
    const j = make(["janitor"], { blind: true }); j.activeZombie().x = 2.7; j.activeZombie().z = 7.2
    assert.ok(j.ability()); assert.ok(door(j, "door_side").open)
    const b = make(["brute"], { blind: true }); b.activeZombie().x = 19.2; b.activeZombie().z = 5.0
    assert.equal(b.prompt().kind, "break"); assert.ok(b.ability())
    const k = make(["child"], { blind: true }); k.activeZombie().x = 17.2; k.activeZombie().z = 11.2
    assert.equal(k.prompt().kind, "traverse"); assert.ok(k.interact()); run(k, 2.5); assert.ok(k.activeZombie().z > 12.5)
})

test("full flow (janitor + standard): stairwell -> exec floor -> down the elevator? no: office worker first via the open-plan, server room, CEO terminal, exit", () => {
    const sim = make(["janitor", "standard"], { blind: true })
    const S = sim.state
    const open = (x, z) => { walkTo(sim, x, z, { run: true }); const p = sim.prompt(); if (p && p.kind === "door" && /^Open/.test(p.text)) sim.interact() }
    // janitor: stairwell, then the stairwell exit onto the executive floor
    walkTo(sim, 2.7, 7.2, { run: true }); assert.ok(sim.ability(), "janitor unlocks the stairwell")
    open(7.2, 14.75); walkTo(sim, 9.2, 14.75, { run: true })
    // the office worker is down in the open plan: the exec floor connects down through the elevator (sealed) - use the duct? no crawl.
    // instead: smash the elevator reader from the exec side is impossible (reader is downstairs). So: go back, take the reception gate? locked.
    // The intended janitor route: stairwell -> exec floor -> CEO terminal (smash) -> exit. The open-plan (office worker, server room) needs another way in.
    walkTo(sim, 21, 16.75, { run: true }); open(21.3, 16.75); walkTo(sim, 26.4, 15.0, { run: true })
    assert.equal(sim.prompt().kind, "controlSmash", "janitor can only smash the CEO terminal")
    assert.ok(sim.interact()); assert.ok(ctl(sim, "ceo_terminal").used)
    walkTo(sim, 10.5, 18.5, { run: true, timeout: 30 }); run(sim, 8)
    assert.equal(S.phase, "won", "won: " + JSON.stringify(S.squad.map(z => [z.charId, z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(!r.optional.find(o => o.id === "stealth").done, "the smash raised an alarm")
    assert.ok(r.time < 300)
})

test("full flow (office worker replay): reception gate? no - the clean route: standard smashes nothing, office worker recruited via the meeting-room brute wall", () => {
    // brute + standard: brute breaks into the meeting room? the meeting room is beyond the gate too. The open plan is reached
    // from reception only through the security gate (guard) - or from the stairwell? no. So the clean way in is the
    // reception gate: smashing is not offered for doors. Hence: guard zombie route, or the electrician... none of the
    // starting three can enter the open plan without alarm => the open plan is the optional half. Verify a guard-zombie replay:
    const sim = make(["guard", "standard"], { blind: true })
    const S = sim.state
    const open = (x, z) => { walkTo(sim, x, z, { run: true }); const p = sim.prompt(); if (p && p.kind === "door" && /^Open/.test(p.text)) sim.interact() }
    walkTo(sim, 7.2, 3.75, { run: true }); assert.ok(sim.ability()); walkTo(sim, 9.2, 3.75, { run: true })
    assert.ok(S.checkpoint, "checkpoint past the gate")
    walkTo(sim, 13.5, 8.5, { run: true }); assert.ok(chaseAndBite(sim, "clerk"), "office worker recruited")
    const oi = S.squad.findIndex(z => z.charId === "office"); sim.selectZombie(oi)
    walkTo(sim, 18.6, 9.2, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact()); assert.ok(door(sim, "door_server").open)
    walkTo(sim, 25.6, 9.0, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact()); assert.ok(S.objectives.server.done, "server objective")
    let events = walkTo(sim, 27.2, 11.2, { run: true, tolerance: 0.5 }); assert.ok(ev(events, "collect").length === 1, "brain")
    walkTo(sim, 15.2, 10.2, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact()); assert.ok(door(sim, "elevator_door").open)
    walkTo(sim, 13.75, 12.8, { run: true }); assert.ok(S.checkpointsTaken.cp_exec, "exec checkpoint")
    open(21.3, 16.75); walkTo(sim, 26.4, 15.0, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact())
    walkTo(sim, 10.5, 18.5, { run: true, timeout: 30 }); run(sim, 10)
    assert.equal(S.phase, "won", "won: " + JSON.stringify(S.squad.map(z => [z.charId, z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(r.optional.every(o => o.done), JSON.stringify(r.optional))
    assert.equal(r.rating, "S+")
})

summary("office simulation")
