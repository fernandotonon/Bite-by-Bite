// Bite by Bite - desktop entry point. Built with Clayground; assets made with QtMeshEditor.
import QtQuick
import QtQuick.Window

Window {
    id: win
    width: 1280
    height: 720
    minimumWidth: 800
    minimumHeight: 480
    visible: true
    color: "#101418"
    title: "Bite by Bite"
    readonly property bool autotest: Qt.application.arguments.indexOf("--autotest") >= 0

    // Clayground convention: every clay_app is a headless ctest smoke test (QT_QPA_PLATFORM=minimal);
    // loading without warnings is the pass criterion, so quit right after the scene is up.
    Component.onCompleted: { console.log("BiteByBite: window ready", Qt.platform.pluginName); if (Qt.platform.pluginName === "minimal" && !autotest) Qt.quit() }

    Loader {
        anchors.fill: parent
        focus: true
        sourceComponent: win.autotest ? autoComp : gameComp
    }
    Component { id: gameComp; BiteGame { anchors.fill: parent; focus: true; onQuitRequested: Qt.quit() } }
    Component { id: autoComp; AutoTest { anchors.fill: parent } }
}
