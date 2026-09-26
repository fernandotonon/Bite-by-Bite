// Keyboard / gamepad navigable vertical menu: options are data, the highlighted row follows `index`.
//   options: [{ label, hint, enabled, value }]     accepted(index)   navigate("menuUp"|"menuDown"|"accept")
import QtQuick

Column {
    id: menu
    property var options: []
    property int index: 0
    property int rowHeight: 46
    property int fontSize: 20
    property bool compact: false
    signal accepted(int index)
    signal moved()
    spacing: 6

    function navigate(action) {
        if (!options.length) return false
        if (action === "menuUp" || action === "menuDown") {
            var dir = action === "menuUp" ? -1 : 1, i = index
            for (var n = 0; n < options.length; n++) { i = (i + dir + options.length) % options.length; if (options[i].enabled !== false) break }
            index = i; moved(); return true
        }
        if (action === "accept") { if (options[index] && options[index].enabled !== false) accepted(index); return true }
        return false
    }
    Repeater {
        model: menu.options.length
        delegate: Rectangle {
            required property int index
            readonly property var opt: menu.options[index]
            readonly property bool current: index === menu.index
            readonly property bool optEnabled: opt.enabled !== false
            width: menu.width; height: menu.rowHeight
            radius: 8
            color: current ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.22) : "transparent"
            border.color: current ? Theme.accent : "transparent"; border.width: 2
            Row {
                anchors.verticalCenter: parent.verticalCenter; x: 14; spacing: 12
                Text { text: current ? "▶" : ""; color: Theme.accent; font.pixelSize: menu.fontSize - 4; width: 16; anchors.verticalCenter: parent.verticalCenter }
                Text { text: opt.label; color: optEnabled ? Theme.text : Theme.muted; font.pixelSize: menu.fontSize; font.family: Theme.font; font.bold: current; anchors.verticalCenter: parent.verticalCenter }
                Text { text: opt.hint || ""; color: Theme.muted; font.pixelSize: menu.fontSize - 5; font.family: Theme.font; anchors.verticalCenter: parent.verticalCenter; visible: !menu.compact }
            }
            MouseArea { anchors.fill: parent; hoverEnabled: true; onEntered: menu.index = index; onClicked: if (optEnabled) menu.accepted(index) }
        }
    }
}
