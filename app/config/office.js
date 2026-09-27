// Mission 4 - Graveyard Shift Inc. New here: terminals and badge readers (the Office Worker's `terminal`
// ability opens them for good; the Electrician's sabotage of the wiring panel opens them only for a while),
// an elevator to the executive floor, security and office zones, a hidden server room.
.pragma library
.import "missions.js" as Base

var rect = Base.rect, wall = Base.wall

var office = {
    id: "office_graveyard_shift",
    order: 4,
    requiresMission: "school_detention",
    unlockText: "Complete Detention of the Dead",
    title: "Graveyard Shift Inc.",
    subtitle: "Mission 4",
    location: "office_building",
    recruits: ["office"],
    size: { w: 28, d: 20 },
    story: "Graveyard Shift Inc. runs its servers all night. Get the horde to the executive floor and transmit the " +
           "outbreak through the company network - the badge readers answer to anyone who knows the terminals.",
    briefing: {
        objective: "Reach the executive floor and transmit the outbreak from the CEO's terminal.",
        hazards: ["2 patrolling guards", "1 security camera", "badge readers on the elevator and the server room", "a receptionist who screams"],
        squadLimit: 2,
        suggested: ["Bite (recruit the office worker: terminals and badge readers, quietly)", "Sabotage (the wiring panel opens the readers for a while)", "Master key (the stairwell bypasses the elevator)"],
        capture: "office",
        challenges: ["Recruit the Office Worker", "Access the hidden server room", "Avoid a full alarm", "Find the hidden brain", "Finish within 5:00"]
    },
    targetTime: 300,
    squadLimit: 2,
    spawn: { x: 2.0, z: 2.0, facing: 180 },

    walls: [
        wall(0, 0, 28, 0), wall(0, 20, 28, 20), wall(0, 0, 0, 20), wall(28, 0, 28, 20),
        // reception A (x0-8, z0-8) | open-plan B (x8-20, z0-12) | meeting room C (x20-28, z0-6) | server room D (x20-28, z6-12)
        wall(8, 0, 8, 3), wall(8, 4.5, 8, 8),                         // reception -> office: security door at z3-4.5
        wall(20, 0, 20, 2), wall(20, 3.5, 20, 6),                     // office -> meeting room door z2-3.5
        wall(20, 6, 28, 6),
        rect(20 - 0.15, 4.0, 0.3, 2.0, { weak: true }),               // weak wall office -> meeting room (brute)
        wall(20, 6, 20, 8.5), wall(20, 10, 20, 12),                   // server room badge door z8.5-10
        // stairwell / parking corridor S (x0-8, z8-20) | executive floor E (x8-28, z12-20)
        wall(0, 8, 2, 8), wall(3.5, 8, 8, 8),                         // reception -> stairwell (maintenance door x2-3.5)
        wall(8, 8, 8, 14), wall(8, 15.5, 8, 20),                      // stairwell -> exec floor door z14-15.5 (from the stairs)
        wall(8, 12, 13, 12), wall(14.5, 12, 28, 12),                  // office -> exec floor: elevator at x13-14.5
        // CEO office inside E: x22-28, z14-20 with a door at x22 z16-17.5
        wall(22, 14, 22, 16), wall(22, 17.5, 22, 20), wall(22, 14, 28, 14)
    ],
    doors: [
        { id: "door_reception", x: 8 - 0.15, z: 3, w: 0.3, d: 1.5, open: false, lockType: "security", label: "Reception gate" },
        { id: "door_side", x: 2, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, lockType: "maintenance", label: "Stairwell door" },
        { id: "door_meeting", x: 20 - 0.15, z: 2, w: 0.3, d: 1.5, open: false, label: "Meeting room" },
        { id: "door_server", x: 20 - 0.15, z: 8.5, w: 0.3, d: 1.5, open: false, sealed: true, label: "Server room badge door" },
        { id: "elevator_door", x: 13, z: 12 - 0.15, w: 1.5, d: 0.3, open: false, sealed: true, asset: "elevator", label: "Elevator" },
        { id: "door_stairs", x: 8 - 0.15, z: 14, w: 0.3, d: 1.5, open: false, label: "Stairwell exit" },
        { id: "door_ceo", x: 22 - 0.15, z: 16, w: 0.3, d: 1.5, open: false, label: "CEO's office" }
    ],
    controls: [
        { id: "reader_server", kind: "terminal", x: 18.8, z: 9.2, facing: 90, label: "Server-room reader", requires: "terminal", fallback: "smash", links: ["door_server"], asset: "lab_console" },
        { id: "server_terminal", kind: "terminal", x: 26.5, z: 9.0, facing: 270, label: "Server terminal", requires: "terminal", fallback: "smash", links: [], asset: "server_rack" },
        { id: "elevator_panel", kind: "terminal", x: 15.2, z: 11.2, facing: 0, label: "Elevator badge reader", requires: "terminal", fallback: "smash", links: ["elevator_door"], asset: "electrical_panel" },
        { id: "ceo_terminal", kind: "terminal", x: 27.2, z: 15.0, facing: 270, label: "CEO's terminal", requires: "terminal", fallback: "smash", links: [], asset: "control_console" }
    ],
    traversals: [
        { id: "duct_exec", kind: "vent", requires: "crawl", from: { x: 17.2, z: 11.4 }, to: { x: 17.2, z: 12.8 }, label: "Cable duct to the executive floor", asset: "vent_hatch", duration: 2.0 }
    ],
    props: [
        { id: "desk_reception", asset: "reception_desk", x: 3.0, z: 4.5, facing: 0, w: 2.6, d: 0.9, blocksSight: true },
        { id: "locker_a", asset: "locker", x: 0.4, z: 0.4, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Coat closet" },
        { id: "plant_a", asset: "iv_stand", x: 7.2, z: 0.6, facing: 0, w: 0.4, d: 0.4, blocksSight: false },
        { id: "cube_1", asset: "office_cubicle", x: 9.0, z: 1.0, facing: 0, w: 1.6, d: 1.2, blocksSight: true },
        { id: "cube_2", asset: "office_cubicle", x: 12.0, z: 1.0, facing: 0, w: 1.6, d: 1.2, blocksSight: true },
        { id: "cube_3", asset: "office_cubicle", x: 15.0, z: 1.0, facing: 0, w: 1.6, d: 1.2, blocksSight: true },
        { id: "cube_4", asset: "office_cubicle", x: 9.0, z: 5.5, facing: 180, w: 1.6, d: 1.2, blocksSight: true },
        { id: "cube_5", asset: "office_cubicle", x: 12.0, z: 5.5, facing: 180, w: 1.6, d: 1.2, blocksSight: true },
        { id: "cube_6", asset: "office_cubicle", x: 15.0, z: 5.5, facing: 180, w: 1.6, d: 1.2, blocksSight: true },
        { id: "cart_b", asset: "medical_cart", x: 11.0, z: 9.0, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Mail cart" },
        { id: "vend_b", asset: "vending_machine", x: 18.9, z: 0.3, facing: 0, w: 1.0, d: 0.8, blocksSight: true },
        { id: "table_c", asset: "meeting_table", x: 22.8, z: 2.2, facing: 0, w: 2.4, d: 1.2, blocksSight: false },
        { id: "rack_1", asset: "server_rack", x: 21.0, z: 6.4, facing: 180, w: 0.8, d: 0.8, blocksSight: true },
        { id: "rack_2", asset: "server_rack", x: 23.0, z: 6.4, facing: 180, w: 0.8, d: 0.8, blocksSight: true },
        { id: "rack_3", asset: "server_rack", x: 25.0, z: 6.4, facing: 180, w: 0.8, d: 0.8, blocksSight: true },
        { id: "locker_s", asset: "locker", x: 0.4, z: 18.9, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Janitor closet" },
        { id: "wheel_s", asset: "wheelchair", x: 4.0, z: 12.0, facing: 90, w: 0.9, d: 0.9, blocksSight: false, movable: true, label: "Office chair" },
        { id: "cube_e1", asset: "office_cubicle", x: 10.0, z: 16.0, facing: 90, w: 1.2, d: 1.6, blocksSight: true },
        { id: "cube_e2", asset: "office_cubicle", x: 15.0, z: 16.0, facing: 270, w: 1.2, d: 1.6, blocksSight: true },
        { id: "locker_e", asset: "locker", x: 21.4, z: 12.4, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Supply closet" },
        { id: "table_ceo", asset: "meeting_table", x: 24.0, z: 17.5, facing: 0, w: 2.4, d: 1.2, blocksSight: false }
    ],
    pickups: [ { id: "radio", kind: "radio", x: 6.5, z: 6.8, label: "Desk radio" } ],
    collectibles: [ { id: "brain", asset: "brain_jar", x: 27.2, z: 11.2, label: "Brain in a jar" } ],
    zones: [
        { id: "start", kind: "start", x: 0.3, z: 0.3, w: 7.4, d: 7.4 },
        { id: "cp_office", kind: "checkpoint", x: 8.2, z: 2.8, w: 2.5, d: 2, label: "Checkpoint" },
        { id: "cp_exec", kind: "checkpoint", x: 12.5, z: 12.2, w: 3, d: 2.5, label: "Checkpoint" },
        { id: "exit", kind: "exit", x: 8.4, z: 17.5, w: 5, d: 2.3, requires: ["ceo_terminal"], label: "Parking garage" },
        { id: "office_b", kind: "office", x: 8, z: 0, w: 12, d: 12 },
        { id: "office_e", kind: "office", x: 8, z: 12, w: 14, d: 8 },
        { id: "sec_a", kind: "security", x: 0, z: 0, w: 8, d: 8 },
        { id: "maint_s", kind: "maintenance", x: 0, z: 8, w: 8, d: 12 }
    ],
    humans: [
        { id: "guard_office", kind: "guard", asset: "guard", x: 9, z: 3.5, facing: 90,
          patrol: [ { x: 9.0, z: 3.5, wait: 1.5 }, { x: 18.5, z: 3.5, wait: 1.0 }, { x: 18.5, z: 9.5, wait: 1.5 }, { x: 9.5, z: 9.5, wait: 1.0 } ] },
        { id: "guard_exec", kind: "guard", asset: "guard", x: 12, z: 14, facing: 90,
          patrol: [ { x: 10.0, z: 14.0, wait: 1.5 }, { x: 20.5, z: 14.0, wait: 1.0 }, { x: 20.5, z: 18.5, wait: 1.5 }, { x: 10.0, z: 18.5, wait: 1.0 } ] },
        { id: "clerk", kind: "civilian", asset: "office_worker_human", x: 13.5, z: 8.0, facing: 0, vulnerable: true, recruit: "office", label: "Office worker",
          wander: [ { x: 13.5, z: 8.0, wait: 3.0 }, { x: 10.0, z: 7.5, wait: 2.0 }, { x: 16.5, z: 8.0, wait: 2.5 } ] },
        { id: "receptionist", kind: "civilian", asset: "nurse", x: 3.5, z: 3.2, facing: 180, vulnerable: true, witness: true, view: { angle: 50, range: 4.0 }, label: "Receptionist" }
    ],
    cameras: [ { id: "cam_b", x: 8.3, z: 6.5, facing: 100, sweep: 35, period: 9.0, mountHeight: 2.3 } ],
    lasers: [],
    panels: [ { id: "panel_wiring", x: 19.6, z: 11.0, facing: 270, links: ["cam_b", "elevator_door", "door_server"], label: "Wiring panel" } ],
    objectives: {
        main: { id: "escape", kind: "escape", label: "Transmit the outbreak from the CEO's terminal and leave" },
        optional: [
            { id: "office", kind: "capture", target: "office", label: "Recruit the Office Worker" },
            { id: "server", kind: "control", target: "server_terminal", label: "Access the hidden server room" },
            { id: "stealth", kind: "noAlert", label: "Avoid a full alarm" },
            { id: "brain", kind: "collectible", target: "brain", label: "Find the hidden brain" },
            { id: "fast", kind: "time", seconds: 300, label: "Finish within 5:00" }
        ]
    },
    tutorial: [
        { id: "move", text: "The reception gate needs security access. The office worker knows the terminals - or a janitor knows the stairwell.", at: "start" },
        { id: "bite", text: "Bite the office worker: terminals and badge readers open quietly for her.", at: "clerk" }
    ]
}
