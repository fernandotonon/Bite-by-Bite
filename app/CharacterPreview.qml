// Dev sandbox: one asset from the manifest on a turntable, with its animation clip selectable.
//   clayrender app/CharacterPreview.qml --out t.png --set 'assetId="zombie_standard"' --set 'clip="Walk"'
//   claydojo --sbx app/CharacterPreview.qml
import QtQuick
import QtQuick3D
import Clayground.Canvas3D

Item {
    id: root
    anchors.fill: parent
    property string assetId: "zombie_standard"
    property string clip: "Idle"
    property real yaw: 0
    property real modelHeight: 1.8
    function flagInfo() { return { assetId: assetId, clip: clip, clips: prop.clips, ready: prop.modelReady } }
    View3D {
        anchors.fill: parent
        environment: SceneEnvironment { clearColor: "#1a2233"; backgroundMode: SceneEnvironment.Color; antialiasingMode: SceneEnvironment.MSAA }
        PerspectiveCamera { position: Qt.vector3d(0, 140, 330); eulerRotation.x: -14 }
        DirectionalLight { eulerRotation: Qt.vector3d(-45, -30, 0); brightness: 1.0; castsShadow: true }
        DirectionalLight { eulerRotation: Qt.vector3d(-20, 150, 0); brightness: 0.4 }
        Box3D { y: -6; width: 300; height: 6; depth: 300; color: "#3a4a63"; useToonShading: true; showEdges: false }
        PropVisual { id: prop; assetId: root.assetId; clip: root.clip; eulerRotation.y: root.yaw; height: root.modelHeight }
    }
    Text { x: 12; y: 12; color: "white"; font.pixelSize: 18; text: root.assetId + " · " + root.clip + (prop.clips.length ? "  [" + prop.clips.join(", ") + "]" : "  (static)") }
}
