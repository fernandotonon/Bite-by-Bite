// Mission results: objectives, time, rating and newly captured characters.
import QtQuick
import "config/characters.js" as Characters

Item {
    id: screen
    property var game: null
    property var results: null          // sim.results()
    property var unlocks: null          // save.recordResult() -> { newCharacters, newBest }
    signal replay()
    signal deck()
    signal missions()
    function navigate(action) { return menu.navigate(action) }
    function fmtTime(s) { s = Math.max(0, Math.floor(s)); return Math.floor(s / 60) + ":" + (s % 60 < 10 ? "0" : "") + (s % 60) }

    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.7) }
    Panel {
        anchors.centerIn: parent; width: 620; height: Math.min(parent.height - 40, 520)
        Column {
            x: 28; y: 22; width: parent.width - 56; spacing: 8
            Text { text: "OUTBREAK COMPLETE"; color: Theme.accent; font.pixelSize: 32; font.bold: true; font.family: Theme.font }
            Row {
                spacing: 24
                Column { Text { text: "RATING"; color: Theme.muted; font.pixelSize: 12; font.family: Theme.font } Text { text: results ? results.rating : "-"; color: Theme.accent2; font.pixelSize: 44; font.bold: true; font.family: Theme.font } }
                Column { Text { text: "TIME"; color: Theme.muted; font.pixelSize: 12; font.family: Theme.font } Text { text: results ? screen.fmtTime(results.time) + (unlocks && unlocks.newBest ? "  new best!" : "") : "-"; color: Theme.text; font.pixelSize: 30; font.bold: true; font.family: Theme.font } }
                Column { Text { text: "RESTARTS"; color: Theme.muted; font.pixelSize: 12; font.family: Theme.font } Text { text: results ? results.restarts : "-"; color: Theme.text; font.pixelSize: 30; font.bold: true; font.family: Theme.font } }
            }
            Text { text: "✓ Escaped through the ambulance bay"; color: Theme.accent; font.pixelSize: 16; font.family: Theme.font }
            Repeater {
                model: results ? results.optional : []
                delegate: Text { required property var modelData; text: (modelData.done ? "✓ " : "✗ ") + modelData.label; color: modelData.done ? Theme.accent : Theme.muted; font.pixelSize: 16; font.family: Theme.font }
            }
            Rectangle { width: parent.width; height: 2; color: Theme.border }
            Text {
                visible: unlocks && unlocks.newCharacters.length > 0
                text: unlocks && unlocks.newCharacters.length ? "NEW IN THE HORDE DECK: " + unlocks.newCharacters.map(function (id) { return Characters.get(id).name }).join(", ") : ""
                color: Theme.accent2; font.pixelSize: 16; font.bold: true; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap
            }
            Text { visible: results && results.recruited.length && !(unlocks && unlocks.newCharacters.length); text: "Recruited: " + (results ? results.recruited.map(function (id) { return Characters.get(id).name }).join(", ") : "") + " (already in the deck)"; color: Theme.muted; font.pixelSize: 14; font.family: Theme.font }
            MenuList {
                id: menu
                width: parent.width; rowHeight: 40
                options: [ { label: "Replay with a new squad" }, { label: "Horde Deck" }, { label: "Mission select" } ]
                onMoved: game.audio.play("ui_move")
                onAccepted: function (i) { game.audio.play("ui_select"); if (i === 0) screen.replay(); else if (i === 1) screen.deck(); else screen.missions() }
            }
        }
    }
}
