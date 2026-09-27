// Mission select: every campaign mission in order - completed (rating, best time, optionals), available, or locked
// with the reason - plus the location on a turntable and the capturable characters as previews / silhouettes.
import QtQuick
import "config/missions.js" as Missions
import "config/characters.js" as Characters

Item {
    id: screen
    property var game: null
    signal chosen(string missionId)
    signal back()
    function navigate(action) { if (action === "back") { back(); return true } return menu.navigate(action) }
    function fmtTime(s) { s = Math.max(0, Math.floor(s)); return Math.floor(s / 60) + ":" + (s % 60 < 10 ? "0" : "") + (s % 60) }
    readonly property var completed: game ? game.save.completedMissions() : []
    readonly property var mission: Missions.missions[Math.min(menu.index, Missions.missions.length - 1)]
    readonly property var record: game ? game.save.missionRecord(mission.id) : null
    readonly property bool unlocked: Missions.isUnlocked(mission, completed)
    readonly property string status: record && record.completed ? "completed" : (unlocked ? "available" : "locked")

    Rectangle { anchors.fill: parent; color: Theme.bg }
    Text { x: 40; y: 26; text: "OUTBREAKS"; color: Theme.accent; font.pixelSize: 36; font.bold: true; font.family: Theme.font }
    Text { x: 40; y: 72; text: screen.completed.length + " / " + Missions.missions.length + " outbreaks survived · replay any mission with a bigger horde to find new routes"; color: Theme.muted; font.pixelSize: 15; font.family: Theme.font }
    Panel {
        x: 40; y: 110; width: Math.min(560, parent.width * 0.46); height: parent.height - 170
        MenuList {
            id: menu
            x: 16; y: 16; width: parent.width - 32; rowHeight: 52; fontSize: 18
            options: Missions.missions.map(function (m) {
                var r = game ? game.save.missionRecord(m.id) : null
                var open = Missions.isUnlocked(m, screen.completed)
                var hint = r && r.completed ? ("✓ " + r.rating + "  " + screen.fmtTime(r.bestTime)) : (open ? "available" : "🔒 locked")
                return { label: m.order + ". " + m.title, hint: hint, enabled: open }
            })
            onMoved: game.audio.play("ui_move")
            onAccepted: function (i) { game.audio.play("ui_select"); screen.chosen(Missions.missions[i].id) }
        }
    }
    Panel {
        anchors.right: parent.right; anchors.rightMargin: 40; y: 110; width: parent.width - Math.min(560, parent.width * 0.46) - 110; height: parent.height - 170
        CharacterStage { x: 16; y: 12; width: parent.width - 32; height: 150; assetId: screen.mission.location || ""; modelHeight: 3.2; reducedFx: game && game.reducedFx; visible: !!screen.mission.location }
        Column {
            x: 22; y: 170; width: parent.width - 44; spacing: 8
            Row {
                spacing: 10
                Text { text: screen.mission.subtitle; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font; anchors.verticalCenter: parent.verticalCenter }
                Rectangle { width: statusText.implicitWidth + 16; height: 22; radius: 11; anchors.verticalCenter: parent.verticalCenter
                            color: screen.status === "completed" ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.25) : (screen.status === "available" ? Qt.rgba(Theme.info.r, Theme.info.g, Theme.info.b, 0.25) : Qt.rgba(1, 1, 1, 0.08))
                            border.color: screen.status === "completed" ? Theme.accent : (screen.status === "available" ? Theme.info : Theme.border); border.width: 1
                            Text { id: statusText; anchors.centerIn: parent; text: screen.status === "completed" ? "COMPLETED" : (screen.status === "available" ? "AVAILABLE" : "LOCKED"); color: Theme.text; font.pixelSize: 11; font.bold: true; font.family: Theme.font } }
            }
            Text { text: screen.mission.title; color: Theme.text; font.pixelSize: 22; font.bold: true; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
            Text { visible: screen.status === "locked"; text: "🔒 " + Missions.lockReason(screen.mission); color: Theme.accent2; font.pixelSize: 14; font.bold: true; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
            Text { text: screen.mission.story; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap; maximumLineCount: 3; elide: Text.ElideRight }
            Rectangle { width: parent.width; height: 2; color: Theme.border }
            Text { text: "OPTIONAL OBJECTIVES"; color: Theme.accent; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
            Repeater {
                model: screen.mission.objectives.optional
                delegate: Text {
                    required property var modelData
                    readonly property bool done: screen.record && screen.record.optionals.indexOf(modelData.id) >= 0
                    text: (done ? "✓ " : "○ ") + modelData.label; color: done ? Theme.accent : Theme.muted; font.pixelSize: 13; font.family: Theme.font
                }
            }
            Text { text: screen.record && screen.record.completed ? "Rating " + screen.record.rating + " · best time " + screen.fmtTime(screen.record.bestTime) + " · " + screen.record.plays + " attempts" : (screen.record && screen.record.plays ? screen.record.plays + " attempts, not completed yet" : "Not attempted yet"); color: Theme.text; font.pixelSize: 13; font.family: Theme.font }
            Text { visible: (screen.mission.recruits || []).length > 0; text: "CAPTURABLE HERE"; color: Theme.info; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
            Row {
                spacing: 8
                Repeater {
                    model: screen.mission.recruits || []
                    delegate: Rectangle {
                        required property var modelData
                        readonly property var ch: Characters.get(modelData)
                        readonly property bool have: game ? game.save.isUnlocked(modelData) : false
                        width: 120; height: 34; radius: 8
                        color: have ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.2) : Qt.rgba(1, 1, 1, 0.06)
                        border.color: have ? Theme.accent : Theme.border; border.width: 1
                        Row { anchors.centerIn: parent; spacing: 6
                              Rectangle { width: 14; height: 14; radius: 7; color: have ? ch.color : "#333"; anchors.verticalCenter: parent.verticalCenter }
                              Text { text: have ? ch.name.replace(" Zombie", "") : "? " + ch.occupation; color: have ? Theme.text : Theme.muted; font.pixelSize: 12; font.family: Theme.font; anchors.verticalCenter: parent.verticalCenter } }
                    }
                }
            }
        }
    }
    Text { x: 40; anchors.bottom: parent.bottom; anchors.bottomMargin: 18; text: "Enter mission briefing · Esc back"; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font }
}
