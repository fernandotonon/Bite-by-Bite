// Bite by Bite - the Horde Deck roster. Pure data: the simulation reads `traits`, `ability`, `speed`
// and `noise`; the screens read the prose. Adding a character is adding an entry here (plus an asset
// in assets.js); nothing in Sim.js names a character id.
//
//   id            key in saves (progress.unlocked) and in mission squads
//   asset         id in assets.js (model + placeholder colours); humanAsset = the not-yet-bitten version
//   ability       { id, label, hint }  - ability ids the simulation understands:
//                   bite       infect a vulnerable human (every zombie can bite; the Standard's bite is faster)
//                   unlock     open doors with lockType "maintenance"
//                   sabotage   disable panel-linked security (laser, camera) cleanly for a while
//                   smash      push heavy objects, break walls with `weak: true`
//   passive / weakness   { label, hint }  - prose, plus traits below that implement them
//   traits        flags read by the simulation:
//                   quiet        halves the noise radius of running and never makes footstep noise
//                   maintenance  guards' detection fills slower when this zombie is inside a maintenance zone (beyond 4 m)
//                   insulated    immune to the zap of a smashed electrical panel
//                   sturdy       simple traps (tripped laser) do not stun this zombie
//                   heavyHands   can push objects flagged heavy and break weak walls
//                   noisy        larger noise radius, footsteps are heard even when walking
//                   clumsyTech   panels operated by this zombie are smashed: short outage + alarm
//   speed         { walk, run, sneak } metres per second
//   noise         { walk, run } metres - radius within which guards hear the zombie moving
//   biteTime      seconds a bite takes to complete
//   unlockedAtStart  part of the deck before any mission is played
//   capturable    false for "future" characters that only show as locked silhouettes
.pragma library

var characters = [
    {
        id: "standard", name: "Standard Zombie", occupation: "Freshly turned",
        asset: "zombie_standard", color: "#5fa876",
        ability: { id: "bite", label: "Bite", hint: "Infect a vulnerable human and recruit them." },
        passive: { label: "Quiet feet", hint: "Moves without making noise; sneaks past guards easily." },
        weakness: { label: "All thumbs", hint: "Cannot operate equipment properly or move heavy objects." },
        traits: { quiet: true, clumsyTech: true },
        speed: { walk: 2.4, run: 3.8, sneak: 1.3 },
        noise: { walk: 0, run: 2.5 },
        biteTime: 1.2,
        unlockedAtStart: true, capturable: true
    },
    {
        id: "janitor", name: "Janitor Zombie", occupation: "Night janitor",
        asset: "zombie_janitor", color: "#4a5f8f",
        ability: { id: "unlock", label: "Master key", hint: "Unlock maintenance doors and service passages." },
        passive: { label: "Belongs here", hint: "Guards take longer to grow suspicious of a janitor seen from afar in maintenance areas." },
        weakness: { label: "Slow shuffle", hint: "Moves slowly, even when running." },
        traits: { maintenance: true, clumsyTech: true },
        speed: { walk: 1.7, run: 2.6, sneak: 1.0 },
        noise: { walk: 0, run: 3.5 },
        biteTime: 1.8,
        unlockedAtStart: true, capturable: true
    },
    {
        id: "electrician", name: "Electrician Zombie", occupation: "Night-shift electrician",
        asset: "zombie_electrician", humanAsset: "electrician_human", color: "#d8d84a",
        ability: { id: "sabotage", label: "Sabotage", hint: "Disable lasers, cameras and alarms at a control panel for a while." },
        passive: { label: "Insulated", hint: "Immune to minor electrical hazards." },
        weakness: { label: "Traceable", hint: "Sabotage is noticed after a delay: a guard comes to check the panel." },
        traits: { insulated: true },
        speed: { walk: 2.3, run: 3.6, sneak: 1.3 },
        noise: { walk: 0, run: 3.5 },
        biteTime: 1.8,
        unlockedAtStart: false, capturable: true
    },
    {
        id: "brute", name: "Brute Zombie", occupation: "Construction worker",
        asset: "zombie_brute", color: "#e0742f",
        ability: { id: "smash", label: "Smash", hint: "Push heavy objects and break weak walls." },
        passive: { label: "Thick skin", hint: "Simple traps do not stop the Brute." },
        weakness: { label: "Loud", hint: "Every step is heard; guards notice the Brute from further away." },
        traits: { sturdy: true, heavyHands: true, noisy: true, clumsyTech: true },
        speed: { walk: 2.2, run: 3.4, sneak: 1.2 },
        noise: { walk: 3.0, run: 6.0 },
        biteTime: 1.5,
        unlockedAtStart: true, capturable: true
    },
    {
        id: "nurse", name: "Nurse Zombie", occupation: "Night nurse",
        asset: "zombie_nurse", humanAsset: "nurse", color: "#6fa3e6",
        ability: { id: "bite", label: "Bedside bite", hint: "A quick, quiet bite - humans barely notice her coming." },
        passive: { label: "Familiar face", hint: "Looks like staff from a distance: detection fills slower beyond a few metres." },
        weakness: { label: "Squeamish", hint: "Will not smash equipment: no panel smashing, no brute force." },
        traits: { disguise: true, noSmash: true, clumsyTech: true },
        speed: { walk: 2.5, run: 3.8, sneak: 1.4 },
        noise: { walk: 0, run: 3.0 },
        biteTime: 0.9,
        unlockedAtStart: false, capturable: true
    },
    // Future roster - locked silhouettes in the deck; missions may unlock them later (assets already generated).
    { id: "doctor", name: "???", occupation: "Doctor", asset: "zombie_doctor", humanAsset: "doctor_human", color: "#dfe6ea", silhouette: "#c7d0d6", capturable: false, unlockedAtStart: false },
    { id: "guard", name: "???", occupation: "Security guard", asset: "zombie_security_guard", humanAsset: "guard", color: "#2f3d6e", silhouette: "#3b4a7a", capturable: false, unlockedAtStart: false },
    { id: "chef", name: "???", occupation: "Chef", asset: "zombie_chef", humanAsset: "chef_human", color: "#f0f0f0", silhouette: "#dcdcdc", capturable: false, unlockedAtStart: false },
    { id: "child", name: "???", occupation: "Child", asset: "zombie_child", humanAsset: "child_human", color: "#f2b56b", silhouette: "#e5a35a", capturable: false, unlockedAtStart: false },
    { id: "athlete", name: "???", occupation: "Athlete", asset: "zombie_athlete", humanAsset: "athlete_human", color: "#d9403a", silhouette: "#c93832", capturable: false, unlockedAtStart: false },
    { id: "firefighter", name: "???", occupation: "Firefighter", asset: "zombie_firefighter", humanAsset: "firefighter_human", color: "#c8281e", silhouette: "#b3241b", capturable: false, unlockedAtStart: false },
    { id: "office", name: "???", occupation: "Office worker", asset: "zombie_office_worker", humanAsset: "office_worker_human", color: "#7d8fa8", silhouette: "#6f7f96", capturable: false, unlockedAtStart: false },
    { id: "screamer", name: "???", occupation: "Screamer", asset: "zombie_screamer", humanAsset: "screamer_human", color: "#9b59b6", silhouette: "#8a4fa3", capturable: false, unlockedAtStart: false }
]

var byId = {}
for (var i = 0; i < characters.length; i++) byId[characters[i].id] = characters[i]

function get(id) { return byId[id] || null }
function initialUnlocked() {
    var out = []
    for (var i = 0; i < characters.length; i++) if (characters[i].unlockedAtStart) out.push(characters[i].id)
    return out
}
