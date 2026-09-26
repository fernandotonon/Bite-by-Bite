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
        id: qtmesh_gen3d_1_1790410850497_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790410850497_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790410850497_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790410850497_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790410850497_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790410850497_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790410850497_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790410850497_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790410850497_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790410850497_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790410850497_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790410850497_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790410850497_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790410850497_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790410850497_normal_png_texture
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
            joint_19,
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
            joint_20,
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
            Qt.matrix4x4(1, 0, 0, -0.00181692, 0, 1, 0, 0.0215586, 0, 0, 1, -0.0056633, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00181692, 0, 1, 0, -0.0254364, 0, 0, 1, -0.00957955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00181692, 0, 1, 0, -0.0880964, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00181692, 0, 1, 0, -0.158589, 0, 0, 1, -0.0252446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0490944, 0, 1, 0, -0.225165, 0, 0, 1, -0.0330771, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0527282, 0, 1, 0, -0.225165, 0, 0, 1, -0.0330771, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.158749, 0, 1, 0, -0.193835, 0, 0, 1, -0.0330771, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.162383, 0, 1, 0, -0.193835, 0, 0, 1, -0.0330771, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.248823, 0, 1, 0, -0.170338, 0, 0, 1, -0.0369933, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.252457, 0, 1, 0, -0.170338, 0, 0, 1, -0.0369933, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.37806, 0, 1, 0, -0.170338, 0, 0, 1, -0.0252446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.381693, 0, 1, 0, -0.170338, 0, 0, 1, -0.0252446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0569269, 0, 1, 0, 0.0528887, 0, 0, 1, -0.00957955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0605607, 0, 1, 0, 0.0528887, 0, 0, 1, -0.00957955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393725, 0, 1, 0, -0.189919, 0, 0, 1, -0.00957955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.436803, 0, 1, 0, -0.197751, 0, 0, 1, -0.0134958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.44072, 0, 1, 0, -0.17817, 0, 0, 1, -0.0213283, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444636, 0, 1, 0, -0.142924, 0, 0, 1, -0.0213283, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397358, 0, 1, 0, -0.193835, 0, 0, 1, -0.00957955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.440437, 0, 1, 0, -0.197751, 0, 0, 1, -0.00957955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.444353, 0, 1, 0, -0.17817, 0, 0, 1, -0.0213283, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.44827, 0, 1, 0, -0.158589, 0, 0, 1, -0.0213283, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.444353, 0, 1, 0, -0.142924, 0, 0, 1, -0.0213283, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0960894, 0, 1, 0, 0.217371, 0, 0, 1, -0.0291608, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0997232, 0, 1, 0, 0.217371, 0, 0, 1, -0.0291608, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00181692, 0, 1, 0, -0.24083, 0, 0, 1, -0.0330771, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.405473, 0, 1, 0, -0.2095, 0, 0, 1, 0.00216921, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.456385, 0, 1, 0, -0.201668, 0, 0, 1, -0.00957955, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464217, 0, 1, 0, -0.17817, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444636, 0, 1, 0, -0.158589, 0, 0, 1, -0.0213283, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460301, 0, 1, 0, -0.139008, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.409107, 0, 1, 0, -0.213417, 0, 0, 1, -0.00174704, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.460018, 0, 1, 0, -0.201668, 0, 0, 1, -0.0056633, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.467851, 0, 1, 0, -0.17817, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.467851, 0, 1, 0, -0.158589, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.463935, 0, 1, 0, -0.139008, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.115671, 0, 1, 0, 0.334859, 0, 0, 1, -0.0291608, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.119304, 0, 1, 0, 0.334859, 0, 0, 1, -0.0291608, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00181692, 0, 1, 0, -0.268244, 0, 0, 1, -0.0213283, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.417222, 0, 1, 0, -0.229082, 0, 0, 1, 0.0100017, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.47205, 0, 1, 0, -0.201668, 0, 0, 1, -0.00174704, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.483798, 0, 1, 0, -0.17817, 0, 0, 1, -0.0134958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464217, 0, 1, 0, -0.158589, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.475966, 0, 1, 0, -0.135091, 0, 0, 1, -0.0134958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.420856, 0, 1, 0, -0.232998, 0, 0, 1, 0.00608546, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.475683, 0, 1, 0, -0.201668, 0, 0, 1, 0.00216921, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487432, 0, 1, 0, -0.17817, 0, 0, 1, -0.0134958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487432, 0, 1, 0, -0.158589, 0, 0, 1, -0.0174121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.4796, 0, 1, 0, -0.135091, 0, 0, 1, -0.0134958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.143084, 0, 1, 0, 0.377938, 0, 0, 1, 0.060913, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.146718, 0, 1, 0, 0.377938, 0, 0, 1, 0.060913, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_brute_trim
            objectName: "zombie_brute_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00181692, -0.0215586, 0.0056633)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.046995, 0.00391625)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.06266, 0.0078325)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0704926, 0.0078325)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0822413, 0.0078325)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0274138, -0.0117488)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0509113, 0.0665763, 0.0078325)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.109655, -0.03133, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.0900738, -0.0234975, 0.00391626)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.129236, 0, -0.0117488)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.015665, 0.0195813, -0.015665)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0117488, 0.0195813, -0.0117488)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.0117488, 0.0195813, -0.0078325)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0587438, 0.0274138, -0.0117488)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0195813, 0.00391625, -0.00391625)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.015665, 0, -0.0078325)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.06266, 0.00783251, -0.00391625)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0234975, 0, -0.00391625)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0195813, 0, -0.00391625)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0665763, -0.0117487, -0.00391625)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0195813, 0, -0.00391625)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0195813, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0665763, -0.0274138, -0.00391625)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.015665, -0.00391626, -0.00391625)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.015665, -0.00391625, -0.00391625)
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
                                position: Qt.vector3d(0.0509113, 0.0665763, 0.0078325)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.109655, -0.03133, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.0900738, -0.0234975, 0.00391626)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.129236, 0, -0.0117488)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.015665, 0.0234975, -0.015665)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0117488, 0.0195813, -0.0078325)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.0117488, 0.0195813, -0.0078325)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0587438, 0.0274138, -0.015665)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0195813, 0.00391625, -0.00391625)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.015665, 0, -0.0078325)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.06266, 0.00783251, -0.00391625)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0234975, 0, -0.00391625)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0195813, 0, -0.00391625)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0665763, -0.0117487, -0.00391625)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0195813, 0, -0.00391625)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0195813, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.06266, -0.0274138, -0.00391625)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0195813, -0.00391626, -0.00391625)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.015665, -0.00391625, -0.00391625)
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
                    position: Qt.vector3d(-0.0587438, -0.03133, 0.00391625)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0391625, -0.164483, 0.0195813)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0195813, -0.117488, 0)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0274138, -0.0430788, -0.0900738)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0587438, -0.03133, 0.00391625)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0391625, -0.164483, 0.0195813)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0195813, -0.117488, 0)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0274138, -0.0430788, -0.0900738)
                            }
                        }
                    }
                }
            }
        }
        Model {
            id: a7_mesh
            objectName: "a7_mesh"
            source: "meshes/meshes_0__mesh.mesh"
            skin: skin
            materials: [
                qtmesh_gen3d_1_1790410850497_mesh_mat_material
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
        endFrame: 2967
        currentFrame: 0
        enabled: node.clip === "Idle"
        animations: TimelineAnimation {
            duration: 2967
            from: 0
            to: 2967
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
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, 4.28903e-07, -1.21215e-06, 1.27276e-05)
            }
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
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.822596, -0.549726, 0.143407, -0.023901)
            }
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.741265, 0.476583, 0.461387, 0.102553)
            }
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.655666, -0.550546, 0.320148, -0.405594)
            }
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999927, -0.0121295, -6.52086e-07, -6.33223e-08)
            }
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_1.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999912, 0.0132841, -2.49158e-06, 2.9899e-05)
            }
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999867, 0.0163207, 1.20513e-06, -9.20854e-06)
            }
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
