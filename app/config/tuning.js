// Bite by Bite - gameplay numbers in one place. Distances in metres, times in seconds, angles in degrees.
.pragma library

var tuning = {
    zombieRadius: 0.35,
    humanRadius: 0.35,
    interactRange: 1.4,             // reach for doors, panels, pickups, hiding spots
    biteRange: 1.1,
    biteBehindBonus: 0.5,           // bites from behind the human's facing take this fraction of the time
    followDistance: 1.4,            // followers stop this far from the leader
    followCatchUp: 1.25,            // followers move at leader speed * this when far behind

    // detection: guards and cameras fill a meter per zombie; at 1 the guard is alert (camera: alarm)
    detectFillNear: 1.6,            // per second when the zombie is within 30 % of the view range
    detectFillFar: 0.45,            // per second at the edge of the range
    detectDecay: 0.6,               // per second while unseen
    sneakFactor: 0.55,              // sneaking zombies fill the meter at this fraction
    maintenanceFactor: 0.4,         // trait `maintenance` inside a maintenance zone beyond maintenanceNear
    maintenanceNear: 4,
    suspiciousAt: 0.35,             // guard stops and stares from this meter value
    guardView: { angle: 75, range: 6.5 },
    cameraView: { angle: 48, range: 6.0 },
    hearRange: 1.0,                 // multiplier on character noise radius

    guardSpeed: { patrol: 1.6, investigate: 2.4, alert: 3.6, search: 2.0 },
    investigateLook: 2.5,           // seconds looking around at an investigation point
    loseSightAfter: 2.5,            // alert -> search after this long without seeing any zombie
    searchPoints: 2, searchRadius: 3.0, searchLook: 2.0,
    catchRange: 0.75,               // alert guard this close to a zombie catches it -> checkpoint
    alarmDuration: 12,              // camera / tripped laser: guards investigate the alarm point

    // panel
    sabotageDuration: 35,           // clean disable (electrician)
    sabotageNoticeDelay: 14,        // ... but a guard comes to look after this long
    smashDuration: 9,               // clumsyTech outage
    smashZapStun: 1.2,              // seconds the smashing zombie is stunned (unless insulated)

    laserStun: 1.5,                 // zombie tripping the laser is stunned (unless sturdy) and an alarm sounds
    radioThrow: 4.5,                // metres the radio flies
    radioNoise: 7.0,                // metres guards hear it land
    radioPlayTime: 6.0,             // seconds the radio keeps blaring (guards stay interested)
    cartPushSpeed: 1.2,

    exitHoldTime: 0.6,              // seconds all zombies must be inside the exit zone
    caughtRestartDelay: 1.1,        // seconds of "CAUGHT" flash before the checkpoint reload

    grid: 0.5,                      // A* cell size for guard / follower navigation

    // mall: food bait (chef) and dogs
    baitCooldown: 8, baitTime: 9, baitNoise: 7.0,
    dogView: { angle: 130, range: 3.5 }, dogHearing: 1.8, dogSpeed: 1.5,
    // firehouse: smoke (non-fireproof zombies cough)
    smokeSlow: 0.6, coughEvery: 2.5, coughStun: 0.8, coughNoise: 4,
    // studio: the scream and the live-microphone zones
    screamReach: 4, screamNoise: 11, screamCooldown: 10, hoarseTime: 4, interruptTime: 3, sonicStun: 1.5,
    // lab: sedation
    sedateTime: 12, sedateCooldown: 6
}
