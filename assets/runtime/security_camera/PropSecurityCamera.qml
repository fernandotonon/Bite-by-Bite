import QtQuick
import QtQuick3D

Node {
    id: node
    // --- game runtime API (added by scripts/import-runtime.py) ---
    property string clip: "Idle"
    readonly property var clips: []
    signal clipFinished(string name)

    // Resources
    Texture {
        id: qtmesh_gen3d_1_1790413452337_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790413452337_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790413452337_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790413452337_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790413452337_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790413452337_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790413452337_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790413452337_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790413452337_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790413452337_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790413452337_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790413452337_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790413452337_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790413452337_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790413452337_normal_png_texture
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Model {
        id: qtmesh_gen3d_1_1790413452337
        objectName: "qtmesh_gen3d_1_1790413452337"
        source: "meshes/meshes_0__mesh.mesh"
        materials: [
            qtmesh_gen3d_1_1790413452337_mesh_mat_material
        ]
    }

    // Animations:
}
