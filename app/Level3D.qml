// The 3D diorama of the running mission: walls and floor from the mission layout, props / pickups /
// humans / zombies from the simulation state, readable vision cones (clipped by walls), laser beams,
// zones and small effects. The camera is an elevated third-person view following the controlled zombie.
// Scene units: 1 m = 100. Reads sim state through `stateVersion` (bumped every tick) so bindings refresh.
import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import Clayground.Canvas3D

Item {
    id: level
    property var sim: null
    property var mission: null
    property int stateVersion: 0
    property real simTime: 0
    property bool showCones: true
    property bool useModels: true
    property bool reducedFx: false
    property var fx: []                       // { x, z, kind, born }
    // sim.state is a plain JS object that restart() replaces (checkpoint reload): re-read it every tick, a
    // binding on `sim.state` alone would keep pointing at the old state and freeze the picture after a capture
    readonly property var st: { stateVersion; return sim ? sim.state : null }
    readonly property int zombieCount: { stateVersion; return st ? st.squad.length : 0 }
    readonly property int humanCount: { stateVersion; return st ? st.humans.length : 0 }
    readonly property real wallH: 1.45      // low diorama walls: the elevated camera looks over them

    function screenPos(x, z, y) { var p = view.mapFrom3DScene(Qt.vector3d(x * 100, (y || 0) * 100, z * 100)); return Qt.point(p.x, p.y) }
    function addFx(x, z, kind) { var f = fx.slice(); f.push({ x: x, z: z, kind: kind, born: simTime }); if (f.length > 12) f.shift(); fx = f }
    function sync(dt) {
        if (!st) return
        var zb = st.squad[st.active]
        var tx = zb.x * 100, tz = zb.z * 100, k = Math.min(1, dt * 4.5)
        camTarget.x += (tx - camTarget.x) * k; camTarget.z += (tz - camTarget.z) * k
        if (fx.length && simTime - fx[0].born > 1.5) fx = fx.filter(function (f) { return simTime - f.born <= 1.5 })
        var deg = 180 / Math.PI, i, o, h, c
        // humans + their cones (the sim mutates its objects in place, so visuals are pushed, not bound)
        for (i = 0; i < st.humans.length; i++) {
            h = st.humans[i]; o = humanRep.objectAt(i); if (!o) continue
            o.x = h.x * 100; o.z = h.z * 100; o.heading = h.facing * deg; o.assetId = h.asset
            o.moving = !!h.moving; o.running = h.state === "alert"; o.turned = !!h.bitten
            c = humanConeRep.objectAt(i); if (!c) continue
            c.visible = showCones && h.view.range > 0 && !h.bitten && !h.alarmed
            if (c.visible) { c.geometry.positions = conePositions(h.x, h.z, h.facing, h.view.angle, h.view.range); c.tone = stateColor(h) }
        }
        for (i = 0; i < st.squad.length; i++) {
            var q = st.squad[i]; o = zombieRep.objectAt(i); if (!o) continue
            var ch = sim.character(q)
            o.x = q.x * 100; o.z = q.z * 100; o.heading = q.facing * deg; o.assetId = ch.asset; o.ringColor = ch.color
            o.moving = !!q.moving; o.running = !!q.running; o.sneaking = !!q.sneaking; o.biting = !!q.bite
            o.stunned = st.time < q.stunUntil; o.hidden = !!q.hidden
            o.selected = i === st.active; o.follower = i !== st.active && q.mode === "follow"
        }
        for (i = 0; i < st.cameras.length; i++) {
            var cam = st.cameras[i]; c = cameraConeRep.objectAt(i); if (!c) continue
            c.visible = showCones && sim.isCameraActive(cam)
            if (c.visible) { c.geometry.positions = conePositions(cam.x, cam.z, cam.facing, cam.view.angle, cam.view.range); c.tone = cam.meter > 0.05 ? "#ff8c3b" : "#5aa8ff" }
        }
    }
    function snapCamera() { if (!st) return; var zb = st.squad[st.active]; camTarget.x = zb.x * 100; camTarget.z = zb.z * 100; sync(0) }
    // vision cone as a fan on the floor, every ray cut at the first wall
    function conePositions(x, z, facing, angle, range) {
        var pts = [], n = 18, half = angle * Math.PI / 360, y = 2.2
        var c = Qt.vector3d(x * 100, y, z * 100)
        var prev = null
        for (var i = 0; i <= n; i++) {
            var a = facing - half + (2 * half) * i / n
            var d = sim.rayDistance(x, z, a, range)
            var p = Qt.vector3d((x + Math.sin(a) * d) * 100, y, (z + Math.cos(a) * d) * 100)
            if (prev) { pts.push(c); pts.push(prev); pts.push(p) }
            prev = p
        }
        return pts
    }
    function stateColor(h) {
        switch (h.state) {
        case "alert": return "#ff3b3b"
        case "suspicious": case "investigate": case "search": return "#ffc531"
        default: return h.meter > 0.05 ? "#ffd86b" : "#79d97a"
        }
    }

    View3D {
        id: view
        anchors.fill: parent
        camera: camera
        environment: SceneEnvironment {
            clearColor: "#151a24"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: level.reducedFx ? SceneEnvironment.NoAA : SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.Medium
        }
        Node { id: camTarget; x: 300; z: 500 }
        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(camTarget.x, 1900, camTarget.z + 950)
            eulerRotation.x: -63
            fieldOfView: 30
            clipFar: 6000
        }
        DirectionalLight { eulerRotation: Qt.vector3d(-55, -35, 0); brightness: 1.15; castsShadow: !level.reducedFx; shadowFactor: 55; shadowMapQuality: Light.ShadowMapQualityHigh; shadowBias: 12; csmNumSplits: 0; shadowMapFar: 5000 }
        DirectionalLight { eulerRotation: Qt.vector3d(-30, 140, 0); brightness: 0.35; color: "#b8c8ff" }

        // floor: checker tiles for a readable hospital look
        Box3D { x: level.mission.size.w * 50; z: level.mission.size.d * 50; y: -10; width: level.mission.size.w * 100; height: 10; depth: level.mission.size.d * 100; color: "#c9d3d8"; useToonShading: true; showEdges: false; receivesShadows: true; castsShadows: false }
        Repeater3D {
            model: level.mission ? Math.floor(level.mission.size.w / 2) * Math.floor(level.mission.size.d / 2) : 0
            delegate: Box3D {
                required property int index
                readonly property int cols: Math.floor(level.mission.size.w / 2)
                readonly property int ci: index % cols
                readonly property int cj: Math.floor(index / cols)
                visible: (ci + cj) % 2 === 0
                x: ci * 200 + 100; z: cj * 200 + 100; y: 0
                width: 200; height: 1; depth: 200
                color: "#bcc7cd"; useToonShading: true; showEdges: false; receivesShadows: true; castsShadows: false; lighting: 1
            }
        }
        // zone floors: maintenance grey, kitchen warm, security blue, office beige (data-driven tints)
        Repeater3D {
            model: level.mission ? level.mission.zones.filter(function (z) { return ["maintenance", "kitchen", "security", "office", "fire", "smoke"].indexOf(z.kind) >= 0 }) : []
            delegate: Box3D {
                required property var modelData
                x: (modelData.x + modelData.w / 2) * 100; z: (modelData.z + modelData.d / 2) * 100; y: 1; width: modelData.w * 100; height: 0.6; depth: modelData.d * 100
                color: ({ maintenance: "#9aa8ae", kitchen: "#d9c9a8", security: "#9fb0cf", office: "#cfc6b4", fire: "#d9a08a", smoke: "#8f8f95" })[modelData.kind] || "#9aa8ae"
                useToonShading: true; showEdges: false; castsShadows: false
            }
        }
        // controls (consoles, shutter switches, valves, terminals...): a prop with a status light
        Repeater3D {
            model: level.st ? level.st.controls.length : 0
            delegate: Node {
                required property int index
                readonly property var c: level.st.controls[index]
                readonly property bool used: { level.stateVersion; return level.st.controls[index].used }
                x: c.x * 100; z: c.z * 100
                eulerRotation.y: c.facing * 180 / Math.PI
                PropVisual { assetId: c.asset || "electrical_panel"; useModels: level.useModels }
                Box3D { y: 130; z: 20; width: 12; height: 12; depth: 4; color: used ? "#49e06a" : "#ffc531"; lighting: 0; showEdges: false; castsShadows: false }
            }
        }
        // traversals (vents, vault points): a hatch at each end
        Repeater3D {
            model: level.st ? level.st.traversals.length : 0
            delegate: Node {
                required property int index
                readonly property var t: level.st.traversals[index]
                PropVisual { x: t.from.x * 100; z: t.from.z * 100; assetId: t.asset || "vent_hatch"; useModels: level.useModels }
                PropVisual { x: t.to.x * 100; z: t.to.z * 100; assetId: t.asset || "vent_hatch"; useModels: level.useModels }
            }
        }
        // exit / checkpoint zones
        Repeater3D {
            model: level.mission ? level.mission.zones.filter(function (z) { return z.kind === "exit" || z.kind === "checkpoint" }) : []
            delegate: Box3D {
                required property var modelData
                readonly property bool taken: { level.stateVersion; return !!(level.st && level.st.checkpointsTaken[modelData.id]) }
                x: (modelData.x + modelData.w / 2) * 100; z: (modelData.z + modelData.d / 2) * 100; y: 1.6
                width: modelData.w * 100; height: 0.6; depth: modelData.d * 100
                color: modelData.kind === "exit" ? "#4fd6a0" : (taken ? "#4fa3d6" : "#e0c85a")
                lighting: 0; showEdges: true; edgeColor: "#ffffff"; edgeThickness: 1.5; castsShadows: false; opacity: 0.35
            }
        }
        // walls
        Repeater3D {
            model: level.st ? level.st.walls.length : 0
            delegate: Box3D {
                required property int index
                readonly property var w: level.st.walls[index]
                readonly property bool broken: { level.stateVersion; return !!level.st.walls[index].broken }
                visible: !broken
                x: (w.x + w.w / 2) * 100; z: (w.z + w.d / 2) * 100; y: 0
                width: w.w * 100; height: level.wallH * 100 * (w.weak ? 0.9 : 1); depth: w.d * 100
                color: w.weak ? "#b78f6a" : "#e6e1d3"
                useToonShading: true; showEdges: true; edgeColor: "#2a2f3a"; edgeThickness: 1.2
                castsShadows: true; receivesShadows: true
            }
        }
        // doors: swing open around their hinge
        Repeater3D {
            model: level.st ? level.st.doors.length : 0
            delegate: Node {
                required property int index
                readonly property var d: level.st.doors[index]
                readonly property bool open: { level.stateVersion; return level.st.doors[index].open }
                readonly property bool vertical: d.d > d.w
                x: (vertical ? d.x + d.w / 2 : d.x) * 100; z: (vertical ? d.z : d.z + d.d / 2) * 100
                eulerRotation.y: open && !d.sealed ? (vertical ? 80 : -80) : 0        // sealed doors (shutters) slide up instead of swinging
                Behavior on eulerRotation.y { NumberAnimation { duration: 350; easing.type: Easing.OutCubic } }
                y: open && d.sealed ? level.wallH * 100 * 0.85 : 0
                Behavior on y { NumberAnimation { duration: 900; easing.type: Easing.InOutQuad } }
                PropVisual {   // the leaf: a hospital door, the teal service door for locked passages, or the mission's own asset
                    x: vertical ? 0 : d.w * 50; z: vertical ? d.d * 50 : 0
                    eulerRotation.y: vertical ? 90 : 0
                    assetId: d.asset ? d.asset : (d.lockType ? "maintenance_door" : "hospital_door")
                    height: d.sealed ? level.wallH * 1.0 : level.wallH * 1.12
                    useModels: level.useModels
                    placeholderWidth: d.d > d.w ? d.d : d.w
                }
                Box3D { visible: d.lockType && d.locked; x: vertical ? 0 : d.w * 50; z: vertical ? d.d * 50 : 0; y: level.wallH * 100 - 30; width: vertical ? 18 : 26; height: 26; depth: vertical ? 26 : 18; color: "#f2c02f"; lighting: 0; showEdges: false; castsShadows: false }
            }
        }
        // props (movable ones follow the sim)
        Repeater3D {
            model: level.st ? level.st.props.length : 0
            delegate: Node {
                required property int index
                readonly property var p: level.st.props[index]
                readonly property real px: { level.stateVersion; return level.st.props[index].x }
                readonly property real pz: { level.stateVersion; return level.st.props[index].z }
                x: (px + p.w / 2) * 100; z: (pz + p.d / 2) * 100
                eulerRotation.y: p.facing * 180 / Math.PI
                PropVisual { assetId: p.asset; useModels: level.useModels; placeholderWidth: Math.max(p.w, p.d) }
            }
        }
        // pickups
        Repeater3D {
            model: level.st ? level.st.pickups.length : 0
            delegate: Node {
                required property int index
                readonly property var p: level.st.pickups[index]
                readonly property real px: { level.stateVersion; return level.st.pickups[index].x }
                readonly property real pz: { level.stateVersion; return level.st.pickups[index].z }
                readonly property bool held: { level.stateVersion; return !!level.st.pickups[index].heldBy }
                readonly property bool flying: { level.stateVersion; return !!level.st.pickups[index].flying }
                readonly property bool playing: { level.stateVersion; return level.st.pickups[index].playingUntil > level.st.time }
                x: px * 100; z: pz * 100
                y: held ? 95 : (flying ? 60 + Math.sin(level.simTime * 9) * 30 : 0)
                eulerRotation.y: flying ? level.simTime * 500 : 0
                PropVisual { assetId: p.kind; useModels: level.useModels }
                // sound rings while it blares
                Repeater3D { model: playing ? 3 : 0; delegate: Model { required property int index; source: "#Cylinder"; y: 20; readonly property real t: (level.simTime * 0.8 + index / 3) % 1
                    scale: Qt.vector3d(0.6 + t * 4, 0.01, 0.6 + t * 4); materials: PrincipledMaterial { baseColor: "#5ad6ff"; lighting: PrincipledMaterial.NoLighting; opacity: (1 - t) * 0.5 }
                    castsShadows: false } }
            }
        }
        // collectibles
        Repeater3D {
            model: level.st ? level.st.collectibles.length : 0
            delegate: Node {
                required property int index
                readonly property var c: level.st.collectibles[index]
                visible: { level.stateVersion; return !level.st.collectibles[index].taken }
                x: c.x * 100; z: c.z * 100; y: 10 + Math.sin(level.simTime * 2) * 6
                eulerRotation.y: level.simTime * 40
                PropVisual { assetId: c.asset; useModels: level.useModels }
                PointLight { y: 60; color: "#7fff7a"; brightness: 0.6; castsShadow: false }
            }
        }
        // laser barriers: two pillars and three beams
        Repeater3D {
            model: level.st ? level.st.lasers.length : 0
            delegate: Node {
                required property int index
                readonly property var l: level.st.lasers[index]
                readonly property bool active: { level.stateVersion; return level.sim.isLaserActive(level.st.lasers[index]) }
                readonly property real len: Math.hypot(l.x2 - l.x1, l.z2 - l.z1)
                x: (l.x1 + l.x2) / 2 * 100; z: (l.z1 + l.z2) / 2 * 100
                eulerRotation.y: Math.atan2(l.x2 - l.x1, l.z2 - l.z1) * 180 / Math.PI
                PropVisual { z: -len * 50; assetId: "laser_pillar"; useModels: level.useModels }                        // emitters face +z: towards the other pillar
                PropVisual { z: len * 50; assetId: "laser_pillar"; useModels: level.useModels; eulerRotation.y: 180 }
                Repeater3D { model: 3; delegate: Box3D { required property int index; y: 40 + index * 40; width: 3; height: 3; depth: len * 100 - 30; color: active ? "#ff3b3b" : "#552222"; lighting: 0; showEdges: false; castsShadows: false; opacity: active ? 0.9 : 0.25 } }
                PointLight { visible: active; y: 80; color: "#ff4040"; brightness: 0.8; castsShadow: false }
            }
        }
        // security cameras on the wall
        Repeater3D {
            model: level.st ? level.st.cameras.length : 0
            delegate: Node {
                required property int index
                readonly property var c: level.st.cameras[index]
                readonly property real facing: { level.stateVersion; return level.st.cameras[index].facing }
                readonly property bool active: { level.stateVersion; return level.sim.isCameraActive(level.st.cameras[index]) }
                x: c.x * 100; z: c.z * 100; y: c.mountHeight * 100
                eulerRotation.y: facing * 180 / Math.PI
                PropVisual { assetId: "security_camera"; useModels: level.useModels; y: -20 }
                Box3D { z: 22; y: 8; width: 5; height: 5; depth: 5; color: active ? "#ff3b3b" : "#333"; lighting: 0; showEdges: false; castsShadows: false }
            }
        }
        // control panels
        Repeater3D {
            model: level.st ? level.st.panels.length : 0
            delegate: Node {
                required property int index
                readonly property var p: level.st.panels[index]
                readonly property bool down: { level.stateVersion; return level.st.time < level.st.panels[index].usedUntil }
                x: p.x * 100; z: p.z * 100
                eulerRotation.y: p.facing * 180 / Math.PI
                PropVisual { assetId: "electrical_panel"; useModels: level.useModels; y: 60 }
                Box3D { y: 150; z: 14; width: 12; height: 12; depth: 4; color: down ? "#ff3b3b" : "#49e06a"; lighting: 0; showEdges: false; castsShadows: false }
            }
        }
        // vision cones (guards, witnesses, cameras): fans on the floor, filled by sync()
        Repeater3D {
            id: humanConeRep
            model: level.humanCount
            delegate: Model {
                required property int index
                property color tone: "#79d97a"
                visible: false
                geometry: ProceduralMesh { primitiveMode: ProceduralMesh.Triangles }
                materials: PrincipledMaterial { baseColor: tone; lighting: PrincipledMaterial.NoLighting; opacity: 0.32; cullMode: Material.NoCulling }
                castsShadows: false; receivesShadows: false
            }
        }
        Repeater3D {
            id: cameraConeRep
            model: level.st ? level.st.cameras.length : 0
            delegate: Model {
                required property int index
                property color tone: "#5aa8ff"
                visible: false
                geometry: ProceduralMesh { primitiveMode: ProceduralMesh.Triangles }
                materials: PrincipledMaterial { baseColor: tone; lighting: PrincipledMaterial.NoLighting; opacity: 0.3; cullMode: Material.NoCulling }
                castsShadows: false
            }
        }
        // humans and zombies: positions / clips pushed by sync()
        Repeater3D {
            id: humanRep
            model: level.humanCount
            delegate: CharacterVisual {
                required property int index
                useModels: level.useModels
                simTime: level.simTime
                seed: index * 1.7
            }
        }
        Repeater3D {
            id: zombieRep
            model: level.zombieCount
            delegate: CharacterVisual {
                required property int index
                useModels: level.useModels
                simTime: level.simTime
                seed: index * 2.3
            }
        }
        // ambient effects: noise rings, alarm flashes
        Repeater3D {
            model: level.fx.length
            delegate: Model {
                required property int index
                readonly property var f: level.fx[index]
                readonly property real t: Math.min(1, (level.simTime - f.born) / 1.2)
                source: "#Cylinder"
                x: f.x * 100; z: f.z * 100; y: 3
                scale: Qt.vector3d(0.5 + t * (f.kind === "alarm" ? 8 : 4), 0.01, 0.5 + t * (f.kind === "alarm" ? 8 : 4))
                materials: PrincipledMaterial { baseColor: f.kind === "alarm" ? "#ff3b3b" : (f.kind === "bite" ? "#7fe07a" : "#ffffff"); lighting: PrincipledMaterial.NoLighting; opacity: (1 - t) * 0.5 }
                castsShadows: false
            }
        }
    }
}
