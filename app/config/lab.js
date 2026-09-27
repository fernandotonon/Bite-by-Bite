// Mission 7 - Outbreak Protocol (the finale). New here: medical doors (the Doctor's passive), sedation (a human
// asleep for a while, no alarm), containment cells holding zombies that join the squad when released, a squad of
// three, and a staged objective: the master release must run before the evacuation route counts.
.pragma library
.import "missions.js" as Base

var rect = Base.rect, wall = Base.wall

var lab = {
    id: "outbreak_protocol",
    order: 7,
    requiresMission: "dead_air_studio",
    unlockText: "Complete Dead Air",
    title: "Outbreak Protocol",
    subtitle: "Finale",
    finale: true,
    location: "lab_building",
    recruits: ["doctor"],
    size: { w: 28, d: 20 },
    story: "The Rotterdale Research Facility is where the outbreak started - and where the first zombies are still kept " +
           "in containment. Get in through decontamination, find the night doctor, open the medical wing, release " +
           "the cells and walk the whole horde out of the evacuation tunnel.",
    briefing: {
        objective: "Release the contained zombies and escape through the evacuation tunnel.",
        hazards: ["3 patrolling guards", "2 security cameras", "a lab technician who screams", "medical doors (the doctor's badge)"],
        squadLimit: 3,
        suggested: ["Bite (recruit the doctor: medical doors, and a syringe that puts guards to sleep quietly)", "Three zombies: one distracts, one sabotages, one releases", "Sabotage (the hub panel kills the cameras)"],
        capture: "doctor",
        challenges: ["Recruit the Doctor", "Release every containment cell", "Avoid a full lockdown", "Find the final brain", "Finish within 6:00"]
    },
    targetTime: 360,
    squadLimit: 3,
    spawn: { x: 2.5, z: 2.5, facing: 90 },

    walls: [
        wall(0, 0, 28, 0), wall(0, 20, 28, 20), wall(0, 0, 0, 20), wall(28, 0, 28, 20),
        // decontamination A (x0-8, z0-8) | medical lab B (x8-18, z0-8) | observation wing C (x18-28, z0-8)
        wall(8, 0, 8, 3), wall(8, 4.5, 8, 8),
        wall(18, 0, 18, 2), wall(18, 3.5, 18, 8),
        // containment E (x0-18, z8-20) below A and B: medical door B->E at x11-12.5 (z=8); weak wall A->E at x3-5
        wall(0, 8, 3, 8), wall(5, 8, 11, 8), wall(12.5, 8, 18, 8),
        rect(3, 8 - 0.15, 2, 0.3, { weak: true }),
        // security hub D (x18-28, z8-14): from C at x22-23.5 (z=8); gate D->E at x=18 z10-11.5 ; to the tunnel F at z=14 x24-25.5
        wall(18, 8, 22, 8), wall(23.5, 8, 28, 8),
        wall(18, 8, 18, 10), wall(18, 11.5, 18, 14),
        wall(18, 14, 24, 14), wall(25.5, 14, 28, 14),
        // evacuation tunnel F (x18-28, z14-20): from E at x=18 z16-17.5
        wall(18, 14, 18, 16), wall(18, 17.5, 18, 20),
        // cell block inside E: three cells along z=17-20, x2-6, 7-11, 12-16 (front walls with the cell doors)
        wall(2, 17, 3.2, 17), wall(4.8, 17, 6, 17), wall(7, 17, 8.2, 17), wall(9.8, 17, 11, 17), wall(12, 17, 13.2, 17), wall(14.8, 17, 16, 17),   // cell doors at x3.2-4.8, 8.2-9.8, 13.2-14.8
        wall(2, 17, 2, 20), wall(6, 17, 6, 20), wall(7, 17, 7, 20), wall(11, 17, 11, 20), wall(12, 17, 12, 20), wall(16, 17, 16, 20)
    ],
    doors: [
        { id: "door_lab", x: 8 - 0.15, z: 3, w: 0.3, d: 1.5, open: false, label: "Medical lab" },
        { id: "door_obs", x: 18 - 0.15, z: 2, w: 0.3, d: 1.5, open: false, label: "Observation wing" },
        { id: "door_medical", x: 11, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, lockType: "medical", label: "Containment (medical door)" },
        { id: "door_hub", x: 22, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, label: "Security hub" },
        { id: "gate_hub", x: 18 - 0.15, z: 10, w: 0.3, d: 1.5, open: false, sealed: true, asset: "dock_shutter", label: "Containment gate" },
        { id: "door_tunnel", x: 18 - 0.15, z: 16, w: 0.3, d: 1.5, open: false, label: "Evacuation tunnel" },
        { id: "door_tunnel_hub", x: 24, z: 14 - 0.15, w: 1.5, d: 0.3, open: false, lockType: "security", label: "Tunnel security door" },
        { id: "cell_door_1", x: 3.2, z: 17 - 0.15, w: 1.6, d: 0.3, open: false, sealed: true, label: "Cell 1" },
        { id: "cell_door_2", x: 8.2, z: 17 - 0.15, w: 1.6, d: 0.3, open: false, sealed: true, label: "Cell 2" },
        { id: "cell_door_3", x: 13.2, z: 17 - 0.15, w: 1.6, d: 0.3, open: false, sealed: true, label: "Cell 3" }
    ],
    controls: [
        { id: "release_master", kind: "containment", x: 27.2, z: 9.0, facing: 270, label: "Containment master release", links: ["gate_hub", "cell_door_1"], releases: "cell_z1", asset: "lab_console" },
        { id: "cell_2", kind: "containment", x: 9.0, z: 16.4, facing: 180, label: "Cell 2 release", links: ["cell_door_2"], releases: "cell_z2", asset: "electrical_panel" },
        { id: "cell_3", kind: "containment", x: 14.0, z: 16.4, facing: 180, label: "Cell 3 release", links: ["cell_door_3"], releases: "cell_z3", asset: "electrical_panel" }
    ],
    traversals: [
        { id: "vent_hub", kind: "vent", requires: "crawl", from: { x: 17.4, z: 12.8 }, to: { x: 18.8, z: 12.8 }, label: "Vent into the hub", asset: "vent_hatch", duration: 2.0 }
    ],
    props: [
        { id: "scanner_a", asset: "med_scanner", x: 4.0, z: 4.5, facing: 0, w: 2.4, d: 1.4, blocksSight: true },
        { id: "locker_a", asset: "locker", x: 0.4, z: 0.4, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Suit locker" },
        { id: "tank_b1", asset: "specimen_tank", x: 9.0, z: 0.5, facing: 0, w: 1.0, d: 1.0, blocksSight: true },
        { id: "tank_b2", asset: "specimen_tank", x: 15.5, z: 0.5, facing: 0, w: 1.0, d: 1.0, blocksSight: true },
        { id: "console_b", asset: "lab_console", x: 12.0, z: 0.4, facing: 0, w: 2.0, d: 0.8, blocksSight: true },
        { id: "cart_b", asset: "medical_cart", x: 13.0, z: 5.0, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Lab cart" },
        { id: "bed_c", asset: "hospital_bed_modern", x: 19.0, z: 0.6, facing: 0, w: 1.1, d: 2.2, blocksSight: false },
        { id: "scanner_c", asset: "med_scanner", x: 23.5, z: 4.5, facing: 0, w: 2.4, d: 1.4, blocksSight: true },
        { id: "locker_c", asset: "locker", x: 27.4, z: 0.4, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "console_d", asset: "control_console", x: 18.4, z: 8.4, facing: 0, w: 3.0, d: 0.8, blocksSight: true },
        { id: "rack_d", asset: "server_rack", x: 27.2, z: 12.5, facing: 270, w: 0.8, d: 0.8, blocksSight: true },
        { id: "cell_c1", asset: "containment_cell", x: 3.2, z: 17.6, facing: 0, w: 1.6, d: 1.6, decor: true },
        { id: "cell_c2", asset: "containment_cell", x: 8.2, z: 17.6, facing: 0, w: 1.6, d: 1.6, decor: true },
        { id: "cell_c3", asset: "containment_cell", x: 13.2, z: 17.6, facing: 0, w: 1.6, d: 1.6, decor: true },
        { id: "tank_e", asset: "specimen_tank", x: 0.5, z: 12.0, facing: 0, w: 1.0, d: 1.0, blocksSight: true },
        { id: "locker_e", asset: "locker", x: 16.4, z: 9.0, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" },
        { id: "cart_e", asset: "medical_cart", x: 8.0, z: 12.0, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Specimen cart" },
        { id: "locker_f", asset: "locker", x: 27.4, z: 19.0, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Locker" }
    ],
    pickups: [ { id: "radio", kind: "radio", x: 6.5, z: 6.8, label: "Lab radio" } ],
    collectibles: [ { id: "brain", asset: "brain_jar", x: 0.8, z: 19.2, label: "The first brain" } ],
    zones: [
        { id: "start", kind: "start", x: 0.3, z: 0.3, w: 7.4, d: 7.4 },
        { id: "cp_lab", kind: "checkpoint", x: 8.2, z: 2.5, w: 2.5, d: 2.5, label: "Checkpoint" },
        { id: "cp_hub", kind: "checkpoint", x: 21.5, z: 8.2, w: 3, d: 2, label: "Checkpoint" },
        { id: "cp_cells", kind: "checkpoint", x: 10.5, z: 8.2, w: 3, d: 2.5, label: "Checkpoint" },
        { id: "exit", kind: "exit", x: 18.4, z: 14.4, w: 9.3, d: 5.3, requires: ["release_master"], label: "Evacuation tunnel" },
        { id: "sec_c", kind: "security", x: 18, z: 0, w: 10, d: 8 },
        { id: "sec_d", kind: "security", x: 18, z: 8, w: 10, d: 6 }
    ],
    humans: [
        { id: "guard_obs", kind: "guard", asset: "guard", x: 20, z: 5, facing: 90,
          patrol: [ { x: 19.5, z: 6.5, wait: 1.5 }, { x: 27.0, z: 6.5, wait: 1.0 }, { x: 27.0, z: 2.5, wait: 1.0 }, { x: 21.5, z: 2.5, wait: 1.0 } ] },
        { id: "guard_hub", kind: "guard", asset: "guard", x: 22, z: 11, facing: 90,
          patrol: [ { x: 19.5, z: 11.0, wait: 1.5 }, { x: 26.0, z: 11.0, wait: 1.5 }, { x: 24.5, z: 13.0, wait: 1.0 } ] },
        { id: "guard_cells", kind: "guard", asset: "guard", x: 8, z: 12, facing: 90,
          patrol: [ { x: 1.5, z: 10.0, wait: 1.0 }, { x: 16.5, z: 10.0, wait: 1.0 }, { x: 16.5, z: 15.0, wait: 1.0 }, { x: 1.5, z: 15.0, wait: 1.0 } ] },
        { id: "doctor", kind: "civilian", asset: "doctor_human", x: 12, z: 3.5, facing: 180, vulnerable: true, recruit: "doctor", label: "Night doctor",
          wander: [ { x: 12.0, z: 3.5, wait: 3.0 }, { x: 16.0, z: 6.0, wait: 2.0 }, { x: 9.5, z: 6.0, wait: 2.5 } ] },
        { id: "tech", kind: "civilian", asset: "nurse", x: 25, z: 4, facing: 180, vulnerable: true, witness: true, view: { angle: 55, range: 4.0 }, label: "Lab technician" },
        { id: "cell_z1", kind: "captive", asset: "zombie_standard", x: 4.0, z: 18.6, facing: 0, recruit: "standard", label: "Contained zombie" },
        { id: "cell_z2", kind: "captive", asset: "zombie_nurse", x: 9.0, z: 18.6, facing: 0, recruit: "nurse", label: "Contained nurse" },
        { id: "cell_z3", kind: "captive", asset: "zombie_chef", x: 14.0, z: 18.6, facing: 0, recruit: "chef", label: "Contained chef" }
    ],
    cameras: [ { id: "cam_c", x: 18.3, z: 5.0, facing: 90, sweep: 40, period: 8.0, mountHeight: 2.3 }, { id: "cam_e", x: 9.0, z: 8.3, facing: 0, sweep: 50, period: 9.0, mountHeight: 2.3 } ],
    lasers: [],
    panels: [ { id: "panel_hub", x: 19.6, z: 13.4, facing: 270, links: ["cam_c", "cam_e", "gate_hub"], label: "Lockdown panel" } ],
    objectives: {
        main: { id: "escape", kind: "escape", label: "Release the horde and escape through the tunnel" },
        optional: [
            { id: "doctor", kind: "capture", target: "doctor", label: "Recruit the Doctor" },
            { id: "cells", kind: "controls", targets: ["cell_2", "cell_3"], label: "Release every containment cell" },
            { id: "stealth", kind: "noAlert", label: "Avoid a full lockdown" },
            { id: "brain", kind: "collectible", target: "brain", label: "Find the final brain" },
            { id: "fast", kind: "time", seconds: 360, label: "Finish within 6:00" }
        ]
    },
    tutorial: [
        { id: "move", text: "The master release in the security hub opens the containment gate and counts as the alarm... unless the doctor's badge gets you in through the medical wing first.", at: "start" },
        { id: "bite", text: "Bite the doctor: medical doors open for her, and her syringe (Q) puts a guard to sleep without a sound.", at: "doctor" }
    ]
}
