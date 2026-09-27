// Mission 2 - Mall After Closing. Same data shape as the hospital (see missions.js for the field reference).
// New here: security lock type, sealed doors opened by controls (shutter / console, with a smash fallback),
// food bait (chef), a guard dog, kitchen / security zones, a vent traversal (crawl - a replay shortcut).
.pragma library
.import "missions.js" as Base

var rect = Base.rect, wall = Base.wall

var mall = {
    id: "mall_after_closing",
    order: 2,
    requiresMission: "hospital_night_shift",
    unlockText: "Complete Night Shift at St. Rotter Hospital",
    title: "Mall After Closing",
    subtitle: "Mission 2",
    location: "mall_building",
    recruits: ["chef", "guard"],
    size: { w: 28, d: 20 },
    story: "The horde followed the smell of pretzels to the Rotterdale Mall. The loading dock is the only way out, " +
           "and its shutter answers to mall security. The night guard has the badge - and the food-court chef has the bait.",
    briefing: {
        objective: "Open the loading-dock shutter and escape the mall.",
        hazards: ["2 patrolling guards", "1 guard dog (hears everything)", "1 security camera", "security doors and a sealed shutter"],
        squadLimit: 2,
        suggested: ["Bite (recruit the chef, then the guard)", "Food bait (send the dog and the guards elsewhere)", "Security access (doors, console and shutter without alarms)"],
        capture: "guard",
        challenges: ["Recruit the Chef", "Recruit the Security Guard", "Avoid a full alarm", "Find the hidden brain", "Escape within 5:00"]
    },
    targetTime: 300,
    squadLimit: 2,
    spawn: { x: 2.5, z: 3.0, facing: 90 },

    walls: [
        // outer shell
        wall(0, 0, 28, 0), wall(0, 20, 28, 20), wall(0, 0, 0, 20), wall(28, 0, 28, 20),
        // storefront A (x0-8, z0-6) | corridor B (x8-20, z0-6) | security office D (x20-28, z0-6)
        wall(8, 0, 8, 2.5), wall(8, 4, 8, 6),
        wall(20, 0, 20, 2.5), wall(20, 4, 20, 6),
        // A / food court C (x0-12, z6-14): solid; B -> C opening at x9-11
        wall(0, 6, 9, 6), wall(11, 6, 15, 6), wall(16.5, 6, 20, 6),                 // B -> E service door at x15-16.5
        wall(20, 6, 28, 6),
        // C | service corridor E (x12-20, z6-14): kitchen door C->E at z9-10.5 (maintenance)
        wall(12, 6, 12, 9), wall(12, 10.5, 12, 14),
        // E | D: solid; D south already
        wall(20, 6, 20, 14),
        // C / dock F (z14): weak wall at x2-4 (brute), solid elsewhere
        wall(0, 14, 2, 14), wall(4, 14, 15, 14), wall(16.5, 14, 28, 14),           // E -> F security door at x15-16.5
        rect(2, 14 - 0.15, 2, 0.3, { weak: true }),
        // dock F: the shutter wall at x22, z15-18 (sealed door), walls around it
        wall(22, 14, 22, 15), wall(22, 18, 22, 20),
        // kitchen counter line (K: x0-5, z9-14) - half wall with a gap at z11.5-13
        wall(5, 9, 5, 11.5), wall(5, 13, 5, 14)
    ],
    doors: [
        { id: "door_store", x: 8 - 0.15, z: 2.5, w: 0.3, d: 1.5, open: false, label: "Storefront door" },
        { id: "door_security", x: 20 - 0.15, z: 2.5, w: 0.3, d: 1.5, open: false, label: "Security office" },
        { id: "door_service", x: 15, z: 6 - 0.15, w: 1.5, d: 0.3, open: false, label: "Service door" },
        { id: "door_kitchen", x: 12 - 0.15, z: 9, w: 0.3, d: 1.5, open: false, lockType: "maintenance", label: "Kitchen service door" },
        { id: "door_dock", x: 15, z: 14 - 0.15, w: 1.5, d: 0.3, open: false, lockType: "security", label: "Dock security door" },
        { id: "shutter", x: 22 - 0.15, z: 15, w: 0.3, d: 3, open: false, sealed: true, asset: "dock_shutter", label: "Loading-dock shutter" }
    ],
    controls: [
        { id: "dock_console", kind: "console", x: 26.5, z: 1.2, facing: 180, label: "Security console", requires: "securityAccess", fallback: "smash", links: ["door_dock"], asset: "control_console" },
        { id: "shutter_switch", kind: "shutter", x: 21.4, z: 19.2, facing: 0, label: "Shutter switch", requires: "securityAccess", fallback: "smash", links: ["shutter"], asset: "electrical_panel" }
    ],
    traversals: [
        { id: "vent_dock", kind: "vent", requires: "crawl", from: { x: 10.5, z: 13.4 }, to: { x: 10.5, z: 15.0 }, label: "Vent to the dock", asset: "vent_hatch", duration: 2.0 }
    ],
    props: [
        { id: "store_shelf", asset: "locker", x: 0.4, z: 4.6, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Stock cupboard" },
        { id: "vend_b", asset: "vending_machine", x: 13.0, z: 0.3, facing: 0, w: 1.0, d: 0.8, blocksSight: true },
        { id: "cart_b", asset: "medical_cart", x: 17.5, z: 4.6, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Cleaning cart" },
        { id: "table_1", asset: "food_court_table", x: 2.0, z: 7.0, facing: 0, w: 1.6, d: 1.6, blocksSight: false },
        { id: "table_2", asset: "food_court_table", x: 6.5, z: 7.0, facing: 0, w: 1.6, d: 1.6, blocksSight: false },
        { id: "table_3", asset: "food_court_table", x: 8.0, z: 11.0, facing: 0, w: 1.6, d: 1.6, blocksSight: false },
        { id: "divider_c", asset: "curtain_divider", x: 6.2, z: 9.4, facing: 90, w: 0.4, d: 2.6, blocksSight: true },
        { id: "locker_e", asset: "locker", x: 19.4, z: 7.0, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "gate_d", asset: "security_gate", x: 21.0, z: 2.3, facing: 90, w: 0.5, d: 1.2, decor: true },
        { id: "desk_d", asset: "reception_desk", x: 23.5, z: 4.5, facing: 180, w: 2.6, d: 0.9, blocksSight: true },
        { id: "locker_f", asset: "locker", x: 0.4, z: 18.9, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "crate_f", asset: "vending_machine", x: 12.0, z: 16.5, facing: 0, w: 1.0, d: 0.8, blocksSight: true },
        { id: "crate_f2", asset: "vending_machine", x: 18.0, z: 18.6, facing: 0, w: 1.0, d: 0.8, blocksSight: true },
        { id: "wheelchair_f", asset: "wheelchair", x: 6.0, z: 16.0, facing: 90, w: 0.9, d: 0.9, blocksSight: false, movable: true, label: "Trolley" }
    ],
    pickups: [ { id: "radio", kind: "radio", x: 6.5, z: 2.5, label: "Radio" } ],
    collectibles: [ { id: "brain", asset: "brain_jar", x: 0.8, z: 13.2, label: "Brain in a jar" } ],
    zones: [
        { id: "start", kind: "start", x: 0.3, z: 0.3, w: 7.4, d: 5.4 },
        { id: "cp_service", kind: "checkpoint", x: 13, z: 6.2, w: 6.8, d: 2.2, label: "Checkpoint" },
        { id: "exit", kind: "exit", x: 22.4, z: 14.4, w: 5.3, d: 5.3, label: "Loading dock" },
        { id: "kitchen", kind: "kitchen", x: 0, z: 9, w: 5, d: 5 },
        { id: "maint_e", kind: "maintenance", x: 12, z: 6, w: 8, d: 8 },
        { id: "sec_d", kind: "security", x: 20, z: 0, w: 8, d: 6 },
        { id: "sec_f", kind: "security", x: 12, z: 14, w: 10, d: 6 }
    ],
    humans: [
        { id: "guard_corridor", kind: "guard", asset: "guard", x: 10, z: 3, facing: 90,
          patrol: [ { x: 9.5, z: 3.0, wait: 1.5 }, { x: 19.0, z: 3.0, wait: 1.5 }, { x: 19.0, z: 1.2, wait: 0.5 }, { x: 9.5, z: 1.2, wait: 0.5 } ] },
        { id: "guard_dock", kind: "guard", asset: "guard", x: 16, z: 8, facing: 0,
          patrol: [ { x: 16.0, z: 8.0, wait: 1.5 }, { x: 16.0, z: 12.5, wait: 1.0 }, { x: 13.0, z: 12.5, wait: 1.0 }, { x: 13.0, z: 8.0, wait: 1.0 } ] },
        { id: "dog", kind: "dog", asset: "dog", x: 8, z: 8, facing: 180, label: "Guard dog",
          patrol: [ { x: 8.5, z: 8.0, wait: 0.5 }, { x: 10.5, z: 12.5, wait: 1.0 }, { x: 7.0, z: 12.5, wait: 0.5 }, { x: 3.0, z: 8.5, wait: 1.0 } ] },
        { id: "chef", kind: "civilian", asset: "chef_human", x: 2.5, z: 11.5, facing: 90, vulnerable: true, recruit: "chef", label: "Chef",
          wander: [ { x: 2.5, z: 10.0, wait: 3.0 }, { x: 4.2, z: 12.5, wait: 2.0 }, { x: 1.2, z: 13.0, wait: 2.5 } ] },
        { id: "sec_guard", kind: "civilian", asset: "guard", x: 24, z: 2, facing: 180, vulnerable: true, recruit: "guard", label: "Security guard",
          wander: [ { x: 24.0, z: 2.0, wait: 3.0 }, { x: 26.5, z: 2.4, wait: 2.5 }, { x: 22.0, z: 1.2, wait: 2.0 } ] }
    ],
    cameras: [ { id: "cam_b", x: 14.0, z: 0.25, facing: 0, sweep: 40, period: 8.0, mountHeight: 2.3 } ],
    lasers: [],
    panels: [ { id: "panel_e", x: 19.6, z: 11.0, facing: 270, links: ["cam_b"], label: "Camera panel" } ],
    objectives: {
        main: { id: "escape", kind: "escape", label: "Open the shutter and escape the mall" },
        optional: [
            { id: "chef", kind: "capture", target: "chef", label: "Recruit the Chef" },
            { id: "guard", kind: "capture", target: "guard", label: "Recruit the Security Guard" },
            { id: "stealth", kind: "noAlert", label: "Avoid a full alarm" },
            { id: "brain", kind: "collectible", target: "brain", label: "Find the hidden brain" },
            { id: "fast", kind: "time", seconds: 300, label: "Escape within 5:00" }
        ]
    },
    tutorial: [
        { id: "move", text: "The dock shutter answers to mall security. Find the guard's badge - or make some noise.", at: "start" },
        { id: "bite", text: "Bite the chef: food bait sends dogs and guards wherever it lands.", at: "chef" }
    ]
}
