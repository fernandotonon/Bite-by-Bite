// Mission 5 - Firehouse Fever. New here: fire hazards (impassable unless fireproof, shut off by valves that need
// the Firefighter's `rescue`, or by the sprinkler master anyone can reach), smoke (passable, but coughing zombies
// are slow and noisy until the ventilation fan runs), a trapped civilian behind the kitchen fire.
.pragma library
.import "missions.js" as Base

var rect = Base.rect, wall = Base.wall

var firehouse = {
    id: "firehouse_fever",
    order: 5,
    requiresMission: "office_graveyard_shift",
    unlockText: "Complete Graveyard Shift Inc.",
    title: "Firehouse Fever",
    subtitle: "Mission 5",
    location: "firehouse_building",
    recruits: ["firefighter"],
    size: { w: 28, d: 20 },
    story: "Station 13 caught fire while the horde was napping in the engine bay. The bay door is on the far side of the " +
           "smoke, the kitchen is ablaze with a jogger stuck behind it, and the only one who knows the valves is the " +
           "night firefighter in the locker room.",
    briefing: {
        objective: "Open the vehicle bay and escape before the station is sealed.",
        hazards: ["2 patrolling guards", "1 security camera", "kitchen and tower fires (valves or sprinklers)", "a smoke-filled service corridor (coughing is loud)"],
        squadLimit: 2,
        suggested: ["Bite (recruit the firefighter: valves, and fire and smoke do not touch him)", "Sprinkler master in the equipment room (anyone)", "Master key (the equipment room's side door)"],
        capture: "firefighter",
        challenges: ["Recruit the Firefighter", "Run the sprinklers", "Rescue the trapped jogger", "Avoid a full alarm", "Escape within 5:00"]
    },
    targetTime: 300,
    squadLimit: 2,
    spawn: { x: 2.0, z: 2.0, facing: 90 },

    walls: [
        wall(0, 0, 28, 0), wall(0, 20, 28, 20), wall(0, 0, 0, 20), wall(28, 0, 28, 20),
        // engine bay A (x0-14, z0-10) | locker room B (x14-22, z0-6) | kitchen C (x22-28, z0-6)
        wall(14, 0, 14, 2), wall(14, 3.5, 14, 6),                    // A -> B door
        wall(22, 0, 22, 2), wall(22, 3.5, 22, 6),                    // B -> C door
        // equipment storage D (x14-20, z6-12) | smoke corridor E (x20-28, z6-14)
        wall(14, 6, 20, 6), wall(20, 6, 20.5, 6), wall(22, 6, 28, 6),           // B -> E door at x20.5-22
        wall(14, 6, 14, 7), wall(14, 8.5, 14, 12),                   // A -> D door at z7-8.5 (normal, camera-watched)
        wall(20, 6, 20, 9), wall(20, 10.5, 20, 12),                  // D <-> E door at z9-10.5 (maintenance)
        wall(14, 12, 20, 12),
        // apron / exit strip (x0-7, z10-14) below the bay: bay door at z=10, x2-6; hose stairwell G (x7-14, z10-20)
        wall(0, 10, 2, 10), wall(6, 10, 14, 10),
        wall(7, 10, 7, 20),                                          // G west wall (the apron is outside)
        wall(0, 14, 7, 14),
        // training tower F (x14-28, z14-20): entrance from E at x22-23.5 (z=14) and from G at x14 (z16-17.5)
        wall(14, 14, 22, 14), wall(23.5, 14, 28, 14),
        wall(14, 12, 14, 16), wall(14, 17.5, 14, 20),
        wall(20, 12, 20, 14)
    ],
    doors: [
        { id: "door_locker", x: 14 - 0.15, z: 2, w: 0.3, d: 1.5, open: false, label: "Locker room" },
        { id: "door_kitchen", x: 22 - 0.15, z: 2, w: 0.3, d: 1.5, open: false, label: "Kitchen" },
        { id: "door_smoke", x: 20.5, z: 6 - 0.15, w: 1.5, d: 0.3, open: false, label: "Service corridor" },
        { id: "door_storage", x: 14 - 0.15, z: 7, w: 0.3, d: 1.5, open: false, label: "Equipment storage" },
        { id: "door_storage_back", x: 20 - 0.15, z: 9, w: 0.3, d: 1.5, open: false, lockType: "maintenance", label: "Storage side door" },
        { id: "door_tower", x: 22, z: 14 - 0.15, w: 1.5, d: 0.3, open: false, label: "Training tower" },
        { id: "door_tower_g", x: 14 - 0.15, z: 16, w: 0.3, d: 1.5, open: false, label: "Tower stairs" },
        { id: "bay_door", x: 2, z: 10 - 0.15, w: 4, d: 0.3, open: false, sealed: true, asset: "dock_shutter", label: "Vehicle bay door" }
    ],
    hazards: [
        { id: "fire_kitchen", kind: "fire", x: 24, z: 0.3, w: 1.6, d: 5.4, label: "Kitchen fire" },
        { id: "fire_tower", kind: "fire", x: 7.3, z: 14.5, w: 6.4, d: 2.0, label: "Stairwell fire" },
        { id: "smoke_e", kind: "smoke", x: 20.3, z: 6.3, w: 7.4, d: 7.4, label: "Smoke" }
    ],
    controls: [
        { id: "valve_kitchen", kind: "valve", x: 23.0, z: 5.4, facing: 0, label: "Kitchen valve", requires: "rescue", links: ["fire_kitchen"], asset: "fire_valve" },
        { id: "valve_tower", kind: "valve", x: 7.6, z: 12.0, facing: 90, label: "Tower valve", requires: "rescue", links: ["fire_tower"], asset: "fire_valve" },
        { id: "sprinklers", kind: "switch", x: 19.5, z: 6.6, facing: 270, label: "Sprinkler master", links: ["fire_kitchen", "fire_tower"], asset: "electrical_panel" },
        { id: "vent_fan", kind: "switch", x: 27.4, z: 13.2, facing: 270, label: "Ventilation fan", links: ["smoke_e"], asset: "vent_fan" },
        { id: "bay_switch", kind: "shutter", x: 26.6, z: 18.8, facing: 270, label: "Bay door switch", links: ["bay_door"], asset: "electrical_panel" }
    ],
    traversals: [],
    props: [
        { id: "engine", asset: "fire_engine", x: 3.5, z: 3.5, facing: 0, w: 2.4, d: 6.0, blocksSight: true },
        { id: "gear_a", asset: "gear_rack", x: 10.5, z: 0.4, facing: 0, w: 2.2, d: 0.7, blocksSight: true },
        { id: "locker_a", asset: "locker", x: 0.4, z: 9.0, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Hose locker" },
        { id: "cart_a", asset: "medical_cart", x: 9.0, z: 7.0, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Tool cart" },
        { id: "gear_b", asset: "gear_rack", x: 15.0, z: 0.4, facing: 0, w: 2.2, d: 0.7, blocksSight: true },
        { id: "locker_b", asset: "locker", x: 21.4, z: 0.4, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "bench_b", asset: "curtain_divider", x: 17.5, z: 3.6, facing: 0, w: 2.6, d: 0.4, blocksSight: true },
        { id: "vend_c", asset: "vending_machine", x: 22.3, z: 0.3, facing: 0, w: 1.0, d: 0.8, blocksSight: true },
        { id: "table_c", asset: "food_court_table", x: 26.0, z: 3.0, facing: 0, w: 1.6, d: 1.6, blocksSight: false },
        { id: "rack_d", asset: "gear_rack", x: 14.4, z: 10.5, facing: 90, w: 0.7, d: 2.2, blocksSight: true },
        { id: "locker_d", asset: "locker", x: 19.4, z: 11.0, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "fan_e", asset: "vent_fan", x: 26.5, z: 12.4, facing: 270, w: 1.4, d: 0.8, decor: true },
        { id: "wheel_f", asset: "wheelchair", x: 18.0, z: 17.0, facing: 90, w: 0.9, d: 0.9, blocksSight: false, movable: true, label: "Hose reel" },
        { id: "locker_f", asset: "locker", x: 27.4, z: 15.0, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "bleach_f", asset: "gym_bleachers", x: 16.0, z: 19.0, facing: 0, w: 3.0, d: 0.9, blocksSight: true }
    ],
    pickups: [ { id: "radio", kind: "radio", x: 12.5, z: 8.5, label: "Radio" } ],
    collectibles: [ { id: "brain", asset: "brain_jar", x: 8.0, z: 19.0, label: "Brain in a jar" } ],
    zones: [
        { id: "start", kind: "start", x: 0.3, z: 0.3, w: 13.4, d: 9.4 },
        { id: "cp_locker", kind: "checkpoint", x: 14.2, z: 1.5, w: 2.5, d: 2.5, label: "Checkpoint" },
        { id: "cp_tower", kind: "checkpoint", x: 21, z: 14.2, w: 3.5, d: 2.5, label: "Checkpoint" },
        { id: "exit", kind: "exit", x: 0.4, z: 10.4, w: 6.2, d: 3.3, label: "Station apron" },
        { id: "maint_d", kind: "maintenance", x: 14, z: 6, w: 6, d: 6 },
        { id: "kitchen_c", kind: "kitchen", x: 22, z: 0, w: 6, d: 6 }
    ],
    humans: [
        { id: "guard_bay", kind: "guard", asset: "guard", x: 9, z: 3, facing: 180,
          patrol: [ { x: 9.0, z: 2.0, wait: 1.5 }, { x: 9.0, z: 9.0, wait: 1.0 }, { x: 12.5, z: 9.0, wait: 1.0 }, { x: 12.5, z: 2.0, wait: 1.0 } ] },
        { id: "guard_tower", kind: "guard", asset: "guard", x: 17, z: 16, facing: 90,
          patrol: [ { x: 15.5, z: 15.5, wait: 1.5 }, { x: 25.0, z: 15.5, wait: 1.0 }, { x: 25.0, z: 17.5, wait: 1.0 }, { x: 20.0, z: 18.5, wait: 1.5 } ] },
        { id: "fireman", kind: "civilian", asset: "firefighter_human", x: 18, z: 1.5, facing: 180, vulnerable: true, recruit: "firefighter", label: "Night firefighter",
          wander: [ { x: 18.0, z: 1.5, wait: 3.0 }, { x: 20.5, z: 5.0, wait: 2.0 }, { x: 15.5, z: 5.0, wait: 2.5 } ] },
        { id: "jogger", kind: "civilian", asset: "athlete_human", x: 27.0, z: 1.0, facing: 180, vulnerable: true, recruit: "athlete", label: "Trapped jogger",
          wander: [ { x: 27.0, z: 1.0, wait: 2.0 }, { x: 26.5, z: 5.0, wait: 2.0 } ] }
    ],
    cameras: [ { id: "cam_d", x: 14.3, z: 11.7, facing: 45, sweep: 30, period: 8.0, mountHeight: 2.3 } ],
    lasers: [],
    panels: [ { id: "panel_e", x: 27.6, z: 7.0, facing: 270, links: ["cam_d"], label: "Camera panel" } ],
    objectives: {
        main: { id: "escape", kind: "escape", label: "Open the bay door and get out" },
        optional: [
            { id: "firefighter", kind: "capture", target: "firefighter", label: "Recruit the Firefighter" },
            { id: "sprinklers", kind: "control", target: "sprinklers", label: "Run the sprinklers" },
            { id: "jogger", kind: "capture", target: "athlete", label: "Rescue the trapped jogger" },
            { id: "stealth", kind: "noAlert", label: "Avoid a full alarm" },
            { id: "fast", kind: "time", seconds: 300, label: "Escape within 5:00" }
        ]
    },
    tutorial: [
        { id: "move", text: "Fire blocks the way and smoke makes zombies cough (loudly). Valves, sprinklers and the fan shut them off.", at: "start" },
        { id: "bite", text: "Bite the firefighter: he walks through fire and smoke and knows every valve.", at: "fireman" }
    ]
}
