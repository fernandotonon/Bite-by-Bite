// Main menu with a slowly turning hospital diorama behind the logo.
import QtQuick
import QtQuick3D
import Clayground.Canvas3D

Item {
    id: screen
    property var game: null
    signal play()
    signal deck()
    signal quit()
    function navigate(action) { return menu.navigate(action) }

    Rectangle { anchors.fill: parent; color: Theme.bg }
    View3D {
        anchors.fill: parent
        environment: SceneEnvironment { clearColor: Theme.bg; backgroundMode: SceneEnvironment.Color; antialiasingMode: SceneEnvironment.MSAA }
        PerspectiveCamera { position: Qt.vector3d(0, 700, 1500); eulerRotation.x: -26; fieldOfView: 30 }
        DirectionalLight { eulerRotation: Qt.vector3d(-45, -30, 0); brightness: 1.1; castsShadow: true }
        DirectionalLight { eulerRotation: Qt.vector3d(-20, 150, 0); brightness: 0.4; color: "#b8c8ff" }
        Box3D { y: -6; width: 1600; height: 6; depth: 1200; color: "#26303c"; useToonShading: true; showEdges: false }
        Node {
            x: 120
            NumberAnimation on eulerRotation.y { from: 0; to: 360; duration: 60000; loops: Animation.Infinite }
            // shown once the generated model exists; its toon-box placeholder would just be a wall of white
            PropVisual { assetId: "hospital_building"; height: 4.2; visible: wantsModel }
        }
        Node { x: -420; z: 150; eulerRotation.y: 25; PropVisual { assetId: "zombie_standard"; height: 1.9 } }
        Node { x: -300; z: 260; eulerRotation.y: -15; PropVisual { assetId: "zombie_brute"; height: 2.1 } }
    }
    Rectangle { anchors.fill: parent; gradient: Gradient { orientation: Gradient.Horizontal; GradientStop { position: 0; color: Qt.rgba(0.08, 0.1, 0.13, 0.92) } GradientStop { position: 0.55; color: Qt.rgba(0.08, 0.1, 0.13, 0.0) } } }

    Column {
        x: 70; y: parent.height * 0.14; spacing: 8
        Text { text: "BITE"; color: Theme.accent; font.pixelSize: 84; font.bold: true; font.family: Theme.font; lineHeight: 0.85 }
        Text { text: "by BITE"; color: Theme.text; font.pixelSize: 48; font.bold: true; font.family: Theme.font; lineHeight: 0.9 }
        Text { text: "Capture humans. Build the perfect horde."; color: Theme.muted; font.pixelSize: 18; font.family: Theme.font }
        Item { width: 1; height: 26 }
        MenuList {
            id: menu
            width: 380
            options: [
                { label: "Play", hint: "Mission select" },
                { label: "Horde Deck", hint: game ? game.save.progress.unlocked.length + " zombies" : "" },
                { label: "Show detection cones: " + (game && game.save.settings.showCones ? "on" : "off") },
                { label: "Sound: " + (game && game.save.settings.muted ? "muted" : "on") },
                { label: "Quit" }
            ]
            onMoved: game.audio.play("ui_move")
            onAccepted: function (i) {
                game.audio.play("ui_select")
                if (i === 0) screen.play()
                else if (i === 1) screen.deck()
                else if (i === 2) game.save.writeSettings({ showCones: !game.save.settings.showCones })
                else if (i === 3) game.save.writeSettings({ muted: !game.save.settings.muted })
                else screen.quit()
            }
        }
    }
    Text { x: 70; anchors.bottom: parent.bottom; anchors.bottomMargin: 18; text: "Built with Clayground · Assets made with QtMeshEditor · v0.1 vertical slice"; color: Theme.muted; font.pixelSize: 12; font.family: Theme.font }
    Text { anchors.right: parent.right; anchors.rightMargin: 24; anchors.bottom: parent.bottom; anchors.bottomMargin: 18; text: "↑↓ navigate · Enter select · Esc back"; color: Theme.muted; font.pixelSize: 12; font.family: Theme.font }
}
