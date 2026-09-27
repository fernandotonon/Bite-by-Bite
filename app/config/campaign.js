// The campaign: every mission file registered in order. QML and the tests import this instead of missions.js.
.pragma library
.import "missions.js" as Hospital
.import "mall.js" as Mall
.import "school.js" as School
.import "office.js" as Office
.import "firehouse.js" as Firehouse
.import "studio.js" as Studio

var missions = [Hospital.hospital, Mall.mall, School.school, Office.office, Firehouse.firehouse, Studio.studio]
var byId = {}
for (var i = 0; i < missions.length; i++) byId[missions[i].id] = missions[i]
function get(id) { return byId[id] || null }
function isUnlocked(m, completedIds) { return Hospital.isUnlocked(m, completedIds) }
function lockReason(m) { return m.unlockText || (m.requiresMission ? "Complete " + (get(m.requiresMission) || { title: m.requiresMission }).title : "") }
