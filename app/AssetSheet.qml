// Dev sandbox: every asset of the manifest on a top-down grid, with a red bar along +X and a blue bar
// along +Z under each one - used to set the per-asset `rotation` so footprints (w along X, d along Z) match.
//   clayrender app/AssetSheet.qml --out sheet.png --size 1600x1000
import QtQuick
import QtQuick3D
import Clayground.Canvas3D
import "config/assets.js" as Assets

Item {
    id: root
    anchors.fill: parent
    property string only: ""                 // comma list of ids to show (default: all)
    property var rots: []                    // optional: try these yaws for the (single) asset in `only`, one column each
    readonly property var ids: rots.length ? rots.map(function () { return only }) : (only ? only.split(",") : Object.keys(Assets.assets))
    readonly property int cols: ids.length <= 4 ? ids.length : (ids.length <= 9 ? 3 : 6)
    readonly property real cell: ids.length <= 9 ? 420 : 320
    View3D {
        id: view
        anchors.fill: parent
        camera: cam
        environment: SceneEnvironment { clearColor: "#1a2233"; backgroundMode: SceneEnvironment.Color; antialiasingMode: SceneEnvironment.MSAA }
        PerspectiveCamera { id: cam; position: Qt.vector3d(root.cols * root.cell / 2 - root.cell / 2, root.ids.length <= 9 ? 1500 : 2600, Math.ceil(root.ids.length / root.cols) * root.cell / 2 + (root.ids.length <= 9 ? 150 : 400)); eulerRotation.x: root.ids.length <= 9 ? -84 : -78; fieldOfView: 40; clipFar: 8000 }
        DirectionalLight { eulerRotation: Qt.vector3d(-60, -30, 0); brightness: 1.1 }
        DirectionalLight { eulerRotation: Qt.vector3d(-30, 150, 0); brightness: 0.4 }
        Repeater3D {
            model: root.ids.length
            delegate: Node {
                required property int index
                x: (index % root.cols) * root.cell; z: Math.floor(index / root.cols) * root.cell
                Box3D { y: 0; width: 300; height: 2; depth: 300; color: "#2c3a4d"; showEdges: false }
                Box3D { x: 60; y: 2; width: 120; height: 4; depth: 10; color: "#ff4040"; lighting: 0; showEdges: false }   // +X
                Box3D { z: 60; y: 2; width: 10; height: 4; depth: 120; color: "#4080ff"; lighting: 0; showEdges: false }   // +Z
                PropVisual { assetId: root.ids[index]; height: Math.min(Assets.get(root.ids[index]).height, 2.2); eulerRotation.y: root.rots.length ? root.rots[index] - Assets.get(root.ids[index]).rotation : 0 }
            }
        }
    }
    Repeater {
        model: root.ids.length
        delegate: Text {
            required property int index
            readonly property point p: view.mapFrom3DScene(Qt.vector3d((index % root.cols) * root.cell, 0, Math.floor(index / root.cols) * root.cell + 120))
            x: p.x - width / 2; y: p.y
            text: root.ids[index] + " r" + (root.rots.length ? root.rots[index] : Assets.get(root.ids[index]).rotation); color: "white"; font.pixelSize: 14; style: Text.Outline; styleColor: "black"
        }
    }
}
