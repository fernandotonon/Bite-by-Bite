// Bite by Bite - the mission simulation. Deliberately Qt-free (.pragma library, no engine, no clock,
// no Math.random of its own): the presentation calls step(dt) and reads state; `node tests/sim.test.js`
// checks the rules in a second. Positions are metres (missions.js), times seconds, facing is a yaw in
// radians whose direction is (sin f, cos f) - the same convention as Qt Quick 3D's eulerRotation.y.
//
// createSim({ mission, characters, tuning, squad: [charId], rng }) -> sim
//   sim.state                  see reset(): squad, active, humans, cameras, lasers, doors, props, ... phase
//   sim.setInput({ x, z, run, sneak })   movement intent of the active zombie (x east, z south, -1..1)
//   sim.step(dt)               advance the match (0 while paused)
//   sim.interact() / bite() / ability() / switchZombie(dir) / toggleCommand() / restart()
//   sim.takeEvents()           presentation events since the last call ({ type, x, z, ... })
//   sim.prompt()               the contextual action available to the active zombie ({ text, kind } or null)
//   sim.results()              objectives / rating once phase === "won"
.pragma library

function createSim(defs) {
    var M = defs.mission, CH = defs.characters, T = defs.tuning
    var rng = defs.rng || function () { return 0.5 }
    var sim = {}
    var events = []
    var S = null
    var input = { x: 0, z: 0, run: false, sneak: false }
    var nextId = 1
    var navDirty = true, nav = null

    // what opens a locked door: an ability id, a trait, or a control (data; missions only name the lockType)
    var LOCKS = T.locks || { maintenance: { ability: "unlock", label: "Master key" }, security: { ability: "securityAccess", label: "Security access" }, medical: { trait: "medicalAccess", label: "Medical access" } }
    function canUnlock(ch, lockType) { var l = LOCKS[lockType]; if (!l) return false; return (l.ability && ch.ability && ch.ability.id === l.ability) || (l.trait && ch.traits && ch.traits[l.trait]) }
    function lockLabel(lockType) { var l = LOCKS[lockType]; return l ? l.label : lockType }
    function emit(type, extra) { var e = { type: type, time: S ? S.time : 0 }; if (extra) for (var k in extra) e[k] = extra[k]; events.push(e) }
    function clone(o) { return JSON.parse(JSON.stringify(o)) }
    function rad(deg) { return deg * Math.PI / 180 }
    function norm(a) { while (a > Math.PI) a -= 2 * Math.PI; while (a < -Math.PI) a += 2 * Math.PI; return a }
    function dist(ax, az, bx, bz) { return Math.hypot(bx - ax, bz - az) }
    function inRect(x, z, r) { return x >= r.x && x <= r.x + r.w && z >= r.z && z <= r.z + r.d }
    function charOf(zb) { return CH[zb.charId] }

    // ---- reset ------------------------------------------------------------------------------------
    function makeZombie(charId, x, z, facing) {
        return { id: "z" + (nextId++), charId: charId, x: x, z: z, facing: facing, mode: "follow", hidden: null,
                 stunUntil: 0, holding: null, bite: null, moving: false, running: false, sneaking: false,
                 speed: 0, lastNoise: 0, pushing: false }
    }
    function makeHuman(h) {
        var view = h.view || (h.kind === "guard" ? T.guardView : (h.kind === "dog" ? (T.dogView || { angle: 120, range: 3.5 }) : { angle: 0, range: 0 }))
        var isGuard = h.kind === "guard" || h.kind === "dog"
        return { id: h.id, kind: h.kind, asset: h.asset, label: h.label || h.id, x: h.x, z: h.z, facing: rad(h.facing || 0),
                 state: isGuard ? "patrol" : (h.wander ? "wander" : "idle"), view: view, hearMul: h.kind === "dog" ? (T.dogHearing || 1.8) : 1, speedMulGuard: h.kind === "dog" ? (T.dogSpeed || 1.5) : 1,
                 patrol: h.patrol || h.wander || null, patrolIndex: 0, waitLeft: 0, path: [], pathTarget: null,
                 meter: 0, meterZombie: null, lastSeen: null, lookLeft: 0, target: null, unseenFor: 0,
                 searchLeft: 0, searchPoint: null, vulnerable: !!h.vulnerable, recruit: h.recruit || null, witness: !!h.witness,
                 bitten: false, alarmed: false, speedMul: 1, noiseTarget: null, investigatePoint: null, priority: 0, moving: false }
    }
    sim.reset = function () {
        events = []; nextId = 1; navDirty = true
        S = {
            time: 0, elapsed: 0, phase: "playing", caughtAt: 0, won: false,
            squad: [], active: 0,
            humans: [], cameras: [], lasers: [], panels: [], doors: [], props: [], pickups: [], collectibles: [], zones: M.zones,
            walls: clone(M.walls), noises: [], alarm: null,
            checkpoint: null, checkpointsTaken: {},
            stats: { fullAlerts: 0, bites: 0, restarts: 0, alarms: 0 },
            objectives: {}, recruited: [], collected: [], tutorialSeen: {}, exitHold: 0, message: null, abilityUses: {}
        }
        for (var i = 0; i < defs.squad.length; i++) {
            var off = i === 0 ? 0 : (i % 2 ? 1 : -1) * 0.9 * Math.ceil(i / 2)
            S.squad.push(makeZombie(defs.squad[i], M.spawn.x, M.spawn.z + off, rad(M.spawn.facing || 0)))
        }
        for (i = 0; i < M.humans.length; i++) S.humans.push(makeHuman(M.humans[i]))
        for (i = 0; i < M.cameras.length; i++) { var c = M.cameras[i]; S.cameras.push({ id: c.id, x: c.x, z: c.z, base: rad(c.facing), sweep: rad(c.sweep), period: c.period, facing: rad(c.facing), mountHeight: c.mountHeight, disabledUntil: 0, meter: 0, meterZombie: null, cooldownUntil: 0, view: T.cameraView }) }
        for (i = 0; i < M.lasers.length; i++) { var l = M.lasers[i]; S.lasers.push({ id: l.id, x1: l.x1, z1: l.z1, x2: l.x2, z2: l.z2, height: l.height, disabledUntil: 0, trippedAt: -10 }) }
        for (i = 0; i < M.panels.length; i++) { var p = M.panels[i]; S.panels.push({ id: p.id, x: p.x, z: p.z, facing: rad(p.facing || 0), links: p.links, label: p.label, usedUntil: 0, noticeAt: 0, noticed: true, mode: null }) }
        for (i = 0; i < M.doors.length; i++) { var d = M.doors[i]; S.doors.push({ id: d.id, x: d.x, z: d.z, w: d.w, d: d.d, open: !!d.open, lockType: d.lockType || null, locked: !!d.lockType, sealed: !!d.sealed || !!(d.openedBy && d.openedBy.length), openedBy: d.openedBy || null, asset: d.asset || null, label: d.label || "Door" }) }
        S.controls = []; S.traversals = []; S.hazards = []
        for (i = 0; i < (M.hazards || []).length; i++) { var hz = M.hazards[i]; S.hazards.push({ id: hz.id, kind: hz.kind, x: hz.x, z: hz.z, w: hz.w, d: hz.d, active: hz.active !== false, label: hz.label || hz.kind }) }
        for (i = 0; i < (M.controls || []).length; i++) { var co2 = M.controls[i]; S.controls.push({ id: co2.id, kind: co2.kind || "switch", x: co2.x, z: co2.z, facing: rad(co2.facing || 0), label: co2.label || co2.kind, requires: co2.requires || null, fallback: co2.fallback || null, links: co2.links || [], asset: co2.asset || null, used: false, usedAt: -1, timed: co2.timed || 0, effect: co2.effect || "open", releases: co2.releases || null }) }
        for (i = 0; i < (M.traversals || []).length; i++) { var tr = M.traversals[i]; S.traversals.push({ id: tr.id, kind: tr.kind || "vent", requires: tr.requires, from: tr.from, to: tr.to, label: tr.label || tr.kind || "passage", asset: tr.asset || null, duration: tr.duration || 1.5 }) }
        for (i = 0; i < M.props.length; i++) { var pr = M.props[i]; S.props.push({ id: pr.id, asset: pr.asset, x: pr.x, z: pr.z, w: pr.w, d: pr.d, facing: rad(pr.facing || 0), blocksSight: !!pr.blocksSight, movable: !!pr.movable, heavy: !!pr.heavy, hide: !!pr.hide, decor: !!pr.decor, label: pr.label || pr.id, occupant: null, placeholder: !!pr.placeholder }) }
        for (i = 0; i < M.pickups.length; i++) { var pk = M.pickups[i]; S.pickups.push({ id: pk.id, kind: pk.kind, x: pk.x, z: pk.z, label: pk.label || pk.kind, heldBy: null, flying: null, playingUntil: 0 }) }
        for (i = 0; i < M.collectibles.length; i++) { var co = M.collectibles[i]; S.collectibles.push({ id: co.id, asset: co.asset, x: co.x, z: co.z, label: co.label, taken: false }) }
        S.objectives.main = { id: M.objectives.main.id, done: false }
        for (i = 0; i < M.objectives.optional.length; i++) S.objectives[M.objectives.optional[i].id] = { done: false, failed: false }
        sim.state = S
        emit("start")
    }

    // ---- geometry: blockers, line of sight, navigation ----------------------------------------------
    function blockers(forSight) {   // rectangles that block movement (or sight)
        var out = [], i
        for (i = 0; i < S.walls.length; i++) if (!S.walls[i].broken) out.push(S.walls[i])
        for (i = 0; i < S.doors.length; i++) if (!S.doors[i].open) out.push(S.doors[i])
        for (i = 0; i < S.props.length; i++) { var p = S.props[i]; if (p.decor) continue; if (!forSight || p.blocksSight) out.push(p) }
        return out
    }
    function segmentHitsRect(ax, az, bx, bz, r) {   // slab test
        var dx = bx - ax, dz = bz - az, tmin = 0, tmax = 1
        if (Math.abs(dx) < 1e-9) { if (ax < r.x || ax > r.x + r.w) return false }
        else { var t1 = (r.x - ax) / dx, t2 = (r.x + r.w - ax) / dx; if (t1 > t2) { var s = t1; t1 = t2; t2 = s } tmin = Math.max(tmin, t1); tmax = Math.min(tmax, t2); if (tmin > tmax) return false }
        if (Math.abs(dz) < 1e-9) { if (az < r.z || az > r.z + r.d) return false }
        else { var u1 = (r.z - az) / dz, u2 = (r.z + r.d - az) / dz; if (u1 > u2) { var s2 = u1; u1 = u2; u2 = s2 } tmin = Math.max(tmin, u1); tmax = Math.min(tmax, u2); if (tmin > tmax) return false }
        return true
    }
    function lineOfSight(ax, az, bx, bz) {
        var bl = blockers(true)
        for (var i = 0; i < bl.length; i++) if (segmentHitsRect(ax, az, bx, bz, bl[i])) return false
        return true
    }
    sim.lineOfSight = lineOfSight
    function rayDistance(x, z, angle, maxDist) {   // distance until the first sight blocker (for cone rendering)
        var bx = x + Math.sin(angle) * maxDist, bz = z + Math.cos(angle) * maxDist, bl = blockers(true), best = 1
        for (var i = 0; i < bl.length; i++) { var t = segmentEntry(x, z, bx, bz, bl[i]); if (t !== null && t < best) best = t }
        return best * maxDist
    }
    function segmentEntry(ax, az, bx, bz, r) {   // entry parameter of the segment into the rect, or null
        var dx = bx - ax, dz = bz - az, tmin = 0, tmax = 1
        if (Math.abs(dx) < 1e-9) { if (ax < r.x || ax > r.x + r.w) return null }
        else { var t1 = (r.x - ax) / dx, t2 = (r.x + r.w - ax) / dx; if (t1 > t2) { var s = t1; t1 = t2; t2 = s } tmin = Math.max(tmin, t1); tmax = Math.min(tmax, t2); if (tmin > tmax) return null }
        if (Math.abs(dz) < 1e-9) { if (az < r.z || az > r.z + r.d) return null }
        else { var u1 = (r.z - az) / dz, u2 = (r.z + r.d - az) / dz; if (u1 > u2) { var s2 = u1; u1 = u2; u2 = s2 } tmin = Math.max(tmin, u1); tmax = Math.min(tmax, u2); if (tmin > tmax) return null }
        return tmin
    }
    sim.rayDistance = rayDistance
    function circleHitsRect(x, z, r, rc) {
        var cx = Math.max(rc.x, Math.min(x, rc.x + rc.w)), cz = Math.max(rc.z, Math.min(z, rc.z + rc.d))
        return (x - cx) * (x - cx) + (z - cz) * (z - cz) < r * r
    }
    function freeAt(x, z, r, ignore, fireproof) {
        if (x < r || z < r || x > M.size.w - r || z > M.size.d - r) return false
        var bl = blockers(false)
        for (var i = 0; i < bl.length; i++) { if (bl[i] === ignore) continue; if (circleHitsRect(x, z, r, bl[i])) return false }
        if (!fireproof) for (i = 0; i < S.hazards.length; i++) { var hz = S.hazards[i]; if (hz.active && hz.kind === "fire" && circleHitsRect(x, z, r, hz)) return false }
        return true
    }
    function hazardAt(x, z, kind) { for (var i = 0; i < S.hazards.length; i++) { var hz = S.hazards[i]; if (hz.active && hz.kind === kind && inRect(x, z, hz)) return hz } return null }
    function moveCircle(ent, dx, dz, r, ignore) {   // axis-separated slide
        var moved = false, fp = !!(ent.charId && CH[ent.charId].traits && CH[ent.charId].traits.fireproof)
        if (dx !== 0 && freeAt(ent.x + dx, ent.z, r, ignore, fp)) { ent.x += dx; moved = true }
        if (dz !== 0 && freeAt(ent.x, ent.z + dz, r, ignore, fp)) { ent.z += dz; moved = true }
        return moved
    }
    // navigation grid for guards and followers (rebuilt when doors / walls / props change)
    function buildNav() {
        var g = T.grid, W = Math.ceil(M.size.w / g), D = Math.ceil(M.size.d / g)
        var blocked = new Array(W * D)
        var bl = blockers(false)
        for (var j = 0; j < D; j++) for (var i = 0; i < W; i++) {
            var x = (i + 0.5) * g, z = (j + 0.5) * g, b = x < 0.4 || z < 0.4 || x > M.size.w - 0.4 || z > M.size.d - 0.4
            for (var k = 0; k < bl.length && !b; k++) if (circleHitsRect(x, z, 0.38, bl[k])) b = true
            if (!b && hazardAt(x, z, "fire")) b = true
            blocked[j * W + i] = b
        }
        nav = { g: g, W: W, D: D, blocked: blocked }
        navDirty = false
    }
    function cellOf(x, z) { return { i: Math.max(0, Math.min(nav.W - 1, Math.floor(x / nav.g))), j: Math.max(0, Math.min(nav.D - 1, Math.floor(z / nav.g))) } }
    function nearestFree(c) {
        if (!nav.blocked[c.j * nav.W + c.i]) return c
        for (var r = 1; r < 6; r++) for (var dj = -r; dj <= r; dj++) for (var di = -r; di <= r; di++) {
            var i = c.i + di, j = c.j + dj
            if (i >= 0 && j >= 0 && i < nav.W && j < nav.D && !nav.blocked[j * nav.W + i]) return { i: i, j: j }
        }
        return c
    }
    function findPath(ax, az, bx, bz) {
        if (navDirty) buildNav()
        var start = nearestFree(cellOf(ax, az)), goal = nearestFree(cellOf(bx, bz))
        var W = nav.W, D = nav.D, open = [], came = {}, gs = {}, closed = {}
        function key(i, j) { return j * W + i }
        function h(i, j) { return Math.hypot(goal.i - i, goal.j - j) }
        var sk = key(start.i, start.j); gs[sk] = 0; open.push({ i: start.i, j: start.j, f: h(start.i, start.j) })
        var found = null, iter = 0
        while (open.length && iter++ < 200000) {
            var bi = 0; for (var q = 1; q < open.length; q++) if (open[q].f < open[bi].f) bi = q
            var cur = open.splice(bi, 1)[0], ck = key(cur.i, cur.j)
            if (closed[ck]) continue
            closed[ck] = true
            if (cur.i === goal.i && cur.j === goal.j) { found = cur; break }
            for (var dj = -1; dj <= 1; dj++) for (var di = -1; di <= 1; di++) {
                if (!di && !dj) continue
                var ni = cur.i + di, nj = cur.j + dj
                if (ni < 0 || nj < 0 || ni >= W || nj >= D || nav.blocked[key(ni, nj)]) continue
                if (di && dj && (nav.blocked[key(cur.i + di, cur.j)] || nav.blocked[key(cur.i, cur.j + dj)])) continue   // no corner cutting
                var ng = gs[ck] + (di && dj ? 1.414 : 1), nk = key(ni, nj)
                if (closed[nk]) continue
                if (gs[nk] === undefined || ng < gs[nk]) { gs[nk] = ng; came[nk] = ck; open.push({ i: ni, j: nj, f: ng + h(ni, nj) }) }
            }
        }
        if (!found) return [{ x: bx, z: bz }]
        var pts = [], k = key(found.i, found.j)
        while (k !== undefined && k !== sk) { pts.push({ x: (k % W + 0.5) * nav.g, z: (Math.floor(k / W) + 0.5) * nav.g }); k = came[k] }
        pts.reverse(); pts.push({ x: bx, z: bz })
        // string pulling against movement blockers
        var out = [], from = { x: ax, z: az }, idx = 0
        while (idx < pts.length) {
            var far = idx
            for (var t = pts.length - 1; t > idx; t--) if (walkClear(from.x, from.z, pts[t].x, pts[t].z)) { far = t; break }
            out.push(pts[far]); from = pts[far]; idx = far + 1
        }
        return out
    }
    function walkClear(ax, az, bx, bz) {
        var bl = blockers(false), r = 0.36
        for (var i = 0; i < bl.length; i++) { var b = bl[i]; if (segmentHitsRect(ax, az, bx, bz, { x: b.x - r, z: b.z - r, w: b.w + 2 * r, d: b.d + 2 * r })) return false }
        return true
    }
    function followPath(ent, speed, dt, r) {   // returns true when the path is finished
        while (ent.path.length) {
            var p = ent.path[0], d = dist(ent.x, ent.z, p.x, p.z)
            if (d < 0.12) { ent.path.shift(); continue }
            var stepLen = Math.min(d, speed * dt), dx = (p.x - ent.x) / d * stepLen, dz = (p.z - ent.z) / d * stepLen
            ent.facing = norm(ent.facing + norm(Math.atan2(p.x - ent.x, p.z - ent.z) - ent.facing) * Math.min(1, dt * 10))
            if (!moveCircle(ent, dx, dz, r || T.humanRadius)) { ent.stuck = (ent.stuck || 0) + dt; if (ent.stuck > 0.6) { ent.path = []; ent.stuck = 0; return true } } else ent.stuck = 0
            ent.moving = true
            return false
        }
        return true
    }

    // ---- zombies ------------------------------------------------------------------------------------
    function active() { return S.squad[S.active] }
    function zoneAt(x, z, kind) { for (var i = 0; i < S.zones.length; i++) if (S.zones[i].kind === kind && inRect(x, z, S.zones[i])) return S.zones[i]; return null }
    function addNoise(x, z, radius, kind, source) {
        if (radius <= 0) return
        S.noises.push({ x: x, z: z, radius: radius, kind: kind, time: S.time, source: source || null }); emit("noise", { x: x, z: z, radius: radius, kind: kind })
        var sonic = hazardAt(x, z, "sonic")                      // live microphones: any noise here is on the studio speakers
        if (sonic && kind !== "door" && kind !== "control" && S.time - (sonic.trippedAt || -10) > 3) {
            sonic.trippedAt = S.time
            raiseAlarm(x, z, "sonic")
            for (var i = 0; i < S.squad.length; i++) { var q = S.squad[i], cq = charOf(q); if (inRect(q.x, q.z, sonic) && !(cq.traits && cq.traits.sonicProof)) q.stunUntil = Math.max(q.stunUntil, S.time + (T.sonicStun || 1.5)) }
            emit("sonicAlarm", { x: x, z: z })
        }
    }

    function stepActive(dt) {
        var zb = active(), ch = charOf(zb)
        var hoarse = S.time < (zb.hoarseUntil || 0)
        zb.moving = false; zb.running = false; zb.sneaking = input.sneak && !hoarse; zb.pushing = false
        if (zb.bite || zb.traversing) return
        if (S.time < zb.stunUntil) return
        var mx = input.x, mz = input.z, len = Math.hypot(mx, mz)
        if (len < 0.15) return
        if (zb.hidden) { unhide(zb) }
        if (len > 1) { mx /= len; mz /= len }
        var speed = zb.sneaking ? ch.speed.sneak : (input.run ? ch.speed.run : ch.speed.walk)
        if (!(ch.traits && ch.traits.fireproof) && hazardAt(zb.x, zb.z, "smoke")) {   // coughing in the smoke: slow, noisy, stunned now and then
            speed *= T.smokeSlow || 0.6
            if (S.time - (zb.coughAt || -10) > (T.coughEvery || 2.5)) { zb.coughAt = S.time; zb.stunUntil = S.time + (T.coughStun || 0.8); addNoise(zb.x, zb.z, T.coughNoise || 4, "cough", zb.id); emit("cough", { x: zb.x, z: zb.z, zombie: zb.id }) }
        }
        zb.running = !!input.run && !input.sneak
        zb.facing = Math.atan2(mx, mz)
        var dx = mx * speed * dt, dz = mz * speed * dt
        // pushing a movable prop: the prop moves first, the zombie follows into the freed space
        for (var i = 0; i < S.props.length; i++) {
            var p = S.props[i]
            if (!p.movable) continue
            var wouldHit = circleHitsRect(zb.x + dx, zb.z + dz, T.zombieRadius, p)
            if (!wouldHit) continue
            if ((p.heavy && !(ch.traits && ch.traits.heavyHands)) || (ch.traits && ch.traits.noPush)) { S.message = { text: "Too heavy for " + ch.name, until: S.time + 1.5 }; continue }
            var pushSpeed = Math.min(speed, T.cartPushSpeed) * dt
            var px = Math.abs(mx) > Math.abs(mz) ? Math.sign(mx) * pushSpeed : 0, pz = Math.abs(mx) > Math.abs(mz) ? 0 : Math.sign(mz) * pushSpeed
            var moved = { x: p.x + px, z: p.z + pz, w: p.w, d: p.d }
            var free = moved.x > 0.3 && moved.z > 0.3 && moved.x + moved.w < M.size.w - 0.3 && moved.z + moved.d < M.size.d - 0.3
            var bl = blockers(false)
            for (var k = 0; k < bl.length && free; k++) { if (bl[k] === p) continue; if (rectsOverlap(moved, bl[k])) free = false }
            for (var hIdx = 0; hIdx < S.humans.length && free; hIdx++) if (circleHitsRect(S.humans[hIdx].x, S.humans[hIdx].z, T.humanRadius, moved)) free = false
            if (free) { p.x = moved.x; p.z = moved.z; navDirty = true; zb.pushing = true; if (S.time - zb.lastNoise > 0.8) { addNoise(p.x + p.w / 2, p.z + p.d / 2, 2.5, "push"); zb.lastNoise = S.time } }
        }
        var before = { x: zb.x, z: zb.z }
        moveCircle(zb, dx, dz, T.zombieRadius)
        zb.moving = dist(before.x, before.z, zb.x, zb.z) > 1e-5
        zb.speed = zb.moving ? speed : 0
        if (zb.moving) {
            var noiseR = zb.running ? ch.noise.run : (zb.sneaking ? 0 : ch.noise.walk)
            if (hoarse) noiseR = Math.max(noiseR, 2.5)             // wheezing after the scream
            if (ch.traits && ch.traits.quiet) noiseR *= 0.5
            if (noiseR > 0 && S.time - zb.lastNoise > 0.6) { addNoise(zb.x, zb.z, noiseR * T.hearRange, "steps", zb.id); zb.lastNoise = S.time }
        }
    }
    function rectsOverlap(a, b) { return a.x < b.x + b.w && a.x + a.w > b.x && a.z < b.z + b.d && a.z + a.d > b.z }

    function stepFollowers(dt) {
        var leader = active()
        for (var i = 0; i < S.squad.length; i++) {
            var zb = S.squad[i]
            if (zb === leader) continue
            zb.running = false; zb.sneaking = leader.sneaking; zb.moving = false
            if (zb.mode !== "follow" || zb.hidden || S.time < zb.stunUntil || zb.bite || zb.traversing) continue
            var d = dist(zb.x, zb.z, leader.x, leader.z)
            if (d < T.followDistance) { zb.path = []; continue }
            if (!zb.path || !zb.path.length || S.time - (zb.pathAt || -1) > 0.5) { zb.path = findPath(zb.x, zb.z, leader.x, leader.z); zb.pathAt = S.time }
            var ch = charOf(zb), base = leader.speed > 0 ? Math.min(leader.speed * T.followCatchUp, ch.speed.run) : ch.speed.walk
            if (leader.sneaking) base = Math.min(base, ch.speed.sneak)
            var speed = d > 4 ? Math.max(base, ch.speed.run) : base
            var was = { x: zb.x, z: zb.z }
            followPath(zb, speed, dt, T.zombieRadius)
            zb.moving = dist(was.x, was.z, zb.x, zb.z) > 1e-5
            zb.running = speed > ch.speed.walk + 0.01
            zb.speed = zb.moving ? speed : 0
            if (zb.moving && !leader.sneaking) { var nr = zb.running ? ch.noise.run : ch.noise.walk; if (ch.traits && ch.traits.quiet) nr *= 0.5; if (nr > 0 && S.time - zb.lastNoise > 0.6) { addNoise(zb.x, zb.z, nr * T.hearRange, "steps", zb.id); zb.lastNoise = S.time } }
        }
    }
    function unhide(zb) {   // step back out to where the zombie stood before hiding: the hiding spot itself blocks movement
        if (!zb.hidden || zb.hidden === "__traversal") return
        var p = propById(zb.hidden); if (p) p.occupant = null
        zb.hidden = null
        if (zb.hideReturn && freeAt(zb.hideReturn.x, zb.hideReturn.z, T.zombieRadius)) { zb.x = zb.hideReturn.x; zb.z = zb.hideReturn.z }
        else if (p) {   // spot taken meanwhile: try the four sides of the prop
            var cands = [[p.x + p.w / 2, p.z + p.d + 0.5], [p.x + p.w / 2, p.z - 0.5], [p.x + p.w + 0.5, p.z + p.d / 2], [p.x - 0.5, p.z + p.d / 2]]
            for (var i = 0; i < cands.length; i++) if (freeAt(cands[i][0], cands[i][1], T.zombieRadius)) { zb.x = cands[i][0]; zb.z = cands[i][1]; break }
        }
        zb.hideReturn = null
        emit("unhide", { zombie: zb.id })
    }
    function propById(id) { for (var i = 0; i < S.props.length; i++) if (S.props[i].id === id) return S.props[i]; return null }
    function laserById(id) { for (var i = 0; i < S.lasers.length; i++) if (S.lasers[i].id === id) return S.lasers[i]; return null }
    function cameraById(id) { for (var i = 0; i < S.cameras.length; i++) if (S.cameras[i].id === id) return S.cameras[i]; return null }

    // ---- interaction ------------------------------------------------------------------------------
    function nearest(list, x, z, range, filter) {
        var best = null, bd = range
        for (var i = 0; i < list.length; i++) {
            var it = list[i]; if (filter && !filter(it)) continue
            var ix = it.w !== undefined ? Math.max(it.x, Math.min(x, it.x + it.w)) : it.x
            var iz = it.d !== undefined ? Math.max(it.z, Math.min(z, it.z + it.d)) : it.z
            var d = dist(x, z, ix, iz)
            if (d < bd) { bd = d; best = it }
        }
        return best
    }
    function facingHuman(zb, h) {   // is the zombie behind the human? (human looks away from the zombie)
        var toZ = Math.atan2(zb.x - h.x, zb.z - h.z)
        return Math.abs(norm(toZ - h.facing)) > Math.PI * 0.55
    }
    function candidates(zb) {
        var ch = charOf(zb), R = T.interactRange, out = []
        var held = null
        for (var i = 0; i < S.pickups.length; i++) if (S.pickups[i].heldBy === zb.id) held = S.pickups[i]
        if (held) out.push({ kind: "throw", text: "Throw " + held.label, target: held })
        var d = nearest(S.doors, zb.x, zb.z, R + 0.2, function (dd) { return !dd.sealed && !dd.tempUntil })
        if (d) {
            if (d.locked) { var lk = LOCKS[d.lockType] || {}; out.push({ kind: "unlock", text: (canUnlock(ch, d.lockType) ? "Unlock " : "Locked: ") + d.label, target: d, needs: lk.ability || null }) }
            else out.push({ kind: "door", text: (d.open ? "Close " : "Open ") + d.label, target: d })
        }
        var ctl = nearest(S.controls, zb.x, zb.z, R + 0.3, function (c) { return !c.used || c.timed })
        if (ctl) {
            var can = !ctl.requires || (ch.ability && ch.ability.id === ctl.requires) || (ch.traits && ch.traits[ctl.requires])
            if (can) out.push({ kind: "control", text: (ctl.kind === "shutter" ? "Open " : "Use ") + ctl.label, target: ctl, needs: ctl.requires || null })
            else if (ctl.fallback === "smash" && !(ch.traits && ch.traits.noSmash)) out.push({ kind: "controlSmash", text: "Smash " + ctl.label + " (alarm!)", target: ctl })
            else out.push({ kind: "controlLocked", text: ctl.label + ": needs " + ctl.requires, target: ctl, needs: ctl.requires })
        }
        var tv = nearest(S.traversals.map(function (t) { return { x: t.from.x, z: t.from.z, t: t, end: "from" } }).concat(S.traversals.map(function (t) { return { x: t.to.x, z: t.to.z, t: t, end: "to" } })), zb.x, zb.z, R)
        if (tv) {
            var canT = (ch.ability && ch.ability.id === tv.t.requires) || (ch.traits && ch.traits[tv.t.requires])
            out.push(canT ? { kind: "traverse", text: (tv.t.kind === "vault" ? "Vault over " : "Crawl through ") + tv.t.label, target: tv.t, end: tv.end, needs: tv.t.requires }
                          : { kind: "traverseLocked", text: tv.t.label + ": needs " + tv.t.requires, target: tv.t, needs: tv.t.requires })
        }
        if (ch.ability && ch.ability.id === "bait" && !held && S.time >= (zb.baitReadyAt || 0)) out.push({ kind: "bait", text: "Throw food bait", target: zb, needs: "bait", low: true })
        if (ch.ability && ch.ability.id === "scream" && S.time >= (zb.screamReadyAt || 0)) out.push({ kind: "scream", text: "SCREAM", target: zb, needs: "scream", low: true })
        var pk = nearest(S.pickups, zb.x, zb.z, R, function (p) { return !p.heldBy && !p.flying })
        if (pk && !held) out.push({ kind: "pickup", text: "Pick up " + pk.label, target: pk })
        var hp = nearest(S.props, zb.x, zb.z, R, function (p) { return p.hide && !p.occupant })
        if (hp) out.push({ kind: "hide", text: "Hide in " + hp.label, target: hp })
        var pn = nearest(S.panels, zb.x, zb.z, R + 0.3, function (p) { return S.time >= p.usedUntil })
        if (pn && ch.ability && ch.ability.id === "sabotage") out.push({ kind: "sabotage", text: "Sabotage " + pn.label, target: pn, needs: "sabotage" })
        else if (pn && !(ch.traits && ch.traits.noSmash)) out.push({ kind: "smash", text: "Smash " + pn.label + " (alarm!)", target: pn })
        var ww = nearest(S.walls, zb.x, zb.z, R + 0.2, function (w) { return w.weak && !w.broken })
        if (ww) out.push({ kind: "break", text: (ch.traits && ch.traits.heavyHands ? "Break weak wall" : "Weak wall (needs Brute)"), target: ww, needs: "smash" })
        var hu = nearest(S.humans, zb.x, zb.z, T.biteRange + 0.3, function (h) { return h.vulnerable && !h.bitten && h.kind !== "captive" })
        if (hu) out.push({ kind: "bite", text: "Bite " + hu.label, target: hu })
        if (ch.ability && ch.ability.id === "sedate" && S.time >= (zb.sedateReadyAt || 0)) {
            var sh = nearest(S.humans, zb.x, zb.z, T.biteRange + 0.5, function (h) { return !h.bitten && h.kind !== "captive" && !(h.sedatedUntil > S.time) })
            if (sh) out.push({ kind: "sedate", text: "Sedate " + sh.label, target: sh, needs: "sedate" })
        }
        return out
    }
    function pickCandidate(c) {   // the contextual action: anything specific beats the bite, the bite beats "low" ability offers
        var pick = null
        for (var i = 0; i < c.length; i++) if (c[i].kind !== "bite" && !c[i].low) { pick = c[i]; break }
        if (!pick) for (i = 0; i < c.length; i++) if (c[i].kind === "bite") { pick = c[i]; break }
        return pick || c[0]
    }
    sim.prompt = function () {
        if (!S || S.phase !== "playing") return null
        var zb = active(); if (zb.hidden) return { kind: "unhide", text: "Leave hiding" }
        if (zb.traversing) return null
        var c = candidates(zb); if (!c.length) return null
        var pick = pickCandidate(c)
        return { kind: pick.kind, text: pick.text, needs: pick.needs || null, target: pick.target.id }
    }
    function perform(zb, c) {
        var ch = charOf(zb), t = c.target
        switch (c.kind) {
        case "door": t.open = !t.open; navDirty = true; emit("door", { x: t.x, z: t.z, open: t.open }); addNoise(t.x, t.z, 1.5, "door"); return true
        case "unlock":
            if (canUnlock(ch, t.lockType)) { t.locked = false; t.open = true; navDirty = true; emit("unlock", { x: t.x, z: t.z }); return true }
            S.message = { text: t.label + " is locked (needs " + lockLabel(t.lockType) + ")", until: S.time + 2 }; emit("locked", { x: t.x, z: t.z }); return false
        case "control": useControl(t, zb, false); return true
        case "controlSmash": useControl(t, zb, true); return true
        case "controlLocked": S.message = { text: t.label + " needs " + t.requires, until: S.time + 2 }; emit("locked", { x: t.x, z: t.z }); return false
        case "traverse": startTraverse(zb, t, c.end); return true
        case "traverseLocked": S.message = { text: t.label + " needs " + t.requires, until: S.time + 2 }; return false
        case "bait": throwBait(zb); return true
        case "scream": scream(zb); return true
        case "sedate":
            t.sedatedUntil = S.time + (T.sedateTime || 12); t.meter = 0; t.path = []; t.moving = false
            if (t.state === "alert" || t.state === "suspicious" || t.state === "investigate" || t.state === "search") { t.state = "return"; t.priority = 0 }
            zb.sedateReadyAt = S.time + (T.sedateCooldown || 6)
            noteAbility("sedate"); emit("sedate", { x: t.x, z: t.z, human: t.id }); return true
        case "pickup": t.heldBy = zb.id; emit("pickup", { x: t.x, z: t.z, item: t.id }); return true
        case "throw": throwPickup(zb, t); return true
        case "hide": zb.hidden = t.id; t.occupant = zb.id; zb.hideReturn = { x: zb.x, z: zb.z }; zb.x = t.x + t.w / 2; zb.z = t.z + t.d / 2; emit("hide", { x: zb.x, z: zb.z }); return true
        case "sabotage":
            t.usedUntil = S.time + T.sabotageDuration; t.noticeAt = S.time + T.sabotageNoticeDelay; t.noticed = false; t.mode = "sabotage"
            setLinks(t, S.time + T.sabotageDuration); emit("sabotage", { x: t.x, z: t.z, duration: T.sabotageDuration }); return true
        case "smash":
            t.usedUntil = S.time + T.smashDuration; t.noticed = true; t.mode = "smash"
            setLinks(t, S.time + T.smashDuration)
            if (!(ch.traits && ch.traits.insulated)) { zb.stunUntil = S.time + T.smashZapStun; emit("zap", { x: zb.x, z: zb.z, zombie: zb.id }) }
            raiseAlarm(t.x, t.z, "panel"); emit("smash", { x: t.x, z: t.z, duration: T.smashDuration }); return true
        case "break":
            if (ch.traits && ch.traits.heavyHands) { t.broken = true; navDirty = true; addNoise(t.x + t.w / 2, t.z + t.d / 2, 8, "crash"); emit("wallBreak", { x: t.x + t.w / 2, z: t.z + t.d / 2 }); return true }
            S.message = { text: "Only a Brute can break this wall", until: S.time + 2 }; return false
        case "bite": startBite(zb, t); return true
        }
        return false
    }
    function useControl(ctl, zb, smashed) {
        var ch = charOf(zb)
        ctl.used = true; ctl.usedAt = S.time; ctl.smashed = !!smashed
        for (var i = 0; i < ctl.links.length; i++) {
            var id = ctl.links[i]
            for (var k = 0; k < S.doors.length; k++) if (S.doors[k].id === id && !S.doors[k].openedBy) { var d = S.doors[k]; d.open = ctl.effect !== "close"; d.locked = false; if (!ctl.timed) d.sealed = ctl.effect === "close" ? d.sealed : false; navDirty = true }
            var l = laserById(id); if (l) l.disabledUntil = 1e9
            var c = cameraById(id); if (c) { c.disabledUntil = 1e9; c.meter = 0 }
            for (k = 0; k < (S.hazards || []).length; k++) if (S.hazards[k].id === id && S.hazards[k].active) { S.hazards[k].active = false; navDirty = true; emit("hazardOff", { x: S.hazards[k].x + S.hazards[k].w / 2, z: S.hazards[k].z + S.hazards[k].d / 2, kind: S.hazards[k].kind }) }
        }
        if (ctl.timed) ctl.closesAt = S.time + ctl.timed
        if (ctl.releases) for (i = 0; i < S.humans.length; i++) { var cap = S.humans[i]; if (cap.id === ctl.releases && cap.kind === "captive" && !cap.removed) releaseCaptive(cap) }
        for (i = 0; i < M.objectives.optional.length; i++) { var o = M.objectives.optional[i]; if (o.kind === "control" && o.target === ctl.id) S.objectives[o.id].done = true }
        if (smashed) {
            if (!(ch.traits && ch.traits.insulated)) { zb.stunUntil = S.time + T.smashZapStun; emit("zap", { x: zb.x, z: zb.z, zombie: zb.id }) }
            raiseAlarm(ctl.x, ctl.z, "control"); emit("smash", { x: ctl.x, z: ctl.z, duration: 0 })
        } else { addNoise(ctl.x, ctl.z, 1.5, "control"); emit("control", { x: ctl.x, z: ctl.z, id: ctl.id, kind: ctl.kind }) }
        takeCheckpoint("control_" + ctl.id)
    }
    function startTraverse(zb, tr, end) {
        var dest = end === "from" ? tr.to : tr.from
        zb.traversing = { to: dest, left: tr.duration, id: tr.id }
        zb.hidden = "__traversal"          // out of sight while inside the passage
        emit("traverseStart", { x: zb.x, z: zb.z, id: tr.id })
    }
    function releaseCaptive(h) {   // a contained zombie joins the squad
        h.removed = true
        var nz = makeZombie(h.recruit, h.x, h.z, h.facing); nz.mode = "follow"
        S.squad.push(nz)
        if (S.recruited.indexOf(h.recruit) < 0) S.recruited.push(h.recruit)
        emit("release", { x: h.x, z: h.z, charId: h.recruit, zombie: nz.id })
    }
    function controlActive(c) { return c.used && (!c.timed || S.time < c.closesAt) }
    function controlById(id) { for (var i = 0; i < S.controls.length; i++) if (S.controls[i].id === id) return S.controls[i]; return null }
    function stepControls() {
        var i, k
        for (i = 0; i < S.controls.length; i++) {
            var c = S.controls[i]
            if (c.timed && c.used && S.time >= c.closesAt) {           // a timed control runs out: its links close again, it can be used anew
                c.used = false
                for (k = 0; k < c.links.length; k++) for (var j = 0; j < S.doors.length; j++) if (S.doors[j].id === c.links[k] && !S.doors[j].openedBy) { S.doors[j].open = false; navDirty = true }
                emit("controlExpired", { x: c.x, z: c.z, id: c.id })
            }
        }
        for (i = 0; i < S.doors.length; i++) {                       // temporarily opened doors (a sabotaged panel) close again
            var dt2 = S.doors[i]
            if (dt2.tempUntil && S.time >= dt2.tempUntil) { dt2.tempUntil = null; if (dt2.locked || dt2.sealed) { dt2.open = false; navDirty = true; emit("doorClosed", { x: dt2.x, z: dt2.z, id: dt2.id }) } }
        }
        for (i = 0; i < S.doors.length; i++) {                       // doors that need every listed control active at once
            var d = S.doors[i]; if (!d.openedBy) continue
            var all = true
            for (k = 0; k < d.openedBy.length; k++) { var ctl = controlById(d.openedBy[k]); if (!ctl || !controlActive(ctl)) all = false }
            if (all !== d.open) { d.open = all; navDirty = true; emit(all ? "door" : "doorClosed", { x: d.x, z: d.z, open: all, id: d.id }) }
        }
    }
    function stepTraversals(dt) {
        for (var i = 0; i < S.squad.length; i++) {
            var zb = S.squad[i]; if (!zb.traversing) continue
            zb.traversing.left -= dt
            if (zb.traversing.left <= 0) { zb.x = zb.traversing.to.x; zb.z = zb.traversing.to.z; zb.hidden = null; emit("traverseEnd", { x: zb.x, z: zb.z, id: zb.traversing.id }); zb.traversing = null; if (S.active === i) input.x = input.z = 0 }
        }
    }
    function scream(zb) {
        var reach = T.screamReach || 4, radius = T.screamNoise || 11
        var nx = zb.x + Math.sin(zb.facing) * reach, nz = zb.z + Math.cos(zb.facing) * reach      // directed: the noise lands ahead of her
        nx = Math.max(0.5, Math.min(M.size.w - 0.5, nx)); nz = Math.max(0.5, Math.min(M.size.d - 0.5, nz))
        addNoise(nx, nz, radius, "scream", zb.id)
        for (var i = 0; i < S.humans.length; i++) {           // civilians nearby freeze for a moment
            var h = S.humans[i]
            if (h.kind === "civilian" && !h.bitten && dist(h.x, h.z, zb.x, zb.z) <= radius) { h.interruptedUntil = S.time + (T.interruptTime || 3); h.meter = 0; h.path = [] }
        }
        zb.screamReadyAt = S.time + (T.screamCooldown || 10)
        zb.hoarseUntil = S.time + (T.hoarseTime || 4)
        noteAbility("scream")
        emit("screamAbility", { x: zb.x, z: zb.z, toX: nx, toZ: nz, zombie: zb.id })
    }
    function noteAbility(id) {
        S.abilityUses[id] = (S.abilityUses[id] || 0) + 1
        for (var i = 0; i < M.objectives.optional.length; i++) { var o = M.objectives.optional[i]; if (o.kind === "ability" && o.target === id) S.objectives[o.id].done = true }
    }
    function throwBait(zb) {
        var b = { id: "bait" + (nextId++), kind: "bait", x: zb.x, z: zb.z, label: "Food bait", heldBy: null, flying: null, playingUntil: 0, temporary: true }
        S.pickups.push(b)
        zb.baitReadyAt = S.time + (T.baitCooldown || 8)
        throwPickup(zb, b)
        emit("bait", { x: zb.x, z: zb.z, zombie: zb.id })
    }
    function setLinks(panel, until) {
        for (var i = 0; i < panel.links.length; i++) {
            var l = laserById(panel.links[i]); if (l) l.disabledUntil = until
            var c = cameraById(panel.links[i]); if (c) { c.disabledUntil = until; c.meter = 0 }
            for (var k = 0; k < S.doors.length; k++) if (S.doors[k].id === panel.links[i]) {   // badge readers / elevators: open until the outage ends
                var d = S.doors[k]; d.open = true; d.tempUntil = until; navDirty = true
            }
        }
    }
    function throwPickup(zb, p) {
        p.heldBy = null
        var tx = zb.x, tz = zb.z, dx = Math.sin(zb.facing), dz = Math.cos(zb.facing)
        var steps = Math.floor(T.radioThrow / 0.25)
        for (var i = 0; i < steps; i++) { if (!freeAt(tx + dx * 0.25, tz + dz * 0.25, 0.2)) break; tx += dx * 0.25; tz += dz * 0.25 }
        p.flying = { fromX: zb.x, fromZ: zb.z, toX: tx, toZ: tz, t: 0, duration: 0.6 }
        p.x = zb.x; p.z = zb.z
        emit("throw", { x: zb.x, z: zb.z, toX: tx, toZ: tz, item: p.id })
    }
    function startBite(zb, h) {
        var ch = charOf(zb), time = ch.biteTime || 1.5
        if (facingHuman(zb, h)) time *= T.biteBehindBonus
        zb.bite = { target: h.id, left: time, total: time }
        zb.facing = Math.atan2(h.x - zb.x, h.z - zb.z)
        emit("biteStart", { x: h.x, z: h.z, zombie: zb.id, human: h.id })
    }
    function humanById(id) { for (var i = 0; i < S.humans.length; i++) if (S.humans[i].id === id) return S.humans[i]; return null }
    function finishBite(zb) {
        var h = humanById(zb.bite.target); zb.bite = null
        if (!h || h.bitten) return
        h.bitten = true; h.state = "turned"; h.vulnerable = false; h.witness = false; h.meter = 0; h.path = []; h.moving = false
        S.stats.bites++
        emit("bite", { x: h.x, z: h.z, human: h.id })
        if (h.recruit) {
            var nz = makeZombie(h.recruit, h.x, h.z, h.facing)
            nz.mode = "follow"
            S.squad.push(nz)
            if (S.recruited.indexOf(h.recruit) < 0) S.recruited.push(h.recruit)
            h.removed = true
            for (var i = 0; i < M.objectives.optional.length; i++) { var o = M.objectives.optional[i]; if (o.kind === "capture" && o.target === h.recruit) S.objectives[o.id].done = true }
            emit("recruit", { x: h.x, z: h.z, charId: h.recruit, zombie: nz.id })
            takeCheckpoint("recruit_" + h.id)
        }
    }
    sim.interact = function () {
        if (S.phase !== "playing") return false
        var zb = active(); if (zb.bite || S.time < zb.stunUntil) return false
        if (zb.traversing) return false
        if (zb.hidden) { unhide(zb); return true }
        var c = candidates(zb); if (!c.length) return false
        return perform(zb, pickCandidate(c))
    }
    sim.bite = function () {
        if (S.phase !== "playing") return false
        var zb = active(); if (zb.bite || zb.hidden || S.time < zb.stunUntil) return false
        var c = candidates(zb)
        for (var i = 0; i < c.length; i++) if (c[i].kind === "bite") return perform(zb, c[i])
        S.message = { text: "No one to bite here", until: S.time + 1.2 }
        return false
    }
    sim.ability = function () {
        if (S.phase !== "playing") return false
        var zb = active(), ch = charOf(zb); if (zb.bite || zb.hidden || S.time < zb.stunUntil || zb.traversing) return false
        var id = ch.ability ? ch.ability.id : "bite"
        if (id === "bite") return sim.bite()
        var c = candidates(zb)
        for (var i = 0; i < c.length; i++) if (c[i].needs === id) return perform(zb, c[i])
        S.message = { text: ch.ability.label + ": nothing to use it on here", until: S.time + 1.5 }
        emit("noTarget", { zombie: zb.id })
        return false
    }
    sim.switchZombie = function (dir) {
        if (S.phase !== "playing" || S.squad.length < 2) return false
        var zb = active(); if (zb.bite) return false
        S.active = (S.active + (dir || 1) + S.squad.length) % S.squad.length
        emit("switch", { zombie: active().id, index: S.active })
        return true
    }
    sim.selectZombie = function (index) { if (S.phase !== "playing" || index < 0 || index >= S.squad.length || active().bite) return false; S.active = index; emit("switch", { zombie: active().id, index: index }); return true }
    sim.toggleCommand = function () {
        if (S.phase !== "playing") return null
        var mode = null
        for (var i = 0; i < S.squad.length; i++) { if (i === S.active) continue; mode = S.squad[i].mode === "follow" ? "stay" : "follow"; break }
        if (!mode) return null
        for (i = 0; i < S.squad.length; i++) if (i !== S.active) { S.squad[i].mode = mode; S.squad[i].path = [] }
        emit("command", { mode: mode })
        return mode
    }
    sim.setInput = function (inp) { input.x = inp.x || 0; input.z = inp.z || 0; input.run = !!inp.run; input.sneak = !!inp.sneak }

    // ---- security -----------------------------------------------------------------------------------
    function raiseAlarm(x, z, kind) {
        S.alarm = { x: x, z: z, kind: kind, until: S.time + T.alarmDuration }
        S.stats.alarms++
        var so = S.objectives.stealth; if (so) so.failed = true      // "avoid full detection / a full alarm"

        for (var i = 0; i < S.humans.length; i++) {
            var h = S.humans[i]
            if (h.kind !== "guard" || h.bitten || h.state === "alert") continue
            setInvestigate(h, x, z, 2)
        }
        emit("alarm", { x: x, z: z, kind: kind })
    }
    function visibleFrom(x, z, facing, view, zb) {
        if (zb.hidden) return 0
        var d = dist(x, z, zb.x, zb.z)
        if (d > view.range || d < 1e-3) return 0
        var ang = Math.abs(norm(Math.atan2(zb.x - x, zb.z - z) - facing))
        if (ang > rad(view.angle) / 2) return 0
        if (!lineOfSight(x, z, zb.x, zb.z)) return 0
        return d
    }
    function fillRate(d, range, zb, h) {
        var ch = charOf(zb), near = range * 0.3
        var rate = d <= near ? T.detectFillNear : T.detectFillNear + (T.detectFillFar - T.detectFillNear) * (d - near) / (range - near)
        if (zb.sneaking) rate *= T.sneakFactor
        var dz = ch.traits ? (ch.traits.disguiseZone || (ch.traits.maintenance ? "maintenance" : null)) : null
        if (dz && h && d > T.maintenanceNear && zoneAt(zb.x, zb.z, dz)) rate *= T.maintenanceFactor          // looks like staff inside that kind of zone
        if (ch.traits && ch.traits.disguise && h && d > T.maintenanceNear) rate *= T.maintenanceFactor     // looks like staff from afar, anywhere
        if (ch.traits && ch.traits.small) rate *= 0.75
        if (ch.traits && ch.traits.noisy && zb.moving) rate *= 1.3
        return rate
    }
    function updateMeter(obs, dt, isHuman) {
        var bestD = 0, bestZ = null
        if (obs.view.range > 0) for (var i = 0; i < S.squad.length; i++) {
            var d = visibleFrom(obs.x, obs.z, obs.facing, obs.view, S.squad[i])
            if (d > 0 && (bestZ === null || d < bestD)) { bestD = d; bestZ = S.squad[i] }
        }
        if (bestZ) {
            var was = obs.meter
            obs.meter = Math.min(1, obs.meter + fillRate(bestD, obs.view.range, bestZ, isHuman ? obs : null) * dt)
            obs.meterZombie = bestZ.id; obs.lastSeen = { x: bestZ.x, z: bestZ.z, time: S.time }
            if (was < T.suspiciousAt && obs.meter >= T.suspiciousAt) emit("suspicious", { x: obs.x, z: obs.z, who: obs.id })
        } else obs.meter = Math.max(0, obs.meter - T.detectDecay * dt)
        return bestZ
    }
    function setInvestigate(h, x, z, priority) {
        if (h.state === "alert") return
        if (h.state === "investigate" && h.priority > priority) return
        h.state = "investigate"; h.investigatePoint = { x: x, z: z }; h.priority = priority
        h.path = findPath(h.x, h.z, x, z); h.lookLeft = 0
    }
    function stepGuard(h, dt) {
        if (h.sedatedUntil > S.time) { h.moving = false; h.meter = 0; return }      // asleep on the floor
        if (h.sedatedUntil && h.sedatedUntil <= S.time) { h.sedatedUntil = 0; emit("wake", { x: h.x, z: h.z, who: h.id }) }
        var seen = updateMeter(h, dt, true)
        h.moving = false
        var sp = h.speedMulGuard && h.speedMulGuard !== 1 ? { patrol: T.guardSpeed.patrol * h.speedMulGuard, investigate: T.guardSpeed.investigate * h.speedMulGuard, alert: T.guardSpeed.alert * h.speedMulGuard, search: T.guardSpeed.search * h.speedMulGuard } : T.guardSpeed
        // hearing
        for (var n = 0; n < S.noises.length; n++) {
            var no = S.noises[n]
            if (dist(h.x, h.z, no.x, no.z) <= no.radius * (h.hearMul || 1) && h.state !== "alert") {
                var pr = no.kind === "radio" || no.kind === "crash" || no.kind === "bait" || no.kind === "scream" ? 1 : 0
                if (h.state !== "investigate" || h.priority <= pr) setInvestigate(h, no.x, no.z, pr)
                if (h.state === "investigate" && !h.heardAt) emit("heard", { x: h.x, z: h.z, who: h.id })
                h.heardAt = S.time
            }
        }
        // radio keeps a guard's interest while it plays
        switch (h.state) {
        case "patrol":
            if (h.meter >= T.suspiciousAt) { h.state = "suspicious"; h.lookLeft = 1.6; break }
            var wp = h.patrol[h.patrolIndex]
            if (h.waitLeft > 0) { h.waitLeft -= dt; h.facing = norm(h.facing + 0.6 * dt * (h.patrolIndex % 2 ? 1 : -1)); break }
            if (!h.path.length) h.path = findPath(h.x, h.z, wp.x, wp.z)
            if (followPath(h, sp.patrol, dt)) { h.waitLeft = wp.wait || 0; h.patrolIndex = (h.patrolIndex + 1) % h.patrol.length; h.path = [] }
            break
        case "suspicious":
            if (h.lastSeen) h.facing = norm(h.facing + norm(Math.atan2(h.lastSeen.x - h.x, h.lastSeen.z - h.z) - h.facing) * Math.min(1, dt * 6))
            if (h.meter >= 1) { goAlert(h, seen); break }
            h.lookLeft -= dt
            if (h.lookLeft <= 0 || h.meter < T.suspiciousAt * 0.5) { h.state = "investigate"; h.priority = 1; h.investigatePoint = { x: h.lastSeen.x, z: h.lastSeen.z }; h.path = findPath(h.x, h.z, h.lastSeen.x, h.lastSeen.z); h.lookLeft = 0 }
            break
        case "investigate":
            if (h.meter >= 1) { goAlert(h, seen); break }
            if (h.meter >= T.suspiciousAt && seen) { h.facing = norm(h.facing + norm(Math.atan2(seen.x - h.x, seen.z - h.z) - h.facing) * Math.min(1, dt * 6)); break }
            if (h.lookLeft > 0) {
                h.lookLeft -= dt; h.facing = norm(h.facing + 1.4 * dt)
                var radioNear = false
                for (var p = 0; p < S.pickups.length; p++) if (S.pickups[p].playingUntil > S.time && dist(S.pickups[p].x, S.pickups[p].z, h.x, h.z) < 2.5) radioNear = true   // radio blaring, food bait being eaten
                if (radioNear) h.lookLeft = Math.max(h.lookLeft, 0.5)
                if (h.lookLeft <= 0) { h.state = "return"; h.path = []; h.priority = 0 }
                break
            }
            var spd = h.priority >= 2 ? sp.alert : sp.investigate
            if (followPath(h, spd, dt)) { h.lookLeft = T.investigateLook; emit("lookAround", { x: h.x, z: h.z, who: h.id }) }
            break
        case "alert":
            var tz = null
            for (var i = 0; i < S.squad.length; i++) if (S.squad[i].id === h.target) tz = S.squad[i]
            var vis = tz ? visibleFrom(h.x, h.z, h.facing, { angle: 200, range: h.view.range + 2 }, tz) : 0
            if (vis > 0 || (seen && seen !== tz)) { if (seen && !vis) { h.target = seen.id; tz = seen } h.unseenFor = 0; h.lastSeen = { x: tz.x, z: tz.z, time: S.time } }
            else h.unseenFor += dt
            if (h.unseenFor > T.loseSightAfter) { h.state = "search"; h.searchLeft = T.searchPoints; h.searchPoint = null; h.path = []; emit("lostSight", { who: h.id }); break }
            if (tz && dist(h.x, h.z, tz.x, tz.z) < T.catchRange && !tz.hidden) { caught(h, tz); break }
            if (!h.path.length || S.time - (h.pathAt || -1) > 0.3) { h.path = findPath(h.x, h.z, h.lastSeen.x, h.lastSeen.z); h.pathAt = S.time }
            followPath(h, sp.alert, dt)
            if (tz && vis > 0) { h.facing = Math.atan2(tz.x - h.x, tz.z - h.z) }
            break
        case "search":
            if (h.meter >= 0.6) { goAlert(h, seen); break }
            if (h.lookLeft > 0) { h.lookLeft -= dt; h.facing = norm(h.facing + 1.6 * dt); if (h.lookLeft <= 0) h.searchPoint = null; break }
            if (!h.searchPoint) {
                if (h.searchLeft <= 0) { h.state = "return"; h.path = []; h.priority = 0; break }
                h.searchLeft--
                var a = rng() * Math.PI * 2, r = 1 + rng() * T.searchRadius, base = h.lastSeen || { x: h.x, z: h.z }
                var sx = Math.max(0.5, Math.min(M.size.w - 0.5, base.x + Math.sin(a) * r)), sz = Math.max(0.5, Math.min(M.size.d - 0.5, base.z + Math.cos(a) * r))
                h.searchPoint = { x: sx, z: sz }; h.path = findPath(h.x, h.z, sx, sz)
            }
            if (followPath(h, sp.search, dt)) h.lookLeft = T.searchLook
            break
        case "return":
            if (h.meter >= T.suspiciousAt) { h.state = "suspicious"; h.lookLeft = 1.6; break }
            var wp2 = h.patrol[h.patrolIndex]
            if (!h.path.length) h.path = findPath(h.x, h.z, wp2.x, wp2.z)
            if (followPath(h, sp.investigate, dt)) { h.state = "patrol"; h.path = []; h.waitLeft = 0.5 }
            break
        }
    }
    function goAlert(h, zb) {
        if (!zb) { for (var i = 0; i < S.squad.length; i++) if (S.squad[i].id === h.meterZombie) zb = S.squad[i] }
        if (!zb) zb = active()
        h.state = "alert"; h.target = zb.id; h.unseenFor = 0; h.path = []; h.priority = 3
        h.lastSeen = { x: zb.x, z: zb.z, time: S.time }
        S.stats.fullAlerts++
        var o = S.objectives.stealth; if (o) o.failed = true
        emit("alert", { x: h.x, z: h.z, who: h.id, zombie: zb.id })
    }
    function caught(h, zb) {
        S.phase = "caught"; S.caughtAt = S.time
        emit("caught", { x: zb.x, z: zb.z, zombie: zb.id, who: h.id })
    }
    function stepCivilian(h, dt) {
        h.moving = false
        if (h.state === "turned") { h.facing = norm(h.facing + 0.3 * dt); return }
        if (h.interruptedUntil && S.time < h.interruptedUntil) return       // frozen by a scream
        if (h.sedatedUntil > S.time) { h.meter = 0; return }
        if (h.kind === "captive") return                                    // waits in its cell
        if (h.witness) {
            var seen = updateMeter(h, dt, true)
            if (h.meter >= 1 && !h.alarmed) { h.alarmed = true; h.alarmUntil = S.time + 4; addNoise(h.x, h.z, 9, "scream", h.id); raiseAlarm(seen ? seen.x : h.x, seen ? seen.z : h.z, "scream"); emit("scream", { x: h.x, z: h.z, who: h.id }) }
            if (h.alarmed && S.time > h.alarmUntil) { h.alarmed = false; h.meter = 0 }
            if (h.alarmed) return
            if (seen && h.meter >= T.suspiciousAt) { h.facing = norm(h.facing + norm(Math.atan2(seen.x - h.x, seen.z - h.z) - h.facing) * Math.min(1, dt * 5)); return }
        }
        if (h.state === "wander" && h.patrol) {
            var wp = h.patrol[h.patrolIndex]
            if (h.waitLeft > 0) { h.waitLeft -= dt; return }
            if (!h.path.length) h.path = findPath(h.x, h.z, wp.x, wp.z)
            if (followPath(h, 1.1, dt)) { h.waitLeft = wp.wait || 1; h.patrolIndex = (h.patrolIndex + 1) % h.patrol.length; h.path = []; emit("work", { x: h.x, z: h.z, who: h.id }) }
        }
    }
    function stepCamera(c, dt) {
        if (S.time < c.disabledUntil) { c.meter = 0; c.facing = c.base; return }
        c.facing = c.base + Math.sin(S.time * 2 * Math.PI / c.period) * c.sweep
        if (S.time < c.cooldownUntil) { c.meter = Math.max(0, c.meter - dt); return }
        var seen = updateMeter(c, dt, false)
        if (c.meter >= 1) { c.meter = 0; c.cooldownUntil = S.time + 6; raiseAlarm(seen ? seen.x : c.x, seen ? seen.z : c.z, "camera"); emit("cameraAlarm", { x: c.x, z: c.z }) }
    }
    function stepLaser(l) {
        if (S.time < l.disabledUntil) return
        for (var i = 0; i < S.squad.length; i++) {
            var zb = S.squad[i]; if (zb.hidden) continue
            var r = { x: Math.min(l.x1, l.x2) - 0.05, z: Math.min(l.z1, l.z2) - 0.05, w: Math.abs(l.x2 - l.x1) + 0.1, d: Math.abs(l.z2 - l.z1) + 0.1 }
            if (circleHitsRect(zb.x, zb.z, T.zombieRadius * 0.8, r) && S.time - l.trippedAt > 2) {
                l.trippedAt = S.time
                var ch = charOf(zb)
                if (!(ch.traits && ch.traits.sturdy)) zb.stunUntil = S.time + T.laserStun
                raiseAlarm(zb.x, zb.z, "laser"); emit("laserTrip", { x: zb.x, z: zb.z, zombie: zb.id })
            }
        }
    }
    function stepPanel(p) {
        if (!p.noticed && S.time >= p.noticeAt) {
            p.noticed = true
            var best = null, bd = 1e9
            for (var i = 0; i < S.humans.length; i++) { var h = S.humans[i]; if (h.kind !== "guard" || h.bitten) continue; var d = dist(h.x, h.z, p.x, p.z); if (d < bd) { bd = d; best = h } }
            if (best) setInvestigate(best, p.x + Math.sin(p.facing) * 1.0, p.z + Math.cos(p.facing) * 1.0, 1)   // one metre in front of the panel
            emit("panelNoticed", { x: p.x, z: p.z })
        }
    }
    function stepPickups(dt) {
        S.pickups = S.pickups.filter(function (p) { return !(p.temporary && !p.flying && p.playingUntil > 0 && S.time > p.playingUntil) })   // eaten bait vanishes
        for (var i = 0; i < S.pickups.length; i++) {
            var p = S.pickups[i]
            if (p.heldBy) { var zb = null; for (var k = 0; k < S.squad.length; k++) if (S.squad[k].id === p.heldBy) zb = S.squad[k]; if (zb) { p.x = zb.x; p.z = zb.z } continue }
            if (p.flying) {
                p.flying.t += dt
                var f = Math.min(1, p.flying.t / p.flying.duration)
                p.x = p.flying.fromX + (p.flying.toX - p.flying.fromX) * f; p.z = p.flying.fromZ + (p.flying.toZ - p.flying.fromZ) * f
                if (f >= 1) {
                    p.flying = null
                    if (p.kind === "bait") { p.playingUntil = S.time + (T.baitTime || 9); addNoise(p.x, p.z, T.baitNoise || 6, "bait", p.id); emit("baitLand", { x: p.x, z: p.z, item: p.id }) }
                    else { p.playingUntil = S.time + T.radioPlayTime; addNoise(p.x, p.z, T.radioNoise, "radio", p.id); emit("land", { x: p.x, z: p.z, item: p.id }) }
                }
            }
        }
    }
    function stepCollectibles() {
        var zb = active()
        for (var i = 0; i < S.collectibles.length; i++) {
            var c = S.collectibles[i]
            if (c.taken || dist(zb.x, zb.z, c.x, c.z) > 0.9) continue
            c.taken = true; S.collected.push(c.id)
            for (var k = 0; k < M.objectives.optional.length; k++) { var o = M.objectives.optional[k]; if (o.kind === "collectible" && o.target === c.id) S.objectives[o.id].done = true }
            emit("collect", { x: c.x, z: c.z, item: c.id })
        }
    }
    function takeCheckpoint(id) {
        if (S.checkpointsTaken[id]) return
        S.checkpointsTaken[id] = true
        var snap = S.checkpoint; S.checkpoint = null
        S.checkpoint = clone(S); S.checkpoint.checkpoint = null
        emit("checkpoint", { x: active().x, z: active().z, id: id })
    }
    function stepZones(dt) {
        var zb = active()
        var cp = zoneAt(zb.x, zb.z, "checkpoint")
        if (cp) takeCheckpoint(cp.id)
        var allIn = true, ex = null
        for (var i = 0; i < S.squad.length; i++) { var q = S.squad[i]; var zq = zoneAt(q.x, q.z, "exit"); if (!zq || q.hidden) allIn = false; else ex = zq }
        if (allIn && ex && ex.requires) for (i = 0; i < ex.requires.length; i++) { var rc = controlById(ex.requires[i]); if (!rc || !rc.used) { allIn = false; if (S.time - (S.exitHintAt || -10) > 4) { S.exitHintAt = S.time; S.message = { text: "Not yet: " + (rc ? rc.label : ex.requires[i]) + " first", until: S.time + 2.5 } } } }
        if (allIn) { S.exitHold += dt; if (S.exitHold >= T.exitHoldTime) win() } else S.exitHold = 0
    }
    function win() {
        S.phase = "won"; S.won = true; S.objectives.main.done = true
        for (var k = 0; k < M.objectives.optional.length; k++) {
            var o = M.objectives.optional[k], st = S.objectives[o.id]
            if (o.kind === "noAlert") st.done = !st.failed
            if (o.kind === "time") st.done = S.elapsed <= o.seconds
            if (o.kind === "controls") { var all = true; for (var q = 0; q < o.targets.length; q++) { var cc = controlById(o.targets[q]); if (!cc || !cc.used) all = false } st.done = all }
        }
        emit("won", { time: S.elapsed })
    }
    sim.results = function () {
        var out = { won: S.won, time: S.elapsed, optional: [], recruited: S.recruited.slice(), collected: S.collected.slice(), restarts: S.stats.restarts }
        var done = 0
        for (var k = 0; k < M.objectives.optional.length; k++) { var o = M.objectives.optional[k]; var d = !!S.objectives[o.id].done; if (d) done++; out.optional.push({ id: o.id, label: o.label, done: d }) }
        out.stars = done
        out.rating = ["C", "B", "A", "S", "S", "S+"][done] || "C"
        return out
    }

    // ---- restart / checkpoint ---------------------------------------------------------------------
    sim.restart = function () {
        var elapsed = S.elapsed, restarts = S.stats.restarts + 1, tut = S.tutorialSeen, recruited = S.recruited
        if (S.checkpoint) { var cp = clone(S.checkpoint); cp.checkpoint = clone(S.checkpoint); S = cp }
        else { sim.reset(); }
        S.elapsed = elapsed; S.stats.restarts = restarts; S.tutorialSeen = tut; S.phase = "playing"; S.message = null; S.noises = []
        // stealth is only judged on the run that escapes: a restart clears the failure
        if (S.objectives.stealth) S.objectives.stealth.failed = false
        for (var i = 0; i < S.squad.length; i++) { S.squad[i].bite = null; S.squad[i].path = [] }
        sim.state = S; navDirty = true
        emit("restart", { checkpoint: !!S.checkpoint })
    }

    // ---- step --------------------------------------------------------------------------------------
    sim.step = function (dt) {
        if (!S) sim.reset()
        S.elapsed += dt
        if (S.phase === "caught") { if (S.time - S.caughtAt >= T.caughtRestartDelay) sim.restart(); S.time += dt; return }
        if (S.phase !== "playing") return
        S.time += dt
        stepActive(dt)
        stepFollowers(dt)
        for (var i = 0; i < S.squad.length; i++) {
            var zb = S.squad[i]
            if (zb.bite) { zb.bite.left -= dt; if (zb.bite.left <= 0) finishBite(zb) }
        }
        for (i = 0; i < S.humans.length; i++) if (S.humans[i].removed) { S.humans = S.humans.filter(function (h) { return !h.removed }); break }
        for (i = 0; i < S.humans.length; i++) { var h = S.humans[i]; if ((h.kind === "guard" || h.kind === "dog") && !h.bitten) stepGuard(h, dt); else stepCivilian(h, dt) }
        stepTraversals(dt)
        stepControls()
        for (i = 0; i < S.noises.length; i++) S.noises[i].processed = true    // noises raised later this step are heard next step
        for (i = 0; i < S.cameras.length; i++) stepCamera(S.cameras[i], dt)
        for (i = 0; i < S.lasers.length; i++) stepLaser(S.lasers[i])
        for (i = 0; i < S.panels.length; i++) stepPanel(S.panels[i])
        stepPickups(dt)
        stepCollectibles()
        stepZones(dt)
        S.noises = S.noises.filter(function (n) { return !n.processed })
        if (S.alarm && S.time > S.alarm.until) S.alarm = null
        if (S.message && S.time > S.message.until) S.message = null
    }
    sim.takeEvents = function () { var e = events; events = []; return e }
    sim.findPath = findPath           // exposed for tests and the debug overlay
    sim.navGrid = function () { if (navDirty) buildNav(); return nav }
    sim.freeAt = freeAt
    sim.activeZombie = function () { return active() }
    sim.character = function (zb) { return charOf(zb) }
    sim.isLaserActive = function (l) { return S.time >= l.disabledUntil }
    sim.isCameraActive = function (c) { return S.time >= c.disabledUntil }
    sim.canUnlock = canUnlock
    sim.controlActive = controlActive
    sim.hazardAt = hazardAt
    sim.reset()
    return sim
}
