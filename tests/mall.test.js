// Mall After Closing: construction, mechanics (bait, security access, sealed shutter, dog hearing), recruitment,
// alternate routes, alarms and the rating.  node tests/mall.test.js
import assert from "node:assert/strict"
import { Tu, test, summary, make as makeMission, run, ev, walkTo, guard, chaseAndBite, reachZone } from "./helpers.mjs"
const make = (squad, opts) => makeMission("mall_after_closing", squad, opts)
const door = (sim, id) => sim.state.doors.find(d => d.id === id)

test("construction: loads with two guards, a dog, two recruitable humans and a sealed shutter", () => {
    const sim = make()
    const S = sim.state
    assert.equal(S.phase, "playing")
    assert.equal(S.humans.filter(h => h.kind === "guard").length, 2)
    assert.equal(S.humans.filter(h => h.kind === "dog").length, 1)
    assert.deepEqual(S.humans.filter(h => h.recruit).map(h => h.recruit).sort(), ["chef", "guard"])
    assert.ok(door(sim, "shutter").sealed && !door(sim, "shutter").open)
    assert.equal(S.controls.length, 2); assert.equal(S.traversals.length, 1)
})

test("security access: the security door and the shutter open cleanly only for the Security Guard zombie", () => {
    const s = make(["standard"], { blind: true })
    let zb = s.activeZombie(); zb.x = 15.75; zb.z = 13.2
    assert.equal(s.prompt().kind, "unlock"); assert.ok(!s.interact()); assert.ok(door(s, "door_dock").locked)
    const g = make(["guard"], { blind: true })
    zb = g.activeZombie(); zb.x = 15.75; zb.z = 13.2
    assert.equal(g.prompt().kind, "unlock"); assert.ok(g.ability()); assert.ok(door(g, "door_dock").open)
    zb.x = 21.4; zb.z = 18.2
    assert.equal(g.prompt().kind, "control"); assert.ok(g.interact())
    const events = g.takeEvents()
    assert.ok(ev(events, "control").length === 1 && ev(events, "alarm").length === 0, "clean control use")
    assert.ok(door(g, "shutter").open && !door(g, "shutter").sealed)
})

test("basic route: any zombie can smash the console and the shutter switch, at the price of an alarm each", () => {
    const sim = make(["standard"], { blind: true })
    const zb = sim.activeZombie(); zb.x = 26.5; zb.z = 2.3
    assert.equal(sim.prompt().kind, "controlSmash")
    assert.ok(sim.interact())
    let events = sim.takeEvents()
    assert.ok(ev(events, "smash").length && ev(events, "alarm").length && ev(events, "zap").length)
    assert.ok(door(sim, "door_dock").open, "dock door opened by the smashed console")
    assert.ok(sim.state.objectives.stealth.failed, "an alarm fails the stealth objective")
    assert.equal(guard(sim, "guard_corridor").state, "investigate")
    // the chef cannot smash electronics
    const c = make(["chef"], { blind: true }); c.activeZombie().x = 26.5; c.activeZombie().z = 2.3
    assert.equal(c.prompt().kind, "controlLocked")
})

test("bait: the chef throws food, guards and the dog go to it; the dog hears it from further away", () => {
    const sim = make(["chef"], { blind: true })
    const zb = sim.activeZombie(); zb.x = 9.5; zb.z = 8.0; zb.facing = Math.PI / 2       // throw east
    const dog = guard(sim, "dog"); dog.x = 4.6; dog.z = 8.2; dog.state = "patrol"; dog.waitLeft = 100
    const g = guard(sim, "guard_dock"); g.x = 13; g.z = 12.5; g.waitLeft = 100
    assert.equal(sim.prompt().kind, "bait")
    assert.ok(sim.ability())
    let events = run(sim, 1.0)
    assert.ok(ev(events, "bait").length === 1 && ev(events, "baitLand").length === 1)
    const land = ev(events, "baitLand")[0]
    assert.ok(land.x > 11, "food flew east " + land.x)
    assert.equal(dog.state, "investigate", "the dog heard it (7+ m away, hearing x1.8)")
    assert.ok(sim.prompt() === null || sim.prompt().kind !== "bait", "bait on cooldown")
    run(sim, 8)
    assert.ok(Math.hypot(dog.x - land.x, dog.z - land.z) < 2.5, "dog reached the food " + Math.hypot(dog.x - land.x, dog.z - land.z))
    run(sim, 12)
    assert.ok(!sim.state.pickups.find(p => p.kind === "bait"), "eaten bait vanished")
    assert.ok(["return", "patrol"].includes(dog.state), "dog goes back: " + dog.state)
})

test("dog: hears a running brute from 8 m, where a guard would not", () => {
    const sim = make(["brute"], { blind: true })
    const dog = guard(sim, "dog"); dog.x = 3; dog.z = 12; dog.waitLeft = 100
    const g = guard(sim, "guard_dock"); g.x = 3; g.z = 13; g.waitLeft = 100        // same distance, human ears
    const zb = sim.activeZombie(); zb.x = 11; zb.z = 12.5
    sim.setInput({ x: 0, z: -1, run: true }); run(sim, 0.8)
    assert.equal(dog.state, "investigate", "the dog heard the stomping")
    assert.equal(g.state, "patrol", "the guard did not")
})

