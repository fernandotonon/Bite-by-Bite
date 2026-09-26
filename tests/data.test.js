// Data sanity: characters, missions and the asset manifest agree with each other.  node tests/data.test.js
import { loadQmlJs } from "./qmljs-load.mjs"
import assert from "node:assert/strict"
import { fileURLToPath } from "node:url"
import { dirname, join } from "node:path"
const here = dirname(fileURLToPath(import.meta.url))
const cfg = (f) => loadQmlJs(join(here, "..", "app", "config", f))
const Ch = cfg("characters.js"), Mi = cfg("missions.js"), As = cfg("assets.js")

let passed = 0
function test(name, fn) { try { fn(); passed++; console.log("ok   " + name) } catch (e) { console.log("FAIL " + name + "\n     " + (e.stack || e)); process.exitCode = 1 } }

test("characters: the four starting-roster zombies exist with ability, passive, weakness", () => {
    for (const id of ["standard", "janitor", "electrician", "brute"]) {
        const c = Ch.get(id)
        assert.ok(c, id)
        assert.ok(c.ability && c.ability.id && c.passive && c.weakness && c.speed && c.noise, id + " fields")
        assert.ok(As.get(c.asset), id + " asset " + c.asset)
    }
    assert.deepEqual(Ch.initialUnlocked().sort(), ["brute", "janitor", "standard"])
    assert.ok(Ch.characters.filter(c => !c.capturable).length >= 8, "future roster silhouettes")
})

test("mission: hospital has every required level element", () => {
    const m = Mi.get("hospital_night_shift")
    assert.ok(m)
    assert.ok(m.humans.filter(h => h.kind === "guard").length >= 2, "two guards")
    assert.ok(m.humans.find(h => h.recruit === "electrician"), "electrician")
    assert.equal(m.cameras.length, 1); assert.equal(m.lasers.length, 1); assert.equal(m.panels.length, 1)
    assert.ok(m.doors.find(d => d.lockType === "maintenance"), "maintenance door")
    assert.ok(m.props.find(p => p.movable), "movable object")
    assert.ok(m.pickups.find(p => p.kind === "radio"), "noise object")
    assert.ok(m.props.filter(p => p.hide).length >= 1, "hiding location")
    assert.ok(m.zones.find(z => z.kind === "checkpoint") && m.zones.find(z => z.kind === "exit"), "checkpoint + exit")
    assert.equal(m.collectibles.length, 1)
    assert.equal(m.objectives.optional.length, 5)
    for (const p of m.props) assert.ok(As.get(p.asset), "prop asset " + p.asset)
    for (const h of m.humans) assert.ok(As.get(h.asset), "human asset " + h.asset)
    for (const c of Ch.characters) { assert.ok(As.get(c.asset), "zombie asset " + c.asset); if (c.humanAsset) assert.ok(As.get(c.humanAsset), "human asset " + c.humanAsset) }
    for (const pn of m.panels) for (const l of pn.links) assert.ok(m.lasers.find(x => x.id === l) || m.cameras.find(x => x.id === l), "panel link " + l)
})

test("assets: every entry has a placeholder and a height", () => {
    for (const id in As.assets) { const a = As.assets[id]; assert.ok(a.height > 0 && a.placeholder && a.placeholder.shape, id) }
})

console.log(passed + " data checks passed")
