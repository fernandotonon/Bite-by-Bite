// Mission 3 - Detention of the Dead. New here: a vault traversal (athlete), a vent (kid), two timed switches
// that must be active at the same time to open the gym exit, and an exit that only counts once the bell rang.
.pragma library
.import "missions.js" as Base

var rect = Base.rect, wall = Base.wall

var school = {
    id: "school_detention",
    order: 3,
    requiresMission: "mall_after_closing",
    unlockText: "Complete Mall After Closing",
    title: "Detention of the Dead",
    subtitle: "Mission 3",
    location: "school_building",
    recruits: ["child", "athlete"],
    size: { w: 28, d: 20 },
    story: "Rotterdale Middle School keeps its gym locked after the evening detention. Ring the emergency bell so the " +
           "whole school hears the outbreak, then get the horde out through the gym - the exit only opens while both " +
           "of its switches are held.",
    briefing: {
        objective: "Ring the emergency bell and escape through the school gym.",
        hazards: ["2 patrolling guards", "1 security camera", "timed gym switches (10 s)", "the gym exit needs both switches at once"],
        squadLimit: 2,
        suggested: ["Two zombies: one stays on a switch (H) while the other runs to the second", "Vault (the athlete hops the bleachers into the gym)", "Crawl (the kid reaches the switch closet through the vent)"],
        capture: "athlete",
        challenges: ["Recruit the Kid", "Recruit the Athlete", "Avoid a full alarm", "Find the hidden brain", "Escape within 5:00"]
    },
    targetTime: 300,
    squadLimit: 2,
    spawn: { x: 2.5, z: 3.0, facing: 90 },

    walls: [
        wall(0, 0, 28, 0), wall(0, 20, 28, 20), wall(0, 0, 0, 20), wall(28, 0, 28, 20),
        // classrooms A1 (x0-5, z0-8) A2 (x5-10) | principal's corridor C (x10-18) | cafeteria D (x18-28) - all above the corridor B (z8-11)
        wall(5, 0, 5, 3), wall(5, 4.5, 5, 8),                        // A1 <-> A2 door
        wall(10, 0, 10, 8),
        wall(18, 0, 18, 8),
        wall(0, 8, 2, 8), wall(3.5, 8, 7, 8), wall(8.5, 8, 12, 8), wall(13.5, 8, 22, 8), wall(23.5, 8, 28, 8),   // doors A1, A2, C, D onto the corridor
        // principal's office inside C: x14-18, z0-4 with the bell
        wall(14, 0, 14, 4), wall(14, 4, 15.5, 4), wall(17, 4, 18, 4),
        // locker rooms F (x0-10, z11-20) | gym E (x10-28, z11-20)
        wall(0, 11, 4, 11), wall(5.5, 11, 10, 11),                    // F door at x4-5.5
        wall(10, 11, 12, 11), wall(13.5, 11, 19, 11), wall(21, 11, 28, 11),   // E door at x12-13.5; low bleachers (vault) at x19-21
        wall(10, 11, 10, 20),
        rect(19, 10.85, 2, 0.3, { low: true }),                       // the bleachers: a low barrier
        // switch closet inside the gym: x25-28, z11-14, door at z12-13.5 on x=25
        wall(25, 11, 25, 12), wall(25, 13.5, 25, 14), wall(25, 14, 28, 14),
        // gym exit: sealed door at x=24, z16-19; walls around it
        wall(24, 14, 24, 16), wall(24, 19, 24, 20)
    ],
    doors: [
        { id: "door_a1", x: 2, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, label: "Classroom door" },
        { id: "door_a12", x: 5 - 0.15, z: 3, w: 0.3, d: 1.5, open: false, label: "Classroom door" },
        { id: "door_a2", x: 7, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, label: "Classroom door" },
        { id: "door_c", x: 12, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, label: "Principal's corridor" },
        { id: "door_office", x: 15.5, z: 4 - 0.15, w: 1.5, d: 0.3, open: false, label: "Principal's office" },
        { id: "door_d", x: 22, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, label: "Cafeteria" },
        { id: "door_f", x: 4, z: 11 - 0.15, w: 1.5, d: 0.3, open: false, lockType: "maintenance", label: "Locker rooms" },
        { id: "door_gym", x: 12, z: 11 - 0.15, w: 1.5, d: 0.3, open: false, label: "Gym" },
        { id: "door_closet", x: 25 - 0.15, z: 12, w: 0.3, d: 1.5, open: false, label: "Switch closet" },
        { id: "gym_exit", x: 24 - 0.15, z: 16, w: 0.3, d: 3, open: false, openedBy: ["switch_a", "switch_b"], asset: "dock_shutter", label: "Gym exit" }
    ],
    controls: [
        { id: "bell", kind: "bell", x: 17.6, z: 1.0, facing: 270, label: "Emergency bell", links: [], asset: "radio" },
        { id: "switch_a", kind: "switch", x: 10.4, z: 19.2, facing: 90, label: "Gym switch A", timed: 10, links: ["gym_exit"], asset: "electrical_panel" },
        { id: "switch_b", kind: "switch", x: 27.6, z: 12.7, facing: 270, label: "Gym switch B", timed: 10, links: ["gym_exit"], asset: "electrical_panel" }
    ],
    traversals: [
        { id: "vault_bleachers", kind: "vault", requires: "vault", from: { x: 20, z: 10.3 }, to: { x: 20, z: 11.9 }, label: "the bleachers", asset: "gym_bleachers", duration: 0.8 },
        { id: "vent_closet", kind: "vent", requires: "crawl", from: { x: 8.2, z: 19.0 }, to: { x: 26.0, z: 13.4 }, label: "Vent to the switch closet", asset: "vent_hatch", duration: 3.0 }
    ],
    props: [
        { id: "desk_1", asset: "school_desk", x: 1.0, z: 1.0, facing: 180, w: 1.0, d: 1.1, blocksSight: false },
        { id: "desk_2", asset: "school_desk", x: 3.0, z: 1.0, facing: 180, w: 1.0, d: 1.1, blocksSight: false },
        { id: "desk_3", asset: "school_desk", x: 1.0, z: 4.5, facing: 180, w: 1.0, d: 1.1, blocksSight: false },
        { id: "desk_4", asset: "school_desk", x: 6.0, z: 1.0, facing: 180, w: 1.0, d: 1.1, blocksSight: false },
        { id: "desk_5", asset: "school_desk", x: 8.0, z: 1.0, facing: 180, w: 1.0, d: 1.1, blocksSight: false },
        { id: "desk_6", asset: "school_desk", x: 6.0, z: 4.5, facing: 180, w: 1.0, d: 1.1, blocksSight: false },
        { id: "lockers_c", asset: "school_lockers", x: 10.3, z: 4.5, facing: 90, w: 0.5, d: 2.6, blocksSight: true },
        { id: "lockers_b", asset: "school_lockers", x: 15.0, z: 8.4, facing: 0, w: 2.6, d: 0.5, blocksSight: true },
        { id: "cart_c", asset: "medical_cart", x: 12.5, z: 5.0, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "AV cart" },
        { id: "table_d1", asset: "food_court_table", x: 20.0, z: 1.5, facing: 0, w: 1.6, d: 1.6, blocksSight: false },
        { id: "table_d2", asset: "food_court_table", x: 24.5, z: 1.5, facing: 0, w: 1.6, d: 1.6, blocksSight: false },
        { id: "table_d3", asset: "food_court_table", x: 22.0, z: 5.0, facing: 0, w: 1.6, d: 1.6, blocksSight: false },
        { id: "vend_d", asset: "vending_machine", x: 27.0, z: 4.5, facing: 270, w: 0.8, d: 1.0, blocksSight: true },
        { id: "locker_f1", asset: "locker", x: 0.4, z: 12.0, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "locker_f2", asset: "locker", x: 0.4, z: 17.0, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "bench_f", asset: "curtain_divider", x: 4.5, z: 15.0, facing: 90, w: 0.4, d: 2.6, blocksSight: true },
        { id: "bleachers_e", asset: "gym_bleachers", x: 14.0, z: 19.0, facing: 0, w: 3.0, d: 0.9, blocksSight: true },
        { id: "wheelchair_e", asset: "wheelchair", x: 17.0, z: 15.0, facing: 90, w: 0.9, d: 0.9, blocksSight: false, movable: true, label: "Equipment trolley" },
        { id: "locker_e", asset: "locker", x: 27.4, z: 19.0, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" }
    ],
    pickups: [ { id: "radio", kind: "radio", x: 8.5, z: 6.5, label: "Boombox" } ],
    collectibles: [ { id: "brain", asset: "brain_jar", x: 8.5, z: 12.0, label: "Brain in a jar" } ],
    zones: [
        { id: "start", kind: "start", x: 0.3, z: 0.3, w: 4.4, d: 7.4 },
        { id: "cp_corridor", kind: "checkpoint", x: 10, z: 8.2, w: 4, d: 2.6, label: "Checkpoint" },
        { id: "cp_gym", kind: "checkpoint", x: 12, z: 11.2, w: 3, d: 2.5, label: "Checkpoint" },
        { id: "exit", kind: "exit", x: 24.4, z: 14.4, w: 3.3, d: 5.3, requires: ["bell"], label: "Gym exit" },
        { id: "maint_f", kind: "maintenance", x: 0, z: 11, w: 10, d: 9 }
    ],
    humans: [
        { id: "guard_corridor", kind: "guard", asset: "guard", x: 3, z: 9.5, facing: 90,
          patrol: [ { x: 2.0, z: 9.5, wait: 1.5 }, { x: 26.0, z: 9.5, wait: 1.5 } ] },
        { id: "guard_gym", kind: "guard", asset: "guard", x: 16, z: 14, facing: 90,
          patrol: [ { x: 12.0, z: 13.0, wait: 1.0 }, { x: 23.0, z: 13.0, wait: 1.0 }, { x: 23.0, z: 18.5, wait: 1.0 }, { x: 12.0, z: 17.5, wait: 1.0 } ] },
        { id: "kid", kind: "civilian", asset: "child_human", x: 21, z: 3.5, facing: 180, vulnerable: true, recruit: "child", label: "Kid in detention",
          wander: [ { x: 21.0, z: 3.5, wait: 2.5 }, { x: 26.0, z: 6.5, wait: 2.0 }, { x: 19.0, z: 6.5, wait: 2.0 } ] },
        { id: "coach", kind: "civilian", asset: "athlete_human", x: 18, z: 17, facing: 0, vulnerable: true, recruit: "athlete", label: "Gym teacher",
          wander: [ { x: 18.0, z: 17.0, wait: 2.0 }, { x: 22.0, z: 16.0, wait: 2.5 }, { x: 15.0, z: 13.5, wait: 2.0 } ] },
        { id: "principal", kind: "civilian", asset: "office_worker_human", x: 16, z: 2, facing: 180, vulnerable: true, witness: true, view: { angle: 60, range: 4.0 }, label: "Principal" }
    ],
    cameras: [ { id: "cam_c", x: 13.8, z: 8.25, facing: -20, sweep: 35, period: 8.0, mountHeight: 2.3 } ],
    lasers: [],
    panels: [ { id: "panel_f", x: 9.6, z: 15.0, facing: 270, links: ["cam_c"], label: "Camera panel" } ],
    objectives: {
        main: { id: "escape", kind: "escape", label: "Ring the bell, then escape through the gym" },
        optional: [
            { id: "child", kind: "capture", target: "child", label: "Recruit the Kid" },
            { id: "athlete", kind: "capture", target: "athlete", label: "Recruit the Athlete" },
            { id: "stealth", kind: "noAlert", label: "Avoid a full alarm" },
            { id: "brain", kind: "collectible", target: "brain", label: "Find the hidden brain" },
            { id: "fast", kind: "time", seconds: 300, label: "Escape within 5:00" }
        ]
    },
    tutorial: [
        { id: "move", text: "Ring the emergency bell in the principal's office first - the gym exit will not count before that.", at: "start" },
        { id: "switch", text: "The gym exit stays open only while BOTH switches are held: park one zombie on a switch (H = stay) and run the other.", at: "recruit" }
    ]
}
