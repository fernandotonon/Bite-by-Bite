// Data sanity for every mission: characters, layouts, references and the asset manifest agree.  node tests/data.test.js
import assert from "node:assert/strict"
import { Ch, Mi, As, test, summary } from "./helpers.mjs"

const LOCK_TYPES = ["maintenance", "security", "medical"]
const ZONE_KINDS = ["start", "checkpoint", "exit", "maintenance", "security", "kitchen", "office", "fire", "smoke"]
const ABILITIES = ["bite", "unlock", "sabotage", "smash", "sedate", "securityAccess", "bait", "crawl", "vault", "terminal", "rescue", "scream"]
const inBounds = (m, p) => p.x >= 0 && p.z >= 0 && p.x <= m.size.w && p.z <= m.size.d

test("characters: every roster entry is fully defined and its assets exist", () => {
    for (const c of Ch.characters) {
        assert.ok(c.id && c.occupation && c.color, c.id)
        assert.ok(As.get(c.asset), c.id + " zombie asset " + c.asset)
        if (c.humanAsset) assert.ok(As.get(c.humanAsset), c.id + " human asset " + c.humanAsset)
        if (c.capturable !== false) {
            assert.ok(c.name !== "???" && c.ability && ABILITIES.includes(c.ability.id) && c.ability.label && c.ability.hint, c.id + " ability")
            assert.ok(c.passive && c.passive.label && c.weakness && c.weakness.label && c.traits && c.speed && c.noise && c.biteTime > 0, c.id + " fields")
        }
    }
    assert.deepEqual(Ch.initialUnlocked().sort(), ["brute", "janitor", "standard"])
})

test("campaign: missions are ordered, prerequisites refer to earlier missions, ids are unique", () => {
    const ids = new Set()
    Mi.missions.forEach((m, i) => {
        assert.ok(!ids.has(m.id), "duplicate id " + m.id); ids.add(m.id)
        assert.equal(m.order, i + 1, m.id + " order")
        if (m.requiresMission) { const j = Mi.missions.findIndex(x => x.id === m.requiresMission); assert.ok(j >= 0 && j < i, m.id + " requires " + m.requiresMission); assert.ok(m.unlockText, m.id + " unlockText") }
        else assert.equal(i, 0, "only the first mission is free")
    })
    assert.equal(Mi.missions[0].id, "hospital_night_shift")
})

for (const m of Mi.missions) test("mission " + m.id + ": layout and references are valid", () => {
    assert.ok(m.title && m.story && m.briefing && m.size.w > 5 && m.size.d > 5 && m.squadLimit >= 1 && m.targetTime > 0)
    assert.ok(inBounds(m, m.spawn), "spawn in bounds")
    assert.ok(m.humans.filter(h => h.kind === "guard").length >= 1, "a guard")
    assert.ok(m.humans.some(h => h.recruit), "a capturable human")
    assert.ok(m.zones.find(z => z.kind === "checkpoint") && m.zones.find(z => z.kind === "exit"), "checkpoint + exit")
    assert.ok(m.objectives.main && m.objectives.optional.length >= 4 && m.objectives.optional.length <= 5, "4-5 optional objectives")
    for (const z of m.zones) assert.ok(ZONE_KINDS.includes(z.kind), "zone kind " + z.kind)
    for (const d of m.doors) assert.ok(!d.lockType || LOCK_TYPES.includes(d.lockType), "lock type " + d.lockType)
    for (const p of m.props) assert.ok(As.get(p.asset), "prop asset " + p.asset)
    for (const h of m.humans) {
        assert.ok(As.get(h.asset), "human asset " + h.asset)
        assert.ok(inBounds(m, h), "human in bounds " + h.id)
        for (const p of (h.patrol || h.wander || [])) assert.ok(inBounds(m, p), h.id + " waypoint in bounds")
        if (h.recruit) { const c = Ch.get(h.recruit); assert.ok(c && c.capturable !== false, h.id + " recruits a capturable character") }
    }
    for (const pn of (m.panels || [])) for (const l of pn.links) assert.ok((m.lasers || []).find(x => x.id === l) || (m.cameras || []).find(x => x.id === l), "panel link " + l)
    for (const t of (m.traversals || [])) { assert.ok(ABILITIES.includes(t.requires), "traversal requirement " + t.requires); assert.ok(inBounds(m, t.from) && inBounds(m, t.to), "traversal in bounds") }
    for (const c of (m.controls || [])) for (const l of (c.links || [])) assert.ok((m.doors || []).find(d => d.id === l) || (m.lasers || []).find(x => x.id === l) || (m.cameras || []).find(x => x.id === l) || (m.hazards || []).find(x => x.id === l), "control link " + l)
    for (const o of m.objectives.optional) {
        if (o.kind === "capture") assert.ok(m.humans.find(h => h.recruit === o.target), "capture target " + o.target)
        if (o.kind === "collectible") assert.ok(m.collectibles.find(c => c.id === o.target), "collectible " + o.target)
        if (o.kind === "control") assert.ok((m.controls || []).find(c => c.id === o.target), "control objective " + o.target)
    }
    if (m.location) assert.ok(As.get(m.location), "location asset " + m.location)
    for (const r of (m.recruits || [])) assert.ok(Ch.get(r), "recruit preview " + r)
})

test("assets: every entry has a placeholder and a height", () => {
    for (const id in As.assets) { const a = As.assets[id]; assert.ok(a.height > 0 && a.placeholder && a.placeholder.shape, id) }
})

summary("data")
