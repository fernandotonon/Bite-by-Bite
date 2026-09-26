// Mission briefing: objective, known hazards, squad limit, suggested abilities, capture target and challenges.
import QtQuick
import "config/characters.js" as Characters

Item {
    id: screen
    property var game: null
    property var mission: null
    signal proceed()
    signal back()
    function navigate(action) { if (action === "back") { back(); return true } return menu.navigate(action) }
    readonly property var target: mission && mission.briefing.capture ? Characters.get(mission.briefing.capture) : null

    Rectangle { anchors.fill: parent; color: Theme.bg }
    Text { x: 40; y: 26; text: "MISSION BRIEFING"; color: Theme.accent; font.pixelSize: 36; font.bold: true; font.family: Theme.font }
    Text { x: 40; y: 72; text: mission ? mission.title : ""; color: Theme.text; font.pixelSize: 20; font.family: Theme.font }
    Row {
        x: 40; y: 112; spacing: 20
        Panel {
            width: (screen.width - 100) / 2; height: screen.height - 210
            Column {
                x: 22; y: 22; width: parent.width - 44; spacing: 12
                Text { text: "MAIN OBJECTIVE"; color: Theme.accent; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
                Text { text: mission ? mission.briefing.objective : ""; color: Theme.text; font.pixelSize: 22; font.bold: true; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
                Text { text: mission ? mission.story : ""; color: Theme.muted; font.pixelSize: 14; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
                Text { text: "KNOWN HAZARDS"; color: Theme.danger; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
                Repeater { model: mission ? mission.briefing.hazards : []; delegate: Text { required property var modelData; text: "⚠ " + modelData; color: Theme.text; font.pixelSize: 15; font.family: Theme.font } }
                Text { text: "SQUAD"; color: Theme.info; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
                Text { text: mission ? "Up to " + mission.briefing.squadLimit + " zombies. Infected specialists join the squad on the spot." : ""; color: Theme.text; font.pixelSize: 15; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
            }
        }
        Panel {
            width: (screen.width - 100) / 2; height: screen.height - 210
            Column {
                x: 22; y: 22; width: parent.width - 44; spacing: 12
                Text { text: "SUGGESTED ABILITIES (guidance, not required)"; color: Theme.accent2; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
                Repeater { model: mission ? mission.briefing.suggested : []; delegate: Text { required property var modelData; text: "• " + modelData; color: Theme.text; font.pixelSize: 15; font.family: Theme.font } }
                Text { text: "CAPTURE TARGET (optional)"; color: Theme.accent; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
                Text { text: screen.target ? screen.target.name + " - " + screen.target.ability.label + ": " + screen.target.ability.hint : "none"; color: Theme.text; font.pixelSize: 15; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
                Text { text: "OPTIONAL CHALLENGES"; color: Theme.info; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
                Repeater { model: mission ? mission.briefing.challenges : []; delegate: Text { required property var modelData; text: "○ " + modelData; color: Theme.text; font.pixelSize: 15; font.family: Theme.font } }
            }
        }
    }
    MenuList {
        id: menu
        x: 40; anchors.bottom: parent.bottom; anchors.bottomMargin: 30; width: 420; rowHeight: 40
        options: [ { label: "Choose squad →" }, { label: "Back" } ]
        onMoved: game.audio.play("ui_move")
        onAccepted: function (i) { game.audio.play(i === 0 ? "ui_select" : "ui_back"); if (i === 0) screen.proceed(); else screen.back() }
    }
}
