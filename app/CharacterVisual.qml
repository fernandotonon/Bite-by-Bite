// One character in the level: zombie or human. Wraps PropVisual (model or toon placeholder) and adds
// heading, the animation clip (Idle / Walk / Run / Bite from the rig, a bob for placeholders), a
// selection ring for the controlled zombie and the green tint of a turned human.
import QtQuick
import QtQuick3D
import Clayground.Canvas3D

Node {
    id: root
    property string assetId: ""
    property real heading: 0            // degrees, 0 = facing +z
    property bool moving: false
    property bool running: false
    property bool sneaking: false
    property bool biting: false
    property bool stunned: false
    property bool hidden: false
    property bool selected: false
    property bool follower: false
    property bool turned: false         // bitten human: stays as a groaning zombie
    property color ringColor: "#7fe07a"
    property bool useModels: true
    property real simTime: 0
    property real seed: 0
    readonly property string clip: biting ? "Bite" : (moving ? (running ? "Run" : "Walk") : "Idle")
    visible: !hidden

    eulerRotation.y: heading
    // placeholders bob while walking; rigged models play their clips instead
    readonly property real bob: !visual.modelReady && moving ? Math.abs(Math.sin(simTime * (running ? 14 : 9) + seed)) * 6 : 0
    readonly property real lean: sneaking ? 12 : 0

    Node {
        y: root.bob
        eulerRotation.x: root.lean
        scale: Qt.vector3d(1, root.sneaking && !visual.modelReady ? 0.85 : 1, 1)
        PropVisual {
            id: visual
            assetId: root.assetId
            clip: root.clip
            useModels: root.useModels
            highlight: root.selected ? 0.35 : 0
            tint: root.turned ? "#8fd48a" : (def && def.tint ? def.tint : "white")
        }
    }
    // selection ring under the controlled zombie, a smaller ring under followers
    Model {
        source: "#Cylinder"
        visible: root.selected || root.follower
        y: 1.2
        scale: Qt.vector3d(root.selected ? 0.9 : 0.6, 0.02, root.selected ? 0.9 : 0.6)
        materials: PrincipledMaterial { baseColor: root.ringColor; lighting: PrincipledMaterial.NoLighting; opacity: root.selected ? 0.85 : 0.45 }
        castsShadows: false
    }
    // stun stars: tiny spinning boxes over the head
    Node {
        visible: root.stunned
        y: 190
        eulerRotation.y: root.simTime * 300
        Repeater3D { model: 3; delegate: Box3D { required property int index; x: Math.cos(index * 2.09) * 28; z: Math.sin(index * 2.09) * 28; width: 8; height: 8; depth: 8; color: "#ffe066"; lighting: 0; showEdges: false; castsShadows: false } }
    }
}
