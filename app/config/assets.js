// Asset manifest. Gameplay refers to ids only; this table says how each id looks.
//   model         Qt Quick 3D QML produced by balsam from the QtMeshEditor GLB (scripts/import-runtime.py)
//   representation "model" | "placeholder" - what the game shows for this id right now
//   height        metres the model should stand tall in the scene (TRELLIS.2 output is a ~1 unit box)
//   footOffset    model units from origin down to the base (lifts it to y = 0), unitHeight = model bbox height
//   rotation      yaw degrees so the model faces +Z at rest (TRELLIS.2 output faces -Z)
//   placeholder   what to draw when no model is available: toon boxes { shape, color, accent }
//   status        "generated" | "pending" | "placeholder"
//   tint          optional colour multiplied into the model (the human electrician reuses the zombie model)
// scripts/update-asset-manifest.py fills in model/unitHeight/footOffset/status after an import.
.pragma library

var assets = {
    // characters (rigged: Idle / Walk / Bite clips)
    zombie_standard:    { unitDepth: 0.243, unitWidth: 0.93, footOffset: 0.511, unitHeight: 1.023, height: 1.75, rotation: 180, model: "../assets/runtime/zombie_standard/PropZombieStandard.qml", representation: "model", status: "generated", placeholder: { shape: "person", color: "#3f8f8a", accent: "#7fc27a" } },
    zombie_janitor:     { unitDepth: 0.233, unitWidth: 1.023, footOffset: 0.511, unitHeight: 1.023, height: 1.75, rotation: 180, model: "../assets/runtime/zombie_janitor/PropZombieJanitor.qml", representation: "model", status: "generated", placeholder: { shape: "person", color: "#33456e", accent: "#8fb36f" } },
    zombie_electrician: { unitDepth: 0.209, unitWidth: 0.778, footOffset: 0.512, unitHeight: 1.022, height: 1.75, rotation: 180, model: "../assets/runtime/zombie_electrician/PropZombieElectrician.qml", representation: "model", status: "generated", placeholder: { shape: "person", color: "#2e3b63", accent: "#d8e63a" } },
    zombie_brute:       { unitDepth: 0.286, unitWidth: 1.023, footOffset: 0.387, unitHeight: 0.774, height: 2.05, rotation: 180, model: "../assets/runtime/zombie_brute/PropZombieBrute.qml", representation: "model", status: "generated", placeholder: { shape: "brute", color: "#6b7d3b", accent: "#e8792c" } },
    guard:              { unitDepth: 0.227, unitWidth: 0.928, footOffset: 0.511, unitHeight: 1.023, height: 1.85, rotation: 180, model: "../assets/runtime/guard/PropGuard.qml", representation: "model", status: "generated", placeholder: { shape: "person", color: "#1f2f5e", accent: "#f0d2b6" } },
    nurse:              { unitDepth: 0.214, unitWidth: 0.883, footOffset: 0.511, unitHeight: 1.022, height: 1.70, rotation: 180, model: "../assets/runtime/nurse/PropNurse.qml", representation: "model", status: "generated", placeholder: { shape: "person", color: "#6fa3e6", accent: "#f0d2b6" } },
    electrician_human:  { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#2e3b63", accent: "#f0d2b6" } },
    // props
    laser_pillar:       { unitDepth: 0.539, unitWidth: 0.537, footOffset: 0.51, unitHeight: 1.02, height: 1.4, rotation: 225, model: "../assets/runtime/laser_pillar/PropLaserPillar.qml", representation: "model", status: "generated", placeholder: { shape: "pillar", color: "#f2b81f", accent: "#2b2b2b" } },
    security_camera:    { unitDepth: 0.562, unitWidth: 1.024, footOffset: 0.447, unitHeight: 0.895, height: 0.35, rotation: 270, model: "../assets/runtime/security_camera/PropSecurityCamera.qml", representation: "model", status: "generated", placeholder: { shape: "camera", color: "#e9eef5", accent: "#1c1f27" } },
    electrical_panel:   { unitDepth: 0.402, unitWidth: 0.896, footOffset: 0.51, unitHeight: 1.021, height: 1.0, rotation: 170, model: "../assets/runtime/electrical_panel/PropElectricalPanel.qml", representation: "model", status: "generated", placeholder: { shape: "panel", color: "#9aa3ad", accent: "#f2c02f" } },
    maintenance_door:   { unitDepth: 0.226, unitWidth: 0.732, footOffset: 0.512, unitHeight: 1.024, height: 2.1, rotation: 170, model: "../assets/runtime/maintenance_door/PropMaintenanceDoor.qml", representation: "model", status: "generated", placeholder: { shape: "door", color: "#2f8f8a", accent: "#f2c02f" } },
    medical_cart:       { unitDepth: 0.81, unitWidth: 0.841, footOffset: 0.512, unitHeight: 1.024, height: 1.0, rotation: 180, model: "../assets/runtime/medical_cart/PropMedicalCart.qml", representation: "model", status: "generated", placeholder: { shape: "cart", color: "#3ba39a", accent: "#e9eef5" } },
    radio:              { unitDepth: 0.458, unitWidth: 1.023, footOffset: 0.421, unitHeight: 0.844, height: 0.32, rotation: 180, model: "../assets/runtime/radio/PropRadio.qml", representation: "model", status: "generated", placeholder: { shape: "box", color: "#2f8f8a", accent: "#e9dcc0" } },
    locker:             { unitDepth: 0.339, unitWidth: 0.312, footOffset: 0.511, unitHeight: 1.023, height: 1.9, rotation: 180, model: "../assets/runtime/locker/PropLocker.qml", representation: "model", status: "generated", placeholder: { shape: "locker", color: "#5b8fc9", accent: "#3a3f4a" } },
    brain_jar:          { unitDepth: 0.757, unitWidth: 0.755, footOffset: 0.511, unitHeight: 1.023, height: 0.5, rotation: 180, model: "../assets/runtime/brain_jar/PropBrainJar.qml", representation: "model", status: "generated", placeholder: { shape: "jar", color: "#3a6b63", accent: "#f2a0b8" } },
    curtain_screen:     { unitDepth: 0.858, unitWidth: 0.99, footOffset: 0.511, unitHeight: 1.018, height: 1.8, rotation: 180, model: "../assets/runtime/curtain_screen/PropCurtainScreen.qml", representation: "model", status: "generated", placeholder: { shape: "curtain", color: "#8fb6e6", accent: "#3a8f7a" } },
    hospital_bed:       { unitDepth: 0.585, unitWidth: 1.021, footOffset: 0.277, unitHeight: 0.556, height: 0.95, rotation: 90, model: "../assets/runtime/hospital_bed/PropHospitalBed.qml", representation: "model", status: "generated", placeholder: { shape: "bed", color: "#e6e2d6", accent: "#8fb6e6" } },
    hospital_bed_modern:{ unitDepth: 0.533, unitWidth: 1.023, footOffset: 0.26, unitHeight: 0.522, height: 0.95, rotation: 90, model: "../assets/runtime/hospital_bed_modern/PropHospitalBedModern.qml", representation: "model", status: "generated", placeholder: { shape: "bed", color: "#e9eef5", accent: "#5b8fc9" } },
    curtain_divider:    { unitDepth: 1.003, unitWidth: 0.742, footOffset: 0.51, unitHeight: 1.004, height: 1.8, rotation: 285, model: "../assets/runtime/curtain_divider/PropCurtainDivider.qml", representation: "model", status: "generated", placeholder: { shape: "curtain", color: "#8fb6e6", accent: "#3a8f7a" } },
    hospital_building:  { unitDepth: 0.733, unitWidth: 1.023, footOffset: 0.248, unitHeight: 0.495, height: 6.0, rotation: 180, model: "../assets/runtime/hospital_building/PropHospitalBuilding.qml", representation: "model", status: "generated", placeholder: { shape: "box", color: "#e9eef5", accent: "#2f8f8a" } },
    ambulance:          { height: 2.3, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "ambulance", color: "#f4f4f4", accent: "#d9403a" } },
    hospital_door:      { height: 2.1, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "door", color: "#e9e4d8", accent: "#3a8f8a" } },
    wheelchair:         { height: 0.95, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "cart", color: "#3ba39a", accent: "#2b3a5e" } },
    iv_stand:           { height: 1.7, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "pillar", color: "#9aa3ad", accent: "#3ba39a" } },
    vending_machine:    { height: 1.9, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "locker", color: "#3ba39a", accent: "#e9dcc0" } },
    // roster zombies + their human versions (rigged: Idle / Walk / Run / Bite)
    zombie_nurse:           { height: 1.70, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#6fa3e6", accent: "#8fd48a" } },
    zombie_doctor:          { height: 1.80, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#f0f0f0", accent: "#8fd48a" } },
    zombie_security_guard:  { height: 1.85, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#1f2f5e", accent: "#8fd48a" } },
    zombie_chef:            { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#f0f0f0", accent: "#8fd48a" } },
    zombie_child:           { height: 1.30, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#f2c02f", accent: "#8fd48a" } },
    zombie_firefighter:     { height: 1.85, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#c8a35a", accent: "#8fd48a" } },
    zombie_athlete:         { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#6a4fb3", accent: "#8fd48a" } },
    zombie_office_worker:   { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#e9e4d8", accent: "#8fd48a" } },
    zombie_screamer:        { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#9b59b6", accent: "#8fd48a" } },
    doctor_human:           { height: 1.80, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#f0f0f0", accent: "#f0d2b6" } },
    chef_human:             { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#f0f0f0", accent: "#f0d2b6" } },
    child_human:            { height: 1.30, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#f2c02f", accent: "#f0d2b6" } },
    athlete_human:          { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#6a4fb3", accent: "#f0d2b6" } },
    firefighter_human:      { height: 1.85, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#c8a35a", accent: "#f0d2b6" } },
    office_worker_human:    { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#e9e4d8", accent: "#f0d2b6" } },
    screamer_human:         { height: 1.75, rotation: 180, model: "", representation: "placeholder", status: "pending", placeholder: { shape: "person", color: "#9b59b6", accent: "#f0d2b6" } }
}

function get(id) { return assets[id] || null }
