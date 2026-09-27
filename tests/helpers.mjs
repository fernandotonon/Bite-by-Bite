// Shared helpers for the Node rule tests: build a sim for any mission, walk the active zombie along the
// simulation's own navigation paths, collect events. Keeps the per-mission suites short.
import { loadQmlJs } from "./qmljs-load.mjs"
import { fileURLToPath } from "node:url"
import { dirname, join } from "node:path"
const here = dirname(fileURLToPath(import.meta.url))
export const cfg = (f) => loadQmlJs(join(here, "..", "app", "config", f))
export const Ch = cfg("characters.js"), Mi = cfg("campaign.js"), As = cfg("assets.js"), Tu = cfg("tuning.js").tuning
export const { createSim } = loadQmlJs(join(here, "..", "app", "scripts", "Sim.js"))
export const DT = 1 / 60

let passed = 0
export function test(name, fn) { try { fn(); passed++; console.log("ok   " + name) } catch (e) { console.log("FAIL " + name + "\n     " + (e.stack || e)); process.exitCode = 1 } }
export function summary(label) { console.log(passed + " " + label + " checks passed") }

// make("hospital_night_shift", ["standard"], { blind: true }) - blind: no human or camera can see anything
export function make(missionId, squad, opts = {}) {
    const mission = Mi.get(missionId)
    if (!mission) throw new Error("no mission " + missionId)
    const sim = createSim({ mission, characters: Ch.byId, tuning: Tu, squad: squad || ["standard"], rng: () => 0.37 })
    if (opts.blind) { for (const h of sim.state.humans) h.view = { angle: 0, range: 0 }; for (const c of sim.state.cameras) c.view = { angle: 0, range: 0 } }
    return sim
}
export function run(sim, seconds) { const out = []; for (let t = 0; t < seconds; t += DT) { sim.step(DT); out.push(...sim.takeEvents()) } return out }
export function ev(events, type) { return events.filter(e => e.type === type) }
export function guard(sim, id) { return sim.state.humans.find(h => h.id === id) }
// walk the active zombie to (x, z) along the sim's own path; returns collected events
export function walkTo(sim, x, z, opts = {}) {
    const S = sim.state, events = []
    let t = 0
    while (t < (opts.timeout || 40)) {
        const zb = sim.activeZombie()
        if (Math.hypot(zb.x - x, zb.z - z) < (opts.tolerance || 0.22)) break
        if (S.phase !== "playing") break
        const p = sim.findPath(zb.x, zb.z, x, z)[0]
        const dx = p.x - zb.x, dz = p.z - zb.z, len = Math.hypot(dx, dz) || 1
        sim.setInput({ x: dx / len, z: dz / len, run: !!opts.run, sneak: !!opts.sneak })
        sim.step(DT); t += DT
        events.push(...sim.takeEvents())
    }
    sim.setInput({ x: 0, z: 0 }); sim.step(DT); events.push(...sim.takeEvents())
    return events
}
// chase a wandering human until a bite recruits them; returns true on success
export function chaseAndBite(sim, humanId, tries = 40) {
    for (let i = 0; i < tries; i++) {
        const h = sim.state.humans.find(x => x.id === humanId)
        if (!h) return sim.state.recruited.length > 0
        walkTo(sim, h.x, h.z, { run: true, timeout: 2 })
        const zb = sim.activeZombie()
        if (Math.hypot(zb.x - h.x, zb.z - h.z) < Tu.biteRange + 0.3 && sim.bite()) {
            const events = run(sim, 2.2)
            if (ev(events, "recruit").length) return true
        }
    }
    return false
}
export function reachZone(sim, kind) { const z = sim.state.zones.find(q => q.kind === kind); return { x: z.x + z.w / 2, z: z.z + z.d / 2 } }
