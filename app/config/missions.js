// Bite by Bite - mission definitions. A mission is data only: layout (walls, doors, props, zones),
// the humans and security in it, the objectives and the briefing prose. Sim.js builds a match from
// one of these; adding a mission is adding an entry to `missions` (and a screen line in MissionSelect).
//
// Units: metres, x east, z south (top-down), 1 m = 100 scene units. Rectangles are { x, z, w, d }
// (top-left corner + size). Facing is a yaw in degrees: 0 looks towards +z (south), 90 towards +x.
//
//   walls        [{ x, z, w, d, weak? }]   weak walls can be broken by the `smash` ability
//   doors        [{ id, x, z, w, d, lockType?, open? }]   closed doors block movement and sight;
//                lockType "maintenance" needs the `unlock` ability
//   props        [{ id, asset, x, z, facing, w, d, blocksSight?, movable?, heavy?, hide?, decor? }]
//                w/d = footprint (obstacle); `hide` = interact to hide inside; `decor` = no collision
//   pickups      [{ id, kind: "radio", x, z }]
//   collectibles [{ id, x, z, asset }]
//   zones        [{ id, kind: "exit"|"checkpoint"|"maintenance"|"start", x, z, w, d }]
//   humans       [{ id, kind: "guard"|"civilian", asset, x, z, facing, patrol?: [{x,z,wait}], wander?,
//                   vulnerable?, recruit?: charId, view?: {angle, range}, witness? }]
//   cameras      [{ id, x, z, facing, sweep, period, mountHeight }]
//   lasers       [{ id, x1, z1, x2, z2, height }]
//   panels       [{ id, x, z, facing, links: [ids of lasers/cameras] }]
//   spawn        { x, z, facing } where the squad starts (members fan out around it)
//   objectives   main + optional [{ id, kind, label, ... }] - kinds: escape, capture(target), noAlert,
//                collectible(id), time(seconds)
//   order / requiresMission / unlockText   campaign progression (data only; isUnlocked() below)
//   location     asset id of the building shown on the mission screen; recruits: character ids previewed there
.pragma library

function rect(x, z, w, d, extra) { var r = { x: x, z: z, w: w, d: d }; if (extra) for (var k in extra) r[k] = extra[k]; return r }
// a wall line from (x1,z1) to (x2,z2) of thickness t (axis aligned)
function wall(x1, z1, x2, z2, extra) {
    var t = 0.3
    if (x1 === x2) return rect(x1 - t / 2, Math.min(z1, z2), t, Math.abs(z2 - z1), extra)
    return rect(Math.min(x1, x2), z1 - t / 2, Math.abs(x2 - x1), t, extra)
}

