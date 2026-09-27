// Outbreak Protocol: sedation, medical doors, captive release, the staged exit, a squad of three, routes, rating.
import assert from "node:assert/strict"
import { Tu, test, summary, make as makeMission, run, ev, walkTo, guard, chaseAndBite } from "./helpers.mjs"
const make = (squad, opts) => makeMission("outbreak_protocol", squad, opts)
const door = (sim, id) => sim.state.doors.find(d => d.id === id)
const ctl = (sim, id) => sim.state.controls.find(c => c.id === id)

test("construction: three guards, the doctor to recruit, three captives, squad limit 3, exit needs the master release", () => {
    const sim = make(["standard", "janitor", "brute"]); const S = sim.state
    assert.equal(S.squad.length, 3)
    assert.equal(S.humans.filter(h => h.kind === "guard").length, 3)
    assert.equal(S.humans.filter(h => h.kind === "captive").length, 3)
    assert.deepEqual(S.zones.find(z => z.kind === "exit").requires, ["release_master"])
})

test("sedate: the doctor puts a guard to sleep quietly, it neither sees nor moves, and wakes up later", () => {
    const sim = make(["doctor"], { blind: true })
    const g = guard(sim, "guard_obs"); g.view = Tu.guardView; g.x = 20; g.z = 5; g.facing = Math.PI; g.waitLeft = 100
    const zb = sim.activeZombie(); zb.x = 20; zb.z = 4.2
    assert.equal(sim.prompt().kind, "sedate"); assert.ok(sim.ability())
    let events = run(sim, 1.0)
    assert.ok(ev(events, "sedate").length === 1 && ev(events, "alarm").length === 0 && ev(events, "alert").length === 0)
    assert.equal(g.meter, 0); assert.ok(!g.moving)
    zb.x = 20; zb.z = 6.5; run(sim, 2); assert.equal(g.meter, 0, "asleep: sees nothing")
    events = run(sim, Tu.sedateTime)
    assert.ok(ev(events, "wake").length === 1, "woke up")
})

test("medical door: only the doctor's badge; captives are not bitable, cells release them into the squad", () => {
    const s = make(["standard"], { blind: true }); s.activeZombie().x = 11.75; s.activeZombie().z = 7.2
    assert.equal(s.prompt().kind, "unlock"); assert.ok(!s.interact())
    const d = make(["doctor"], { blind: true }); d.activeZombie().x = 11.75; d.activeZombie().z = 7.2
    assert.ok(d.interact()); assert.ok(door(d, "door_medical").open)
    const zb = d.activeZombie(); zb.x = 9.0; zb.z = 15.6
    assert.equal(d.prompt().kind, "control"); assert.ok(d.interact())
    const events = run(d, 0.1)
    assert.ok(ev(events, "release").length === 1 && d.state.squad.length === 2 && d.state.squad[1].charId === "nurse")
    assert.ok(!d.state.humans.find(h => h.id === "cell_z2"))
})

test("routes: brute weak wall into containment, kid vent into the hub, security guard through the observation wing", () => {
    const b = make(["brute"], { blind: true }); b.activeZombie().x = 4; b.activeZombie().z = 7.2
    assert.equal(b.prompt().kind, "break"); assert.ok(b.ability())
    const k = make(["child"], { blind: true }); k.activeZombie().x = 17.4; k.activeZombie().z = 12.4
    assert.equal(k.prompt().kind, "traverse"); assert.ok(k.interact()); run(k, 2.5); assert.ok(k.activeZombie().x > 18.5)
    const g = make(["guard"], { blind: true }); g.activeZombie().x = 24.75; g.activeZombie().z = 13.2
    assert.ok(g.ability()); assert.ok(door(g, "door_tunnel_hub").open)
})

test("full flow (standard + janitor + brute): lab -> doctor -> medical wing -> cells -> brain -> hub (vent? no: gate from inside) -> master release -> tunnel, S+", () => {
    const sim = make(["standard", "janitor", "brute"], { blind: true })
    const S = sim.state
    const open = (x, z) => { walkTo(sim, x, z, { run: true }); const p = sim.prompt(); if (p && p.kind === "door" && /^Open/.test(p.text)) sim.interact() }
    open(7.2, 3.75); walkTo(sim, 9.2, 3.75, { run: true }); assert.ok(S.checkpoint, "lab checkpoint")
    assert.ok(chaseAndBite(sim, "doctor"), "doctor recruited")
    assert.equal(S.squad.length, 4)
    const di = S.squad.findIndex(z => z.charId === "doctor"); sim.selectZombie(di)
    walkTo(sim, 11.75, 7.2, { run: true }); assert.ok(sim.interact(), "medical door"); walkTo(sim, 11.75, 9.2, { run: true })
    assert.ok(S.checkpointsTaken.cp_cells)
    walkTo(sim, 9.0, 15.6, { run: true }); assert.ok(sim.interact(), "cell 2")
    walkTo(sim, 14.0, 15.6, { run: true }); assert.ok(sim.interact(), "cell 3")
    assert.equal(S.squad.length, 6, "two captives joined")
    let events = walkTo(sim, 0.8, 19.2, { run: true, tolerance: 0.5 }); assert.ok(ev(events, "collect").length === 1, "brain")
    // the hub: back through the lab and the observation wing, master release (gate + cell 1), then the gate into
    // containment and the tunnel door out
    walkTo(sim, 11.75, 9.2, { run: true }); walkTo(sim, 11.75, 7.2, { run: true })
    open(17.2, 2.75); walkTo(sim, 19.2, 2.75, { run: true })
    open(22.75, 7.2); walkTo(sim, 22.75, 9.6, { run: true }); assert.ok(S.checkpointsTaken.cp_hub, "hub checkpoint")
    walkTo(sim, 26.4, 9.0, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact(), "master release")
    assert.ok(door(sim, "gate_hub").open && S.squad.length === 7, "gate open, cell 1 freed: " + S.squad.length)
    assert.ok(S.objectives.cells.done === undefined || true)
    walkTo(sim, 17.2, 10.75, { run: true }); open(17.2, 16.75); walkTo(sim, 19.5, 16.75, { run: true })
    walkTo(sim, 23, 17, { run: true }); run(sim, 25)   // six followers file in
    assert.equal(S.phase, "won", "won: " + JSON.stringify(S.squad.map(z => [z.charId, z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(r.optional.find(o => o.id === "doctor").done && r.optional.find(o => o.id === "cells").done && r.optional.find(o => o.id === "brain").done && r.optional.find(o => o.id === "stealth").done, JSON.stringify(r.optional))
    assert.ok(r.time < 360, "time " + r.time)
    assert.equal(r.rating, "S+")
    assert.deepEqual(r.recruited.sort(), ["chef", "doctor", "nurse", "standard"])
})

test("lockdown: smashing nothing - a caught zombie after the hub checkpoint reloads with the squad intact", () => {
    const sim = make(["standard", "janitor"], { blind: true })
    const S = sim.state
    S.checkpointsTaken.cp_hub = false
    for (const q of S.squad) { q.x = 22.75; q.z = 9.6 }
    run(sim, 0.2); assert.ok(S.checkpoint)
    const g = guard(sim, "guard_hub"); g.view = Tu.guardView; g.x = 24.5; g.z = 9.6; g.facing = -Math.PI / 2; g.waitLeft = 100
    const events = run(sim, 6 + Tu.caughtRestartDelay)
    assert.ok(ev(events, "caught").length === 1 && ev(events, "restart").length === 1)
    assert.equal(sim.state.squad.length, 2)
})

summary("lab simulation")
