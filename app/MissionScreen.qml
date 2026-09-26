// Mission select: the list of outbreaks with completion, rating and best time.
import QtQuick
import "config/missions.js" as Missions

Item {
    id: screen
    property var game: null
    signal chosen(string missionId)
    signal back()
    function navigate(action) { if (action === "back") { back(); return true } return menu.navigate(action) }
    function fmtTime(s) { s = Math.max(0, Math.floor(s)); return Math.floor(s / 60) + ":" + (s % 60 < 10 ? "0" : "") + (s % 60) }
    readonly property var mission: Missions.missions[Math.min(menu.index, Missions.missions.length - 1)]
    readonly property var record: game ? game.save.missionRecord(mission.id) : null

    Rectangle { anchors.fill: parent; color: Theme.bg }
    Text { x: 40; y: 26; text: "OUTBREAKS"; color: Theme.accent; font.pixelSize: 36; font.bold: true; font.family: Theme.font }
    Text { x: 40; y: 72; text: "Pick a mission. Replay with different zombies to find new routes."; color: Theme.muted; font.pixelSize: 15; font.family: Theme.font }
    Panel {
        x: 40; y: 110; width: Math.min(560, parent.width * 0.5); height: parent.height - 170
        MenuList {
            id: menu
            x: 16; y: 16; width: parent.width - 32; rowHeight: 56
            options: Missions.missions.map(function (m) {
                var r = game ? game.save.missionRecord(m.id) : null
                return { label: m.title, hint: r && r.completed ? ("★ " + r.rating + "  best " + screen.fmtTime(r.bestTime)) : "new" }
            }).concat([{ label: "More outbreaks coming...", hint: "locked", enabled: false }])
            onMoved: game.audio.play("ui_move")
            onAccepted: function (i) { game.audio.play("ui_select"); screen.chosen(Missions.missions[i].id) }
        }
    }
    Panel {
        anchors.right: parent.right; anchors.rightMargin: 40; y: 110; width: parent.width - Math.min(560, parent.width * 0.5) - 110; height: parent.height - 170
        Column {
            x: 22; y: 22; width: parent.width - 44; spacing: 10
            Text { text: screen.mission.subtitle; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font }
            Text { text: screen.mission.title; color: Theme.text; font.pixelSize: 24; font.bold: true; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
            Text { text: screen.mission.story; color: Theme.muted; font.pixelSize: 14; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
            Rectangle { width: parent.width; height: 2; color: Theme.border }
            Text { text: "PROGRESS"; color: Theme.accent; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
            Repeater {
                model: screen.mission.objectives.optional
                delegate: Text {
                    required property var modelData
                    readonly property bool done: screen.record && screen.record.optionals.indexOf(modelData.id) >= 0
                    text: (done ? "✓ " : "○ ") + modelData.label; color: done ? Theme.accent : Theme.muted; font.pixelSize: 14; font.family: Theme.font
                }
            }
            Text { text: screen.record && screen.record.completed ? "Rating " + screen.record.rating + " · best time " + screen.fmtTime(screen.record.bestTime) + " · " + screen.record.plays + " attempts" : "Not completed yet"; color: Theme.text; font.pixelSize: 14; font.family: Theme.font }
        }
    }
    Text { x: 40; anchors.bottom: parent.bottom; anchors.bottomMargin: 18; text: "Enter mission briefing · Esc back"; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font }
}
