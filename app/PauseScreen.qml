// Pause menu over the frozen level.
import QtQuick

Item {
    id: screen
    property var game: null
    signal resume()
    signal restartCheckpoint()
    signal restartMission()
    signal abandon()
    function navigate(action) { if (action === "back" || action === "pause") { resume(); return true } return menu.navigate(action) }

    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.6) }
    Panel {
        anchors.centerIn: parent; width: 460; height: 380
        Text { x: 24; y: 20; text: "PAUSED"; color: Theme.accent; font.pixelSize: 30; font.bold: true; font.family: Theme.font }
        MenuList {
            id: menu
            x: 24; y: 70; width: parent.width - 48
            options: [
                { label: "Resume" },
                { label: "Restart from checkpoint", hint: "[R]" },
                { label: "Restart mission" },
                { label: "Detection cones: " + (game && game.save.settings.showCones ? "on" : "off") },
                { label: "Sound: " + (game && game.save.settings.muted ? "muted" : "on") },
                { label: "Abandon mission", hint: "back to the menu" }
            ]
            onMoved: game.audio.play("ui_move")
            onAccepted: function (i) {
                game.audio.play("ui_select")
                if (i === 0) screen.resume()
                else if (i === 1) screen.restartCheckpoint()
                else if (i === 2) screen.restartMission()
                else if (i === 3) game.save.writeSettings({ showCones: !game.save.settings.showCones })
                else if (i === 4) game.save.writeSettings({ muted: !game.save.settings.muted })
                else screen.abandon()
            }
        }
    }
}