test("traversal: the vent is a Kid-only shortcut into the dock", () => {
    const s = make(["standard"], { blind: true }); s.activeZombie().x = 10.5; s.activeZombie().z = 13.0
    assert.equal(s.prompt().kind, "traverseLocked"); assert.ok(!s.interact())
    const k = make(["child"], { blind: true }); const zb = k.activeZombie(); zb.x = 10.5; zb.z = 13.0
    assert.equal(k.prompt().kind, "traverse"); assert.ok(k.interact())
    assert.ok(zb.traversing && zb.hidden)
    const events = run(k, 2.5)
    assert.ok(ev(events, "traverseEnd").length === 1)
    assert.ok(!zb.traversing && zb.z > 14.5 && zb.z < 15.5, "came out in the dock at z=" + zb.z)
})

test("alternate route: the brute breaks the weak wall from the kitchen into the dock", () => {
    const b = make(["brute"], { blind: true })
    const zb = b.activeZombie(); zb.x = 3; zb.z = 13.2
    assert.equal(b.prompt().kind, "break"); assert.ok(b.ability())
    walkTo(b, 3, 15.5, { timeout: 8 })
    assert.ok(zb.z > 14.5, "brute in the dock")
})

test("full flow (standard only): store -> corridor -> chef -> bait -> guard -> dock -> shutter -> exit, ratings", () => {
    const sim = make(["standard"], { blind: true })
    const S = sim.state
    walkTo(sim, 7.2, 3.2); assert.equal(sim.prompt().kind, "door"); sim.interact()
    let events = walkTo(sim, 15.7, 7.5, { run: true })
    assert.ok(door(sim, "door_service") && sim.prompt() && sim.prompt().kind === "door", "at the service door")
    sim.interact()
    events = walkTo(sim, 15.7, 7.5, { run: true }); assert.ok(ev(events, "checkpoint").length >= 0)
    walkTo(sim, 16, 8, { run: true })
    assert.ok(S.checkpoint, "checkpoint in the service corridor")
    // chef in the kitchen (through the food court)
    walkTo(sim, 10, 8, { run: true }); walkTo(sim, 4, 12, { run: true })
    assert.ok(chaseAndBite(sim, "chef"), "chef recruited")
    assert.ok(S.objectives.chef.done)
    // brain in the kitchen corner
    events = walkTo(sim, 0.8, 13.2, { run: true }); assert.ok(ev(events, "collect").length === 1, "brain collected")
    // security guard in the office
    sim.selectZombie(0)
    walkTo(sim, 10, 8, { run: true }); walkTo(sim, 19, 3, { run: true })
    if (sim.prompt() && sim.prompt().kind === "door") sim.interact()
    walkTo(sim, 21, 3.2, { run: true })
    assert.ok(chaseAndBite(sim, "sec_guard"), "security guard recruited")
    assert.ok(S.objectives.guard.done)
    assert.equal(S.squad.length, 3, "squad limit does not cap recruits mid-mission")
    // the guard opens the dock door and the shutter
    const gi = S.squad.findIndex(z => z.charId === "guard"); sim.selectZombie(gi)
    walkTo(sim, 19, 3.2, { run: true }); walkTo(sim, 15.75, 8, { run: true }); walkTo(sim, 15.75, 13.2, { run: true })
    assert.equal(sim.prompt().kind, "unlock"); assert.ok(sim.ability()); assert.ok(door(sim, "door_dock").open)
    walkTo(sim, 21.4, 18.2, { run: true }); assert.equal(sim.prompt().kind, "control"); assert.ok(sim.interact())
    assert.ok(door(sim, "shutter").open)
    events = walkTo(sim, 25, 17, { run: true, timeout: 30 })
    run(sim, 8)   // followers arrive
    assert.equal(S.phase, "won", "won; squad at " + JSON.stringify(S.squad.map(z => [z.charId, z.x.toFixed(1), z.z.toFixed(1)])))
    const r = sim.results()
    assert.ok(r.optional.find(o => o.id === "chef").done && r.optional.find(o => o.id === "guard").done && r.optional.find(o => o.id === "brain").done && r.optional.find(o => o.id === "stealth").done)
    assert.deepEqual(r.recruited.sort(), ["chef", "guard"])
    assert.ok(r.time < 300, "time " + r.time)
    assert.equal(r.stars, 5); assert.equal(r.rating, "S+")
})

test("alarm: a smashed shutter switch fails the stealth objective and the rating drops", () => {
    const sim = make(["standard"], { blind: true })
    const S = sim.state
    const zb = sim.activeZombie(); zb.x = 21.4; zb.z = 18.2
    assert.ok(sim.interact()); run(sim, 0.1)
    assert.ok(S.alarm, "alarm raised")
    for (const q of S.squad) { q.x = 25; q.z = 17 }
    run(sim, 2)
    assert.equal(S.phase, "won")
    const r = sim.results()
    assert.ok(!r.optional.find(o => o.id === "stealth").done, "stealth failed")
    assert.equal(r.rating, "B")
})

summary("mall simulation")
