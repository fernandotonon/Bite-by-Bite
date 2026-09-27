import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node
    // --- game runtime API (added by scripts/import-runtime.py) ---
    property string clip: "Idle"
    readonly property var clips: ["Bite", "Idle", "Run", "Walk"]
    signal clipFinished(string name)

    // Resources
    Texture {
        id: qtmesh_gen3d_1_1790409193245_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790409193245_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790409193245_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790409193245_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790409193245_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790409193245_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790409193245_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790409193245_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790409193245_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790409193245_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790409193245_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790409193245_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790409193245_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790409193245_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790409193245_normal_png_texture
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            hips,
            spine,
            spine1,
            spine2,
            leftArm,
            rightArm,
            leftForeArm,
            rightForeArm,
            leftHand,
            rightHand,
            joint_9,
            joint_28,
            leftUpLeg,
            rightUpLeg,
            joint_10,
            joint_13,
            joint_16,
            joint_19,
            joint_22,
            joint_29,
            joint_32,
            joint_35,
            joint_38,
            joint_41,
            leftLeg,
            rightLeg,
            neck,
            joint_11,
            joint_14,
            joint_17,
            joint_20,
            joint_23,
            joint_30,
            joint_33,
            joint_36,
            joint_39,
            joint_42,
            leftFoot,
            rightFoot,
            head,
            joint_12,
            joint_15,
            joint_18,
            joint_21,
            joint_24,
            joint_31,
            joint_34,
            joint_37,
            joint_40,
            joint_43,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00190587, 0, 1, 0, -0.0414651, 0, 0, 1, -0.0248926, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00190587, 0, 1, 0, -0.0962988, 0, 0, 1, -0.0288093, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00190587, 0, 1, 0, -0.162883, 0, 0, 1, -0.032726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00190587, 0, 1, 0, -0.2373, 0, 0, 1, -0.0366427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0372611, 0, 1, 0, -0.3078, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0410728, 0, 1, 0, -0.3078, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.119512, 0, 1, 0, -0.27255, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.123323, 0, 1, 0, -0.27255, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.225262, 0, 1, 0, -0.252967, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.229074, 0, 1, 0, -0.252967, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.350597, 0, 1, 0, -0.2608, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.354408, 0, 1, 0, -0.2608, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0529279, 0, 1, 0, -0.0101315, 0, 0, 1, -0.0209759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0567396, 0, 1, 0, -0.0101315, 0, 0, 1, -0.0209759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.362347, 0, 1, 0, -0.280383, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.401514, 0, 1, 0, -0.292134, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.401514, 0, 1, 0, -0.276467, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.40543, 0, 1, 0, -0.264717, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.401514, 0, 1, 0, -0.24905, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.366158, 0, 1, 0, -0.280383, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405325, 0, 1, 0, -0.292134, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405325, 0, 1, 0, -0.276467, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.409242, 0, 1, 0, -0.264717, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405325, 0, 1, 0, -0.24905, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0685946, 0, 1, 0, 0.232704, 0, 0, 1, -0.0366427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0724064, 0, 1, 0, 0.232704, 0, 0, 1, -0.0366427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00190587, 0, 1, 0, -0.323467, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.374097, 0, 1, 0, -0.29605, 0, 0, 1, -0.0366427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.41718, 0, 1, 0, -0.299967, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.421097, 0, 1, 0, -0.2843, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.421097, 0, 1, 0, -0.268633, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.41718, 0, 1, 0, -0.24905, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.377909, 0, 1, 0, -0.29605, 0, 0, 1, -0.0366427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.420992, 0, 1, 0, -0.299967, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.424909, 0, 1, 0, -0.2843, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.424909, 0, 1, 0, -0.268633, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.420992, 0, 1, 0, -0.24905, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0842614, 0, 1, 0, 0.444205, 0, 0, 1, -0.0405594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0880731, 0, 1, 0, 0.444205, 0, 0, 1, -0.0366427, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00190587, 0, 1, 0, -0.354801, 0, 0, 1, -0.0288093, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.374097, 0, 1, 0, -0.311717, 0, 0, 1, -0.032726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.432847, 0, 1, 0, -0.303884, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440681, 0, 1, 0, -0.288217, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.436764, 0, 1, 0, -0.27255, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.428931, 0, 1, 0, -0.24905, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.377909, 0, 1, 0, -0.311717, 0, 0, 1, -0.032726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.436659, 0, 1, 0, -0.303884, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.444492, 0, 1, 0, -0.288217, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.440576, 0, 1, 0, -0.27255, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.432742, 0, 1, 0, -0.24905, 0, 0, 1, -0.0444761, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0999282, 0, 1, 0, 0.499039, 0, 0, 1, 0.0495246, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.10374, 0, 1, 0, 0.499039, 0, 0, 1, 0.0495246, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: guard_rigged
        objectName: "guard_rigged"
        Node {
            id: guard_trim
            objectName: "guard_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00190587, 0.0414651, 0.0248926)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0548337, 0.00391669)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0665838, 0.0039167)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0744172, 0.0039167)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0861673, 0.00391669)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0313335, -0.0117501)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0391669, 0.0705005, 0.00391669)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0822506, -0.0352502, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.105751, -0.0195835, 0.0039167)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.125334, 0.00783339, 0)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0117501, 0.0195835, -0.0039167)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0117501, 0.0156668, -0.00391669)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(0, 0.0156668, -0.0039167)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.050917, 0.0313336, 0)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0156668, 0.00783339, 0)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0156668, 0.00391668, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.050917, 0.0156668, 0)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0195835, 0.00783339, 0)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0195835, 0.00391668, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0548337, 0.00391671, 0)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0156668, 0.00391668, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156668, 0.00391671, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.050917, -0.0117501, 0)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156668, 0, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117501, 0, 0)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Node {
                                id: rightArm
                                objectName: "RightArm"
                                position: Qt.vector3d(0.0391669, 0.0705005, 0.00391669)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0822506, -0.0352502, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.105751, -0.0195835, 0.0039167)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.125334, 0.00783339, 0)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0117501, 0.0195835, -0.0039167)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0117501, 0.0156668, -0.00391669)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0, 0.0156668, -0.0039167)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0509171, 0.0313336, 0)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0156668, 0.00783339, 0)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0156668, 0.00391668, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0509171, 0.0156668, 0)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0195835, 0.00783339, 0)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0195835, 0.00391668, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0548337, 0.00391671, 0)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0156668, 0.00391668, 0)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0156668, 0.00391671, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0509171, -0.0117501, 0)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0156668, 0, 0)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117501, 0, 0)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Node {
                    id: leftUpLeg
                    objectName: "LeftUpLeg"
                    position: Qt.vector3d(-0.0548337, -0.0313336, -0.0039167)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0156668, -0.242835, 0.0156668)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0156668, -0.211502, 0.00391669)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0156668, -0.0548337, -0.090084)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0548337, -0.0313336, -0.0039167)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0156668, -0.242835, 0.0156668)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0156668, -0.211502, 0)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0156668, -0.0548337, -0.0861673)
                            }
                        }
                    }
                }
            }
        }
        Model {
            id: guard_rigged_mesh
            objectName: "guard_rigged_mesh"
            source: "meshes/meshes_0__mesh.mesh"
            skin: skin
            materials: [
                qtmesh_gen3d_1_1790409193245_mesh_mat_material
            ]
        }
    }

    // Animations:
    Timeline {
        id: bite_timeline
        objectName: "Bite"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 967
        currentFrame: 0
        enabled: node.clip === "Bite"
        animations: TimelineAnimation {
            duration: 967
            from: 0
            to: 967
            running: node.clip === "Bite"
            loops: 1
            onFinished: Qt.callLater(function() { if (node) node.clipFinished("Bite") })
        }
        KeyframeGroup {
            target: rightFoot
            property: "rotation"
            keyframeSource: "animations/rightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftFoot
            property: "rotation"
            keyframeSource: "animations/leftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightLeg
            property: "rotation"
            keyframeSource: "animations/rightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftLeg
            property: "rotation"
            keyframeSource: "animations/leftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightUpLeg
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_0.qad"
        }
    }
    Timeline {
        id: idle_timeline
        objectName: "Idle"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1834
        currentFrame: 0
        enabled: node.clip === "Idle"
        animations: TimelineAnimation {
            duration: 1834
            from: 0
            to: 1834
            running: node.clip === "Idle"
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFoot
            property: "rotation"
            keyframeSource: "animations/rightFoot_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftFoot
            property: "rotation"
            keyframeSource: "animations/leftFoot_rotation_1.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightLeg
            property: "rotation"
            keyframeSource: "animations/rightLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftLeg
            property: "rotation"
            keyframeSource: "animations/leftLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightUpLeg
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_1.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_1.qad"
        }
    }
    Timeline {
        id: run_timeline
        objectName: "Run"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 767
        currentFrame: 0
        enabled: node.clip === "Run"
        animations: TimelineAnimation {
            duration: 767
            from: 0
            to: 767
            running: node.clip === "Run"
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFoot
            property: "rotation"
            keyframeSource: "animations/rightFoot_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftFoot
            property: "rotation"
            keyframeSource: "animations/leftFoot_rotation_2.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightLeg
            property: "rotation"
            keyframeSource: "animations/rightLeg_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftLeg
            property: "rotation"
            keyframeSource: "animations/leftLeg_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightUpLeg
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_2.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_2.qad"
        }
    }
    Timeline {
        id: walk_timeline
        objectName: "Walk"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1167
        currentFrame: 0
        enabled: node.clip === "Walk"
        animations: TimelineAnimation {
            duration: 1167
            from: 0
            to: 1167
            running: node.clip === "Walk"
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: rightFoot
            property: "rotation"
            keyframeSource: "animations/rightFoot_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftFoot
            property: "rotation"
            keyframeSource: "animations/leftFoot_rotation_3.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightLeg
            property: "rotation"
            keyframeSource: "animations/rightLeg_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftLeg
            property: "rotation"
            keyframeSource: "animations/leftLeg_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightUpLeg
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_3.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_3.qad"
        }
    }
}
