// The visual of one asset id: a QtMeshEditor model (balsam QML) when the manifest has one, toon
// placeholder boxes otherwise. Origin: bottom centre, facing +Z. Scene units: 1 m = 100.
import QtQuick
import QtQuick3D
import Clayground.Canvas3D
import "scripts/PlaceholderShapes.js" as Shapes
import "config/assets.js" as Assets

Node {
    id: root
    property string assetId: ""
    readonly property var def: Assets.get(assetId)
    // `alias` reuses another id's model (the human electrician is the zombie model with a skin tint)
    readonly property var modelDef: def && def.alias ? Assets.get(def.alias) : def
    property real height: def ? def.height : 1        // metres
    property color tint: def && def.tint ? def.tint : "white"
    property real highlight: 0                          // 0..1 selection glow on placeholders
    property string clip: "Idle"                        // animation clip for rigged models (ignored by static ones)
    property bool useModels: true
    property real placeholderWidth: 0
    readonly property bool wantsModel: useModels && modelDef && modelDef.representation === "model" && modelDef.model !== ""
    readonly property bool modelReady: modelLoader.status === Loader3D.Ready
    readonly property real fitScale: modelDef && modelDef.unitHeight ? height / modelDef.unitHeight : 1
    readonly property real sink: modelDef && modelDef.sink !== undefined ? modelDef.sink : 0.01
    readonly property var clips: modelLoader.item && modelLoader.item.clips ? modelLoader.item.clips : []
    signal clipFinished(string name)

    Loader3D {
        id: modelLoader
        active: root.wantsModel
        // desktop / dojo: relative to this QML file; WebAssembly: the loader preloads assets into /game/assets/...
        source: root.wantsModel ? (Qt.platform.os === "wasm" ? "file:///game/" + root.modelDef.model.replace(/^(\.\.\/)+/, "") : Qt.resolvedUrl(root.modelDef.model)) : ""
        scale: Qt.vector3d(root.fitScale * 100, root.fitScale * 100, root.fitScale * 100)
        y: (root.modelDef && root.modelDef.footOffset ? root.modelDef.footOffset : 0) * root.fitScale * 100 - root.sink * 100
        eulerRotation.y: root.modelDef && root.modelDef.rotation ? root.modelDef.rotation : 0
        onStatusChanged: { if (status === Loader3D.Error) console.warn("PropVisual: failed to load", source) }
        onLoaded: {
            if (item && item.clip !== undefined) {
                item.clip = Qt.binding(function () { return root.clips.indexOf(root.clip) >= 0 ? root.clip : (root.clips.indexOf("Idle") >= 0 ? "Idle" : (root.clips[0] || "")) })
                item.clipFinished.connect(function (n) { root.clipFinished(n) })
            }
            if (root.tint !== Qt.color("white")) applyTint(item)
        }
    }
    function applyTint(node) {   // multiply the skin tint into every PrincipledMaterial of the loaded model
        if (!node) return
        if (node.materials) for (var i = 0; i < node.materials.length; i++) if (node.materials[i].baseColor !== undefined) node.materials[i].baseColor = root.tint
        for (var k = 0; k < node.children.length; k++) applyTint(node.children[k])
    }

    Node {
        visible: !root.modelReady
        Repeater3D {
            model: root.def ? Shapes.parts(root.def.placeholder.shape, root.height, Object.assign({ w: root.placeholderWidth || undefined }, root.def.placeholder)) : Shapes.parts("box", root.height, {})
            delegate: Box3D {
                required property var modelData
                x: modelData.x * 100; y: (modelData.y - modelData.h / 2) * 100; z: modelData.z * 100   // Box3D origin is the bottom centre
                width: modelData.w * 100; height: modelData.h * 100; depth: modelData.d * 100
                color: Qt.tint(Qt.tint(modelData.color, Qt.rgba(root.tint.r, root.tint.g, root.tint.b, root.tint === Qt.color("white") ? 0 : 0.5)), Qt.rgba(1, 1, 0.6, root.highlight * 0.5))
                useToonShading: true
                showEdges: !modelData.glow
                edgeColor: "#1c1f27"
                edgeThickness: 1.2
                lighting: modelData.glow ? 0 : 1
                castsShadows: true
                receivesShadows: true
            }
        }
    }
}
