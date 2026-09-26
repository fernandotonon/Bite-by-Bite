// Dojo / clayrender entry point: the whole game as a live-reloading sandbox.
//   QT_DISABLE_SHADER_DISK_CACHE=1 claydojo --sbx app/Sandbox.qml
//   clayrender app/Sandbox.qml --out shot.png --size 1400x800 --eval 'game.debugStart()'
import QtQuick

Item {
    id: root
    anchors.fill: parent

    BiteGame {
        id: game
        anchors.fill: parent
        focus: true
    }

    // Surfaces match state to the Clayground inspector (snapshot/flag) and to clayrender --dump.
    function flagInfo() { return game.debugInfo() }
    function viewState() { return { screen: game.screen } }
    function applyViewState(s) { }
}
