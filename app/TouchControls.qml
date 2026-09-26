// Touch controls for phones and tablets: a floating stick on the left half (appears where the finger lands,
// multi-touch so you can steer and act at once) and action buttons on the right. The layer exposes the same
// shape as a physical gamepad (connected / axisX / axisY / run / sneak / buttons) and InputManager polls it,
// so gameplay never knows the source. It shows itself on the first touch, so mouse/keyboard players never see
// it; on Android / iOS it is on from the start. Adapted from the School Adventure touch layer (same author).
import QtQuick

Item {
    id: tc
    property var input: null
    property var game: null
    property bool shown: Qt.platform.os === "android" || Qt.platform.os === "ios"
    readonly property bool gameplay: game && game.screen === "playing"
    readonly property bool menuBack: game && ["deck", "missions", "briefing", "squad"].indexOf(game.screen) >= 0

    // ---- the "gamepad" InputManager reads ----------------------------------------------------------
    readonly property bool connected: shown && gameplay
    property real axisX: 0
    property real axisY: 0
    property bool run: false
    property bool sneak: false            // latched by the SNEAK button
    property var buttons: ({})

    // ---- stick state -------------------------------------------------------------------------------
    property int stickId: -1
    property real stickX: 0; property real stickY: 0          // origin (where the finger landed)
    property real knobX: 0; property real knobY: 0
    readonly property real stickRadius: 60
    property var buttonOf: ({})                               // touch pointId -> button action

    function actionAt(x, y) {
        for (var i = 0; i < btnRow.children.length; i++) {
            var b = btnRow.children[i]; if (!b.action) continue
            var p = b.mapFromItem(tc, x, y)
            if (p.x >= -10 && p.y >= -10 && p.x <= b.width + 10 && p.y <= b.height + 10) return b.action
        }
        var q = pauseBtn.mapFromItem(tc, x, y)
        if (q.x >= -10 && q.y >= -10 && q.x <= pauseBtn.width + 10 && q.y <= pauseBtn.height + 10) return "pause"
        return ""
    }
    function setStick(px, py) {
        var dx = px - stickX, dy = py - stickY
        var len = Math.hypot(dx, dy)
        if (len > stickRadius) { dx *= stickRadius / len; dy *= stickRadius / len }
        knobX = dx; knobY = dy
        var nx = dx / stickRadius, nz = dy / stickRadius              // screen down = south = +z
        var mag = Math.hypot(nx, nz)
        if (mag < 0.18) { axisX = 0; axisY = 0 } else { axisX = nx; axisY = nz }
    }
    function clearStick() { stickId = -1; knobX = 0; knobY = 0; axisX = 0; axisY = 0 }
    function press(action) {
        if (action === "sneak") { sneak = !sneak; return }
        if (action === "run") { run = true; return }
        var m = Object.assign({}, buttons); m[action] = true; buttons = m
    }
    function releaseAction(action) {
        if (action === "sneak") return
        if (action === "run") { run = false; return }
        var m = Object.assign({}, buttons); m[action] = false; buttons = m
    }
    function release(pointId) {
        if (pointId === stickId) clearStick()
        if (buttonOf[pointId]) { releaseAction(buttonOf[pointId]); var m = Object.assign({}, buttonOf); delete m[pointId]; buttonOf = m }
    }
    function held(action) { for (var k in buttonOf) if (buttonOf[k] === action) return true; return false }
    onGameplayChanged: if (!gameplay) { clearStick(); for (var k in buttonOf) releaseAction(buttonOf[k]); buttonOf = ({}); run = false }

    MultiPointTouchArea {
        anchors.fill: parent
        enabled: tc.gameplay
        mouseEnabled: false
        minimumTouchPoints: 1
        maximumTouchPoints: 4
        touchPoints: [ TouchPoint {}, TouchPoint {}, TouchPoint {}, TouchPoint {} ]
        onPressed: function (points) {
            if (!tc.shown) tc.shown = true
            for (var i = 0; i < points.length; i++) {
                var p = points[i], action = tc.actionAt(p.x, p.y)
                if (action) { var m = Object.assign({}, tc.buttonOf); m[p.pointId] = action; tc.buttonOf = m; tc.press(action) }
                else if (tc.stickId < 0 && p.x < tc.width * 0.5 && p.y > 90) { tc.stickId = p.pointId; tc.stickX = p.x; tc.stickY = p.y; tc.setStick(p.x, p.y) }
            }
        }
        onUpdated: function (points) { for (var i = 0; i < points.length; i++) if (points[i].pointId === tc.stickId) tc.setStick(points[i].x, points[i].y) }
        onReleased: function (points) { for (var i = 0; i < points.length; i++) tc.release(points[i].pointId) }
        onCanceled: function (points) { for (var i = 0; i < points.length; i++) tc.release(points[i].pointId) }
    }

    // ---- visuals (gameplay) ------------------------------------------------------------------------
    Rectangle {   // resting stick circle
        visible: tc.shown && tc.gameplay && tc.stickId < 0
        x: 90; y: tc.height - height - 80
        width: tc.stickRadius * 2.2; height: width; radius: width / 2
        color: Qt.rgba(1, 1, 1, 0.12); border.color: Qt.rgba(1, 1, 1, 0.45); border.width: 2
        Text { anchors.centerIn: parent; text: "✥"; color: "white"; opacity: 0.7; font.pixelSize: 34 }
    }
    Item {        // live stick
        visible: tc.shown && tc.gameplay && tc.stickId >= 0
        x: tc.stickX; y: tc.stickY
        Rectangle { x: -tc.stickRadius * 1.1; y: -tc.stickRadius * 1.1; width: tc.stickRadius * 2.2; height: width; radius: width / 2; color: Qt.rgba(1, 1, 1, 0.12); border.color: Qt.rgba(1, 1, 1, 0.5); border.width: 2 }
        Rectangle { x: tc.knobX - 26; y: tc.knobY - 26; width: 52; height: 52; radius: 26; color: Qt.rgba(0.5, 0.88, 0.48, 0.85); border.color: "#102"; border.width: 2 }
    }
    component TouchButton: Rectangle {
        property string action: ""
        property string label: ""
        property bool latched: false
        readonly property bool down: latched || tc.held(action)
        width: 108; height: 108; radius: 54
        color: down ? Qt.rgba(0.5, 0.88, 0.48, 0.85) : Qt.rgba(0, 0, 0, 0.45)
        border.color: down ? "#eaffea" : Qt.rgba(1, 1, 1, 0.55); border.width: 2
        Text { anchors.centerIn: parent; width: parent.width - 8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; text: label; color: "white"; font.pixelSize: 15; font.bold: true; font.family: Theme.font }
    }
    Grid {        // action buttons, bottom right: two rows
        id: btnRow
        visible: tc.shown && tc.gameplay
        anchors.right: parent.right; anchors.rightMargin: 40; anchors.bottom: parent.bottom; anchors.bottomMargin: 50
        columns: 4; spacing: 16
        TouchButton { action: "switchNext"; label: "SWITCH"; visible: tc.game && tc.game.sim && tc.game.sim.state.squad.length > 1 }
        TouchButton { action: "command"; label: "STAY /\nFOLLOW"; visible: tc.game && tc.game.sim && tc.game.sim.state.squad.length > 1 }
        TouchButton { action: "ability"; label: "SKILL" }
        TouchButton { action: "bite"; label: "BITE"; color: down ? Qt.rgba(1, 0.3, 0.3, 0.85) : Qt.rgba(0.5, 0.05, 0.05, 0.55) }
        TouchButton { action: "sneak"; label: "SNEAK"; latched: tc.sneak }
        TouchButton { action: "run"; label: "RUN"; latched: tc.run }
        Item { width: 108; height: 108 }
        TouchButton { action: "interact"; label: "USE"; width: 126; height: 126; radius: 63 }
    }
    Rectangle {   // pause, top centre-right (the objectives panel sits in the corner)
        id: pauseBtn
        visible: tc.shown && tc.gameplay
        x: parent.width - 380; y: 16; width: 60; height: 44; radius: 10
        color: Qt.rgba(0, 0, 0, 0.45); border.color: Qt.rgba(1, 1, 1, 0.55); border.width: 2
        Text { anchors.centerIn: parent; text: "‖"; color: "white"; font.pixelSize: 22; font.bold: true }
    }
    // ---- menus: a Back button, since there is no Escape key on a phone ----------------------------
    Rectangle {
        visible: tc.shown && tc.menuBack
        anchors.right: parent.right; anchors.rightMargin: 40; anchors.bottom: parent.bottom; anchors.bottomMargin: 14
        width: 130; height: 48; radius: 10
        color: Qt.rgba(0, 0, 0, 0.45); border.color: Theme.accent; border.width: 2
        Text { anchors.centerIn: parent; text: "‹ BACK"; color: Theme.text; font.pixelSize: 18; font.bold: true; font.family: Theme.font }
        MouseArea { anchors.fill: parent; onClicked: if (tc.game) tc.game.handleAction("back") }
    }
    // ---- portrait phones: ask for landscape ---------------------------------------------------------
    Rectangle {
        visible: tc.shown && tc.height > tc.width
        anchors.fill: parent; color: Qt.rgba(0.08, 0.1, 0.13, 0.96); z: 100
        Column {
            anchors.centerIn: parent; spacing: 14; width: parent.width - 80
            Text { anchors.horizontalCenter: parent.horizontalCenter; text: "↻"; color: Theme.accent; font.pixelSize: 90 }
            Text { width: parent.width; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; text: "Turn your phone sideways"; color: Theme.text; font.pixelSize: 30; font.bold: true; font.family: Theme.font }
            Text { width: parent.width; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; text: "Bite by Bite plays in landscape: stick on the left, actions on the right."; color: Theme.muted; font.pixelSize: 18; font.family: Theme.font }
        }
        MultiPointTouchArea { anchors.fill: parent }   // swallow touches while rotated
    }
}
