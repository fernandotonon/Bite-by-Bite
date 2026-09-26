// A small turntable View3D showing one asset (deck / squad detail panels). Placeholder boxes until the model exists.
import QtQuick
import QtQuick3D
import Clayground.Canvas3D

Item {
    id: stage
    property string assetId: ""
    property real modelHeight: 1.8
    property bool spinning: true
    property color floorColor: "#26303c"
    View3D {
        anchors.fill: parent
        environment: SceneEnvironment { clearColor: "transparent"; backgroundMode: SceneEnvironment.Transparent; antialiasingMode: SceneEnvironment.MSAA }
        // framed from the model height so the head never leaves the top of the stage
        PerspectiveCamera { position: Qt.vector3d(0, stage.modelHeight * 55, stage.modelHeight * 280); eulerRotation.x: -6; fieldOfView: 30 }
        DirectionalLight { eulerRotation: Qt.vector3d(-45, -30, 0); brightness: 1.1; castsShadow: true }
        DirectionalLight { eulerRotation: Qt.vector3d(-20, 150, 0); brightness: 0.45; color: "#b8c8ff" }
        Model { source: "#Cylinder"; y: -3; scale: Qt.vector3d(1.6, 0.06, 1.6); materials: PrincipledMaterial { baseColor: stage.floorColor; roughness: 1 } }
        Node {
            id: turntable
            NumberAnimation on eulerRotation.y { from: 0; to: 360; duration: 9000; loops: Animation.Infinite; running: stage.spinning && stage.visible }
            PropVisual { assetId: stage.assetId; height: stage.modelHeight }
        }
    }
}
