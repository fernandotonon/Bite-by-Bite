// Pause menu over the frozen level.
import QtQuick

Item {
    id: screen
    property var game: null
    signal resume()
    signal restartCheckpoint()
    signal restartMission()
    signal abandon()
    // 0 Resume, 1 checkpoint, 2 restart, 3 cones, 4 sound, 5 language, 6 abandon
    property int index: 0
    readonly property int count: 7

    function navigate(action) {
        if (lang.stealingNav) {
            if (action === "back" || action === "pause") { lang.close(); return true }
            if (lang.navigate(action)) {
                if (action === "menuUp" || action === "menuDown") game.audio.play("ui_move")
                return true
            }
        }
        if (action === "back" || action === "pause") { resume(); return true }
        if (action === "menuUp" || action === "menuDown") {
            var dir = action === "menuUp" ? -1 : 1
            index = (index + dir + count) % count
            game.audio.play("ui_move")
            return true
        }
        if (action === "accept" || action === "menuLeft" || action === "menuRight") {
            if (index === 5) {
                if (lang.navigate(action)) {
                    game.audio.play("ui_select")
                    return true
                }
            } else if (action === "accept") {
                acceptIndex(index)
                return true
            }
        }
        return false
    }
    function acceptIndex(i) {
        game.audio.play("ui_select")
        if (i === 0) screen.resume()
        else if (i === 1) screen.restartCheckpoint()
        else if (i === 2) screen.restartMission()
        else if (i === 3) game.save.writeSettings({ showCones: !game.save.settings.showCones })
        else if (i === 4) game.save.writeSettings({ muted: !game.save.settings.muted })
        else if (i === 6) screen.abandon()
    }

    Rectangle { anchors.fill: parent; color: Qt.rgba(0, 0, 0, 0.6) }
    Panel {
        anchors.centerIn: parent; width: 540; height: 520
        clip: false
        Text { x: 24; y: 20; text: Lang.tr("PAUSED"); color: Theme.accent; font.pixelSize: 30; font.bold: true; font.family: Theme.font }
        Column {
            id: menu
            x: 24; y: 70; width: parent.width - 48
            spacing: 6
            readonly property var options: {
                var _rev = Lang.rev
                var cones = game && game.save.settings.showCones
                var muted = game && game.save.settings.muted
                return [
                    { label: Lang.tr("Resume") },
                    { label: Lang.tr("Restart from checkpoint"), hint: "[R]" },
                    { label: Lang.tr("Restart mission") },
                    { label: Lang.fmt("Detection cones: %s", [Lang.tr(cones ? "on" : "off")]) },
                    { label: Lang.fmt("Sound: %s", [Lang.tr(muted ? "muted" : "on")]) }
                ]
            }
            Repeater {
                model: menu.options.length
                delegate: Rectangle {
                    required property int index
                    readonly property var opt: menu.options[index]
                    readonly property bool current: index === screen.index
                    width: menu.width; height: 46; radius: 8
                    color: current ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.22) : "transparent"
                    border.color: current ? Theme.accent : "transparent"; border.width: 2
                    Row {
                        anchors.verticalCenter: parent.verticalCenter; x: 14; spacing: 12
                        Text { text: current ? "▶" : ""; color: Theme.accent; font.pixelSize: 16; width: 16; anchors.verticalCenter: parent.verticalCenter }
                        Text { text: opt.label; color: Theme.text; font.pixelSize: 20; font.family: Theme.font; font.bold: current; anchors.verticalCenter: parent.verticalCenter }
                        Text { text: opt.hint || ""; color: Theme.muted; font.pixelSize: 15; font.family: Theme.font; anchors.verticalCenter: parent.verticalCenter }
                    }
                    MouseArea {
                        anchors.fill: parent; hoverEnabled: true
                        onEntered: { if (!lang.open) screen.index = index }
                        onClicked: { screen.index = index; screen.acceptIndex(index) }
                    }
                }
            }
            LanguageDropdown {
                id: lang
                width: menu.width
                overlay: screen
                current: screen.index === 5
                onActivated: screen.index = 5
                onMoved: game.audio.play("ui_move")
                onPicked: function (code) { game.audio.play("ui_select"); game.pickLanguage(code) }
            }
            Rectangle {
                width: menu.width; height: 46; radius: 8
                readonly property bool current: screen.index === 6
                color: current ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.22) : "transparent"
                border.color: current ? Theme.accent : "transparent"; border.width: 2
                Row {
                    anchors.verticalCenter: parent.verticalCenter; x: 14; spacing: 12
                    Text { text: parent.parent.current ? "▶" : ""; color: Theme.accent; font.pixelSize: 16; width: 16; anchors.verticalCenter: parent.verticalCenter }
                    Text { text: Lang.tr("Abandon mission"); color: Theme.text; font.pixelSize: 20; font.family: Theme.font; font.bold: parent.parent.current; anchors.verticalCenter: parent.verticalCenter }
                    Text { text: Lang.tr("back to the menu"); color: Theme.muted; font.pixelSize: 15; font.family: Theme.font; anchors.verticalCenter: parent.verticalCenter }
                }
                MouseArea {
                    anchors.fill: parent; hoverEnabled: true
                    onEntered: { if (!lang.open) screen.index = 6 }
                    onClicked: { screen.index = 6; screen.acceptIndex(6) }
                }
            }
        }
    }
}