var hospital = {
    id: "hospital_night_shift",
    order: 1,
    title: "Night Shift at St. Rotter Hospital",
    subtitle: "Mission 1",
    location: "hospital_building",           // asset shown on the mission-select stage
    recruits: ["electrician", "nurse"],      // capturable characters previewed on the mission screen
    size: { w: 28, d: 20 },
    story: "You woke up in the research wing of St. Rotter Hospital with a taste for brains and no way out. " +
           "The ambulance bay is sealed by a laser barrier - the night-shift electrician knows how to shut it down.",
    briefing: {
        objective: "Escape through the ambulance bay.",
        hazards: ["2 patrolling guards", "1 security camera", "1 laser barrier", "1 electrical panel"],
        squadLimit: 2,
        suggested: ["Bite (recruit the electrician)", "Sabotage (disable the laser)", "Master key (service door shortcut)"],
        capture: "electrician",
        challenges: ["Capture the Electrician", "Recruit the Nurse", "Avoid full detection", "Find the hidden brain", "Escape within 4:00"]
    },
    targetTime: 240,
    squadLimit: 2,
    spawn: { x: 3.0, z: 5.0, facing: 90 },

    walls: [
        // outer shell
        wall(0, 0, 28, 0), wall(0, 20, 28, 20), wall(0, 0, 0, 20), wall(28, 0, 28, 20),
        // patient room (A: x0-8, z0-8) | ward corridor (B: x8-11)
        wall(8, 0, 8, 4), wall(8, 5.5, 8, 8),                       // gap = door A->B
        // nurse station (C: x11-20, z0-8)
        wall(11, 0, 11, 1.5), wall(11, 3.5, 11, 8),                 // opening B->C at z1.5-3.5
        wall(0, 8, 8, 8),                                           // A south wall
        wall(11, 8, 16, 8), wall(18, 8, 20, 8),                     // C south wall, opening C->E at x16-18
        // ambulance bay (D: x20-28, z0-8)
        wall(20, 0, 20, 1), wall(20, 2.5, 20, 4.5), wall(20, 6.5, 20, 8),   // service door z1-2.5, laser opening z4.5-6.5
        wall(20, 8, 24, 8), wall(26, 8, 28, 8),                     // D south wall, weak part x24-26
        rect(24, 8 - 0.15, 2, 0.3, { weak: true }),
        // main corridor (E: x11-28, z8-11.5) | electrical room (F: x20-28, z11.5-20) | maintenance (G: x11-20, z11.5-20)
        wall(11, 11.5, 13, 11.5), wall(15, 11.5, 20, 11.5),         // G north wall, doorway x13-15
        wall(20, 11.5, 21, 11.5), wall(23, 11.5, 28, 11.5),         // F north wall, opening x21-23
        wall(20, 11.5, 20, 20),                                     // G/F divider
        wall(11, 11.5, 11, 20)                                      // B/G divider
    ],
    doors: [
        { id: "door_room", x: 8 - 0.15, z: 4, w: 0.3, d: 1.5, open: false, label: "Room door" },
        { id: "door_service", x: 20 - 0.15, z: 1, w: 0.3, d: 1.5, open: false, lockType: "maintenance", label: "Service door" }
    ],
    props: [
        // patient room
        { id: "bed_a", asset: "hospital_bed", x: 2.0, z: 1.2, facing: 0, w: 1.1, d: 2.2, blocksSight: false },
        { id: "curtain_a", asset: "curtain_screen", x: 4.6, z: 0.9, facing: 0, w: 1.8, d: 1.6, blocksSight: true },
        { id: "locker_a", asset: "locker", x: 0.4, z: 6.6, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        // nurse station
        { id: "bed_c", asset: "hospital_bed_modern", x: 17.5, z: 0.6, facing: 0, w: 1.1, d: 2.2, blocksSight: false },
        { id: "cart", asset: "medical_cart", x: 14.8, z: 5.2, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Medical cart" },
        { id: "divider_c", asset: "curtain_divider", x: 12.6, z: 1.6, facing: 90, w: 0.4, d: 2.6, blocksSight: true },   // screens the B->C opening from the corridor
        // corridor E
        { id: "cart_e", asset: "medical_cart", x: 18.2, z: 8.4, facing: 90, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Medical cart" },
        // electrical room
        { id: "locker_f", asset: "locker", x: 20.4, z: 18.9, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "bed_f", asset: "hospital_bed", x: 25.0, z: 12.0, facing: 90, w: 2.2, d: 1.1, blocksSight: false },
        // maintenance passage
        { id: "mdoor_g", asset: "maintenance_door", x: 14.95, z: 11.7, facing: 90, w: 0.1, d: 1.0, decor: true },   // open leaf beside the doorway
        { id: "divider_g", asset: "curtain_divider", x: 16.8, z: 16.8, facing: 90, w: 0.4, d: 2.6, blocksSight: true },
        { id: "locker_g", asset: "locker", x: 11.4, z: 18.9, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "bed_g", asset: "hospital_bed_modern", x: 11.4, z: 15.0, facing: 90, w: 2.2, d: 1.1, blocksSight: false },
        // ambulance bay
        { id: "ambulance", asset: "ambulance", x: 23.5, z: 0.6, facing: 90, w: 4.5, d: 2.2, blocksSight: true },
        // extra furniture: cover in the corridors, decoration in the rooms
        { id: "vending", asset: "vending_machine", x: 26.6, z: 8.4, facing: 0, w: 1.0, d: 0.8, blocksSight: true },
        { id: "wheelchair", asset: "wheelchair", x: 8.6, z: 12.4, facing: 90, w: 0.9, d: 0.9, blocksSight: false, movable: true, label: "Wheelchair" },
        { id: "iv_a", asset: "iv_stand", x: 3.4, z: 1.3, facing: 0, w: 0.4, d: 0.4, blocksSight: false },
        { id: "iv_c", asset: "iv_stand", x: 18.9, z: 3.2, facing: 0, w: 0.4, d: 0.4, blocksSight: false }
    ],
    pickups: [ { id: "radio", kind: "radio", x: 13.0, z: 6.6, label: "Radio" } ],
    collectibles: [ { id: "brain", asset: "brain_jar", x: 18.6, z: 18.8, label: "Brain in a jar" } ],
    zones: [
        { id: "start", kind: "start", x: 0.3, z: 0.3, w: 7.4, d: 7.4 },
        { id: "cp_corridor", kind: "checkpoint", x: 11.2, z: 8.2, w: 1.8, d: 3.1, label: "Checkpoint" },
        { id: "exit", kind: "exit", x: 21.0, z: 3.6, w: 6.6, d: 3.9, label: "Ambulance bay" },
        { id: "maint_g", kind: "maintenance", x: 11, z: 11.5, w: 9, d: 8.5 },
        { id: "maint_f", kind: "maintenance", x: 20, z: 11.5, w: 8, d: 8.5 }
    ],
    humans: [
        { id: "guard_ward", kind: "guard", asset: "guard", x: 9.5, z: 3.0, facing: 0,
          patrol: [ { x: 9.5, z: 2.5, wait: 1.5 }, { x: 9.5, z: 17.5, wait: 1.5 } ] },
        { id: "guard_hall", kind: "guard", asset: "guard", x: 13.0, z: 9.8, facing: 90,
          patrol: [ { x: 12.5, z: 9.8, wait: 2.0 }, { x: 22.0, z: 9.8, wait: 0.8 }, { x: 26.8, z: 9.8, wait: 2.0 }, { x: 22.0, z: 9.8, wait: 0.5 } ] },
        { id: "electrician", kind: "civilian", asset: "electrician_human", x: 23.0, z: 14.5, facing: 180,
          vulnerable: true, recruit: "electrician", label: "Electrician",
          wander: [ { x: 22.5, z: 14.0, wait: 3.0 }, { x: 26.4, z: 18.3, wait: 2.5 }, { x: 23.0, z: 18.6, wait: 3.5 }, { x: 26.8, z: 13.6, wait: 2.0 } ] },
        { id: "nurse", kind: "civilian", asset: "nurse", x: 14.0, z: 1.5, facing: 0, vulnerable: true, witness: true, recruit: "nurse",
          view: { angle: 50, range: 4.0 }, label: "Nurse" }
    ],
    cameras: [ { id: "cam_hall", x: 23.6, z: 8.25, facing: -15, sweep: 42, period: 9.0, mountHeight: 2.3 } ],
    lasers: [ { id: "laser_bay", x1: 20.0, z1: 4.5, x2: 20.0, z2: 6.5, height: 1.2 } ],
    panels: [ { id: "panel_f", x: 27.6, z: 16.0, facing: 270, links: ["laser_bay", "cam_hall"], label: "Control panel" } ],
    objectives: {
        main: { id: "escape", kind: "escape", label: "Escape through the ambulance bay" },
        optional: [
            { id: "capture", kind: "capture", target: "electrician", label: "Capture the Electrician" },
            { id: "nurse", kind: "capture", target: "nurse", label: "Recruit the Nurse" },
            { id: "stealth", kind: "noAlert", label: "Avoid full detection" },
            { id: "brain", kind: "collectible", target: "brain", label: "Find the hidden brain" },
            { id: "fast", kind: "time", seconds: 240, label: "Escape within 4:00" }
        ]
    },
    tutorial: [
        { id: "move", text: "Move with WASD / left stick. Hold Shift to run, Ctrl to sneak.", at: "start" },
        { id: "door", text: "Press E to interact: open the door.", at: "door_room" },
        { id: "guard", text: "Guards see the coloured cone. Stay out of it or break line of sight - the meter must not fill.", at: "cp_ward" },
        { id: "radio", text: "Pick up the radio with E and throw it with E again: guards investigate the noise.", at: "radio" },
        { id: "bite", text: "Sneak behind a human and press F to bite. Infected specialists join your squad.", at: "electrician" },
        { id: "switch", text: "Tab switches zombies, H tells the others to stay or follow. Q uses the ability.", at: "recruit" }
    ]
}

var missions = [hospital]
var byId = {}
for (var i = 0; i < missions.length; i++) byId[missions[i].id] = missions[i]
function get(id) { return byId[id] || null }
// campaign progression: a mission is playable once the one it requires has been completed
//   completedIds: array of completed mission ids (from the save)
function isUnlocked(m, completedIds) { return !m.requiresMission || (completedIds || []).indexOf(m.requiresMission) >= 0 }
function lockReason(m) { return m.unlockText || (m.requiresMission ? "Complete " + (get(m.requiresMission) || { title: m.requiresMission }).title : "") }
