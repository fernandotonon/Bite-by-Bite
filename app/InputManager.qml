// Action-based input: keyboard bindings are data, and a gamepad backend can be plugged into
// `gamepad` (an object exposing axisX/axisY in -1..1 and button flags, polled every frame).
// Qt 6 ships no gamepad module and Clayground's GameController has its physical-gamepad path disabled,
// so on desktop the slot is empty until a platform bridge is provided (see docs/architecture.md).
//
//   held actions   -> moveX / moveZ / run / sneak (read by the game every frame)
//   edge actions   -> triggered(name)  for interact, bite, ability, switchNext, switchPrev, command,
//                     restart, pause, menuUp/Down/Left/Right, accept, back
import QtQuick

Item {
    id: input
    property var keys: ({
        moveUp:     [Qt.Key_W, Qt.Key_Up],
        moveDown:   [Qt.Key_S, Qt.Key_Down],
        moveLeft:   [Qt.Key_A, Qt.Key_Left],
        moveRight:  [Qt.Key_D, Qt.Key_Right],
        run:        [Qt.Key_Shift],
        sneak:      [Qt.Key_Control, Qt.Key_C, Qt.Key_Meta],
        interact:   [Qt.Key_E, Qt.Key_Space],
        bite:       [Qt.Key_F],
        ability:    [Qt.Key_Q],
        switchNext: [Qt.Key_Tab],
        switchPrev: [Qt.Key_Backtab],
        command:    [Qt.Key_H],
        restart:    [Qt.Key_R],
        pause:      [Qt.Key_Escape, Qt.Key_P],
        menuUp:     [Qt.Key_W, Qt.Key_Up],
        menuDown:   [Qt.Key_S, Qt.Key_Down],
        menuLeft:   [Qt.Key_A, Qt.Key_Left],
        menuRight:  [Qt.Key_D, Qt.Key_Right],
        accept:     [Qt.Key_Return, Qt.Key_Enter, Qt.Key_Space, Qt.Key_E],
        back:       [Qt.Key_Escape, Qt.Key_Backspace]
    })
    // human-readable key names for the HUD / help
    readonly property var labels: ({ interact: "E", bite: "F", ability: "Q", switchNext: "Tab", command: "H", restart: "R", pause: "Esc", run: "Shift", sneak: "Ctrl", accept: "Enter", back: "Esc" })

    signal triggered(string action, int serial)
    property int serial: 0             // one physical press may map to several actions (Esc = pause + back): the game consumes by serial

    property var held: ({})
    property real moveX: 0
    property real moveZ: 0
    property bool run: false
    property bool sneak: false
    property var gamepad: null         // backend hook: { connected, axisX, axisY, run, sneak, buttons: { interact, bite, ... } }
    property var gamepadWas: ({})

    function isHeld(action) { var ks = keys[action]; for (var i = 0; i < ks.length; i++) if (held[ks[i]]) return true; return false }
    function refreshHeld() {
        var x = (isHeld("moveRight") ? 1 : 0) - (isHeld("moveLeft") ? 1 : 0)
        var z = (isHeld("moveDown") ? 1 : 0) - (isHeld("moveUp") ? 1 : 0)
        var r = isHeld("run"), s = isHeld("sneak")
        if (gamepad && gamepad.connected) {
            if (Math.abs(gamepad.axisX) > 0.2 || Math.abs(gamepad.axisY) > 0.2) { x = gamepad.axisX; z = gamepad.axisY }
            r = r || !!gamepad.run; s = s || !!gamepad.sneak
        }
        moveX = x; moveZ = z; run = r; sneak = s
    }
    function keyPressed(event) {
        if (event.isAutoRepeat) return
        held[event.key] = true; heldChanged()
        refreshHeld()
        serial++
        for (var a in keys) if (keys[a].indexOf(event.key) >= 0 && !isMovement(a)) triggered(a, serial)
        event.accepted = true
    }
    function keyReleased(event) {
        if (event.isAutoRepeat) return
        delete held[event.key]; heldChanged()
        refreshHeld()
        event.accepted = true
    }
    function isMovement(a) { return a === "moveUp" || a === "moveDown" || a === "moveLeft" || a === "moveRight" || a === "run" || a === "sneak" }
    function clear() { held = ({}); refreshHeld() }
    // gamepad buttons are polled: an edge (false -> true) fires the action
    function poll() {
        if (!gamepad || !gamepad.connected) return
        refreshHeld()
        var b = gamepad.buttons || {}
        serial++
        for (var a in b) { if (b[a] && !gamepadWas[a]) triggered(a, serial); gamepadWas[a] = !!b[a] }
    }
}
