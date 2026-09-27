// Mission 6 - Dead Air. New here: the Screamer's directed scream (a big noise event guards investigate, civilians
// freeze), the live-microphone sound stage (any noise there is on the speakers: alarm + a stun for anyone without
// iron ears), studio lights the control room can kill, and a broadcast desk that needs the terminals.
.pragma library
.import "missions.js" as Base

var rect = Base.rect, wall = Base.wall

var studio = {
    id: "dead_air_studio",
    order: 6,
    requiresMission: "firehouse_fever",
    unlockText: "Complete Firehouse Fever",
    title: "Dead Air",
    subtitle: "Mission 6",
    location: "studio_building",
    recruits: ["screamer"],
    size: { w: 28, d: 20 },
    story: "Channel 13 is live all night. Get the horde into the broadcast booth and put the outbreak on the air - " +
           "just mind the sound stage: the microphones are hot, and every squeak goes straight to the speakers.",
    briefing: {
        objective: "Reach the live studio and broadcast the outbreak from the booth.",
        hazards: ["3 patrolling guards", "1 stage camera", "live microphones on the sound stage (noise = alarm + stun)", "a broadcast desk that needs the terminals"],
        squadLimit: 2,
        suggested: ["Bite (recruit the singer: her scream sends every guard where you want them)", "Terminal (the office worker runs the broadcast desk quietly)", "Sabotage (the electrician kills the stage lights and camera for a while)"],
        capture: "screamer",
        challenges: ["Recruit the Screamer", "Complete the broadcast", "Scream at least once without a full alert", "Find the hidden brain", "Finish within 5:00"]
    },
    targetTime: 300,
    squadLimit: 2,
    spawn: { x: 2.5, z: 2.5, facing: 90 },

    walls: [
        wall(0, 0, 28, 0), wall(0, 20, 28, 20), wall(0, 0, 0, 20), wall(28, 0, 28, 20),
        // reception A (x0-8, z0-8) | dressing rooms B (x8-16, z0-8) | prop storage C (x16-28, z0-6)
        wall(8, 0, 8, 3), wall(8, 4.5, 8, 8),
        wall(16, 0, 16, 2), wall(16, 3.5, 16, 6),
        wall(16, 6, 28, 6),
        // control room D (x16-28, z6-12): door from B at x=16 z6.5-8 ; door to the booth at z=12 x20-21.5
        wall(16, 6, 16, 6.5), wall(16, 8, 16, 12),
        wall(16, 12, 20, 12), wall(21.5, 12, 28, 12),
        // sound stage E (x0-16, z8-20): from A at x2-3.5 (z=8), from B at x10-11.5 (z=8)
        wall(0, 8, 2, 8), wall(3.5, 8, 10, 8), wall(11.5, 8, 16, 8),
        // stage -> booth F (x16-28, z12-20): door at x=16 z14-15.5 ; the booth's inner glass wall x22 with door z15-16.5
        wall(16, 12, 16, 14), wall(16, 15.5, 16, 20),
        wall(22, 12, 22, 15), wall(22, 16.5, 22, 20),
        // C -> D door at x=22 z? no: storage to control room door at z=6 x 24-25.5 (already in wall(16,6,28,6)? cut it)
        rect(0, 0, 0, 0)
    ],
    doors: [
        { id: "door_dressing", x: 8 - 0.15, z: 3, w: 0.3, d: 1.5, open: false, label: "Dressing rooms" },
        { id: "door_storage", x: 16 - 0.15, z: 2, w: 0.3, d: 1.5, open: false, lockType: "maintenance", label: "Prop storage" },
        { id: "door_control", x: 16 - 0.15, z: 6.5, w: 0.3, d: 1.5, open: false, label: "Control room" },
        { id: "door_stage_a", x: 2, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, label: "Sound stage" },
        { id: "door_stage_b", x: 10, z: 8 - 0.15, w: 1.5, d: 0.3, open: false, label: "Sound stage" },
        { id: "door_booth", x: 16 - 0.15, z: 14, w: 0.3, d: 1.5, open: false, lockType: "security", label: "Booth security door" },
        { id: "door_control_booth", x: 20, z: 12 - 0.15, w: 1.5, d: 0.3, open: false, label: "Booth stairs" },
        { id: "door_glass", x: 22 - 0.15, z: 15, w: 0.3, d: 1.5, open: false, label: "Broadcast booth" }
    ],
    hazards: [
        { id: "mics", kind: "sonic", x: 3, z: 10, w: 10, d: 8, label: "Live microphones" }
    ],
    controls: [
        { id: "stage_lights", kind: "switch", x: 18.4, z: 10.8, facing: 0, label: "Stage lighting desk", links: ["cam_stage"], asset: "control_console" },
        { id: "mic_master", kind: "switch", x: 26.8, z: 8.5, facing: 270, label: "Microphone master", links: ["mics"], asset: "control_console" },
        { id: "broadcast", kind: "terminal", x: 27.2, z: 18.0, facing: 270, label: "Broadcast desk", requires: "terminal", fallback: "smash", links: [], asset: "control_console" }
    ],
    traversals: [
        { id: "cable_duct", kind: "vent", requires: "crawl", from: { x: 15.4, z: 18.5 }, to: { x: 17.0, z: 18.5 }, label: "Cable duct into the booth", asset: "vent_hatch", duration: 2.0 }
    ],
    props: [
        { id: "desk_a", asset: "reception_desk", x: 3.0, z: 4.5, facing: 0, w: 2.6, d: 0.9, blocksSight: true },
        { id: "locker_a", asset: "locker", x: 7.4, z: 0.4, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Coat closet" },
        { id: "curtain_b1", asset: "curtain_screen", x: 9.0, z: 0.5, facing: 0, w: 1.8, d: 1.6, blocksSight: true },
        { id: "curtain_b2", asset: "curtain_screen", x: 13.0, z: 0.5, facing: 0, w: 1.8, d: 1.6, blocksSight: true },
        { id: "cart_b", asset: "medical_cart", x: 11.5, z: 5.5, facing: 0, w: 0.9, d: 0.9, blocksSight: true, movable: true, label: "Make-up cart" },
        { id: "rack_c1", asset: "gear_rack", x: 17.0, z: 0.4, facing: 0, w: 2.2, d: 0.7, blocksSight: true },
        { id: "rack_c2", asset: "gear_rack", x: 22.0, z: 0.4, facing: 0, w: 2.2, d: 0.7, blocksSight: true },
        { id: "locker_c", asset: "locker", x: 27.4, z: 4.5, facing: 270, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Prop locker" },
        { id: "console_d", asset: "control_console", x: 20.0, z: 6.3, facing: 180, w: 3.0, d: 0.8, blocksSight: true },
        { id: "camera_e1", asset: "studio_camera", x: 4.0, z: 12.0, facing: 180, w: 0.8, d: 0.8, blocksSight: false, movable: true, label: "Studio camera" },
        { id: "camera_e2", asset: "studio_camera", x: 11.0, z: 12.0, facing: 180, w: 0.8, d: 0.8, blocksSight: false, movable: true, label: "Studio camera" },
        { id: "lights_e", asset: "stage_lights", x: 7.0, z: 18.6, facing: 0, w: 2.6, d: 0.6, blocksSight: true },
        { id: "vend_e", asset: "vending_machine", x: 0.3, z: 18.9, facing: 90, w: 0.8, d: 1.0, blocksSight: true },
        { id: "locker_f", asset: "locker", x: 16.4, z: 12.4, facing: 90, w: 0.6, d: 0.9, blocksSight: true, hide: true, label: "Tape locker" },
        { id: "table_f", asset: "meeting_table", x: 24.0, z: 13.0, facing: 0, w: 2.4, d: 1.2, blocksSight: false }
    ],
    pickups: [ { id: "radio", kind: "radio", x: 6.5, z: 6.8, label: "Prop radio" } ],
    collectibles: [ { id: "brain", asset: "brain_jar", x: 26.8, z: 1.2, label: "Brain in a jar" } ],
    zones: [
        { id: "start", kind: "start", x: 0.3, z: 0.3, w: 7.4, d: 7.4 },
        { id: "cp_dressing", kind: "checkpoint", x: 8.2, z: 2.5, w: 2.5, d: 2.5, label: "Checkpoint" },
        { id: "cp_control", kind: "checkpoint", x: 16.2, z: 6.5, w: 2.5, d: 2, label: "Checkpoint" },
        { id: "exit", kind: "exit", x: 22.4, z: 12.4, w: 5.3, d: 7.3, requires: ["broadcast"], label: "Broadcast booth" },
        { id: "maint_c", kind: "maintenance", x: 16, z: 0, w: 12, d: 6 },
        { id: "office_d", kind: "office", x: 16, z: 6, w: 12, d: 6 }
    ],
    humans: [
        { id: "guard_lobby", kind: "guard", asset: "guard", x: 5, z: 6.5, facing: 90,
          patrol: [ { x: 1.5, z: 6.8, wait: 1.5 }, { x: 14.5, z: 6.8, wait: 1.5 } ] },
        { id: "guard_stage", kind: "guard", asset: "guard", x: 8, z: 15, facing: 180,
          patrol: [ { x: 2.0, z: 10.0, wait: 1.0 }, { x: 14.0, z: 10.0, wait: 1.0 }, { x: 14.0, z: 17.0, wait: 1.0 }, { x: 2.0, z: 17.0, wait: 1.0 } ] },
        { id: "guard_booth", kind: "guard", asset: "guard", x: 18, z: 17, facing: 0,
          patrol: [ { x: 17.5, z: 13.0, wait: 2.0 }, { x: 21.0, z: 18.5, wait: 2.0 } ] },
        { id: "singer", kind: "civilian", asset: "screamer_human", x: 11, z: 3, facing: 180, vulnerable: true, recruit: "screamer", label: "Rock singer",
          wander: [ { x: 11.0, z: 3.0, wait: 3.0 }, { x: 14.5, z: 4.5, wait: 2.0 }, { x: 9.5, z: 5.5, wait: 2.5 } ] },
        { id: "host", kind: "civilian", asset: "office_worker_human", x: 25, z: 17, facing: 270, vulnerable: true, witness: true, view: { angle: 60, range: 4.0 }, label: "TV host" }
    ],
    cameras: [ { id: "cam_stage", x: 8.0, z: 8.3, facing: 0, sweep: 45, period: 8.0, mountHeight: 2.3 } ],
    lasers: [],
    panels: [ { id: "panel_d", x: 27.6, z: 11.0, facing: 270, links: ["cam_stage", "door_booth"], label: "Studio wiring" } ],
    objectives: {
        main: { id: "escape", kind: "escape", label: "Broadcast the outbreak from the booth" },
        optional: [
            { id: "screamer", kind: "capture", target: "screamer", label: "Recruit the Screamer" },
            { id: "broadcast", kind: "control", target: "broadcast", label: "Complete the broadcast" },
            { id: "scream", kind: "ability", target: "scream", label: "Trigger a scream diversion" },
            { id: "brain", kind: "collectible", target: "brain", label: "Find the hidden brain" },
            { id: "fast", kind: "time", seconds: 300, label: "Finish within 5:00" }
        ]
    },
    tutorial: [
        { id: "move", text: "The sound stage's microphones are live: running, coughing or screaming there puts you on the speakers. The control room can mute them.", at: "start" },
        { id: "bite", text: "Bite the singer: aim her SCREAM (Q) at a spot and every guard around goes to look at it.", at: "singer" }
    ]
}
studio.walls.pop()   // drop the empty placeholder rect
