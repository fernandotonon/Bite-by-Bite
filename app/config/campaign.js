// The campaign: every mission file registered in order. QML and the tests import this instead of missions.js.
.pragma library
.import "missions.js" as Hospital
.import "mall.js" as Mall
.import "school.js" as School

var missions = [Hospital.hospital, Mall.mall, School.school]
var byId = {}
for (var i = 0; i < missions.length; i++) byId[missions[i].id] = missions[i]
function get(id) { return byId[id] || null }
function isUnlocked(m, completedIds) { return Hospital.isUnlocked(m, completedIds) }
function lockReason(m) { return m.unlockText || (m.requiresMission ? "Complete " + (get(m.requiresMission) || { title: m.requiresMission }).title : "") }
