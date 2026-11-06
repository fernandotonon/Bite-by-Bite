// Language picker used on the title and pause menus. Closed it looks like a MenuList row with a
// value chip; the open list is reparented onto `overlay` so nothing in the menu stacks over it.
import QtQuick

Item {
    id: root
    property Item overlay: null
    property bool current: false
    property int fontSize: 20
    property int rowHeight: 46
    property bool open: false
    property int pickIndex: 0
    readonly property bool stealingNav: open
    readonly property int popupWidth: 280
    readonly property int itemHeight: 40
    signal picked(string code)
    signal moved()
    signal activated()

    height: rowHeight
    clip: false

    function labels() {
        var _rev = Lang.rev
        return Lang.choiceLabels()
    }
    function syncPick() { pickIndex = Lang.choiceIndex() }
    function toggle() {
        if (open) close()
        else openList()
    }
    function openList() {
        syncPick()
        open = true
        activated()
        Qt.callLater(placePopup)
    }
    function close() { open = false }
    function applyPick() {
        var code = Lang.choiceAt(pickIndex)
        close()
        picked(code)
    }
    function navigate(action) {
        if (!open) {
            if (action === "accept" || action === "menuLeft" || action === "menuRight") {
                openList(); moved(); return true
            }
            return false
        }
        if (action === "back" || action === "pause") { close(); return true }
        if (action === "menuUp") {
            pickIndex = (pickIndex - 1 + labels().length) % labels().length
            moved(); return true
        }
        if (action === "menuDown") {
            pickIndex = (pickIndex + 1) % labels().length
            moved(); return true
        }
        if (action === "accept") { applyPick(); return true }
        return true
    }
    function placePopup() {
        if (!open || !overlay || !valueBox) return
        var p = valueBox.mapToItem(overlay, 0, valueBox.height + 4)
        var h = labels().length * itemHeight + 10
        var x = Math.max(8, Math.min(p.x, overlay.width - popupWidth - 8))
        var y = p.y
        // Prefer opening downward; flip up if the list would leave the window.
        if (y + h > overlay.height - 8)
            y = valueBox.mapToItem(overlay, 0, 0).y - h - 4
        y = Math.max(8, Math.min(y, overlay.height - h - 8))
        popup.x = x
        popup.y = y
        popup.width = popupWidth
        popup.height = h
    }

    onOpenChanged: if (open) Qt.callLater(placePopup)
    onWidthChanged: if (open) placePopup()
    Connections {
        target: overlay
        function onWidthChanged() { if (root.open) root.placePopup() }
        function onHeightChanged() { if (root.open) root.placePopup() }
    }

    Rectangle {
        anchors.fill: parent
        radius: 8
        color: root.current || root.open ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.22) : "transparent"
        border.color: root.current || root.open ? Theme.accent : "transparent"
        border.width: 2
        Row {
            id: row
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 14
            anchors.rightMargin: 14
            spacing: 12
            Text {
                text: root.current || root.open ? "▶" : ""
                color: Theme.accent; font.pixelSize: root.fontSize - 4; width: 16
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: langLabel
                text: Lang.tr("Language")
                color: Theme.text; font.pixelSize: root.fontSize; font.family: Theme.font
                font.bold: root.current || root.open; anchors.verticalCenter: parent.verticalCenter
            }
            Rectangle {
                id: valueBox
                anchors.verticalCenter: parent.verticalCenter
                height: root.fontSize + 14
                width: Math.min(root.popupWidth, Math.max(40, row.width - langLabel.width - 16 - 12 - 12))
                radius: 8
                color: Theme.panelLight
                border.color: Theme.border; border.width: 1
                Text {
                    id: caption
                    anchors.left: parent.left
                    anchors.right: chevron.left
                    anchors.leftMargin: 12
                    anchors.rightMargin: 6
                    anchors.verticalCenter: parent.verticalCenter
                    text: Lang.choiceCaption()
                    color: Theme.text; font.pixelSize: root.fontSize - 2; font.family: Theme.font
                    elide: Text.ElideRight
                }
                Text {
                    id: chevron
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    text: root.open ? "▴" : "▾"
                    color: Theme.muted; font.pixelSize: root.fontSize - 2; font.family: Theme.font
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: { root.activated(); root.toggle() }
        }
    }

    // Scrim + list live on the screen overlay so Panel / Column clipping and sibling paint order
    // cannot bury them, and the fill stays fully opaque over the 3D backdrop.
    Item {
        id: layer
        parent: root.overlay ? root.overlay : root
        anchors.fill: parent
        visible: root.open
        z: 1000

        MouseArea {
            anchors.fill: parent
            onClicked: root.close()
        }

        Rectangle {
            id: popup
            radius: Theme.radius
            color: "#1a222c"
            border.color: Theme.accent
            border.width: 2

            // Solid backplate so options stay readable over the scene / menu.
            Rectangle {
                anchors.fill: parent
                anchors.margins: 2
                radius: Theme.radius - 2
                color: Theme.panel
            }

            Column {
                anchors.fill: parent
                anchors.margins: 5
                spacing: 2
                Repeater {
                    model: root.open ? root.labels() : []
                    delegate: Rectangle {
                        required property int index
                        required property var modelData
                        width: popup.width - 10
                        height: root.itemHeight - 2
                        radius: 6
                        color: index === root.pickIndex ? "#345239" : Theme.panelLight
                        border.color: index === root.pickIndex ? Theme.accent : Theme.border
                        border.width: 1
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 12
                            anchors.rightMargin: 12
                            anchors.verticalCenter: parent.verticalCenter
                            text: modelData
                            color: Theme.text
                            font.pixelSize: root.fontSize - 2
                            font.family: Theme.font
                            font.bold: index === root.pickIndex
                            elide: Text.ElideRight
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: root.pickIndex = index
                            onClicked: { root.pickIndex = index; root.applyPick() }
                        }
                    }
                }
            }
        }
    }
}
