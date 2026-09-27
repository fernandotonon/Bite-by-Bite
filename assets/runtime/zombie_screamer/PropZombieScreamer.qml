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
        id: qtmesh_gen3d_1_1790474537269_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790474537269_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790474537269_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790474537269_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790474537269_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790474537269_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790474537269_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790474537269_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790474537269_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790474537269_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790474537269_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790474537269_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790474537269_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790474537269_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790474537269_normal_png_texture
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
            joint_35,
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
            joint_36,
            joint_40,
            joint_43,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00204958, 0, 1, 0, -0.0296626, 0, 0, 1, -0.000412125, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204958, 0, 1, 0, -0.0803419, 0, 0, 1, -0.00431053, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204958, 0, 1, 0, -0.138818, 0, 0, 1, -0.00820893, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204958, 0, 1, 0, -0.205091, 0, 0, 1, -0.0121073, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0252392, 0, 1, 0, -0.271364, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0293384, 0, 1, 0, -0.271364, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0759185, 0, 1, 0, -0.247973, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0800176, 0, 1, 0, -0.247973, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.177277, 0, 1, 0, -0.236278, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.181376, 0, 1, 0, -0.236278, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.298127, 0, 1, 0, -0.240176, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.302227, 0, 1, 0, -0.240176, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0447313, 0, 1, 0, 0.00152458, 0, 0, 1, -0.000412125, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0488304, 0, 1, 0, 0.00152458, 0, 0, 1, -0.000412125, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.309823, 0, 1, 0, -0.251872, 0, 0, 1, -0.0121073, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.34101, 0, 1, 0, -0.263567, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.344908, 0, 1, 0, -0.251872, 0, 0, 1, -0.0277009, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.344908, 0, 1, 0, -0.240176, 0, 0, 1, -0.0315994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.34101, 0, 1, 0, -0.228481, 0, 0, 1, -0.0354978, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.313922, 0, 1, 0, -0.251872, 0, 0, 1, -0.0121073, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.345109, 0, 1, 0, -0.263567, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.349007, 0, 1, 0, -0.240176, 0, 0, 1, -0.0315994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.345109, 0, 1, 0, -0.228481, 0, 0, 1, -0.0354978, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0642233, 0, 1, 0, 0.23153, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0683224, 0, 1, 0, 0.23153, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204958, 0, 1, 0, -0.27916, 0, 0, 1, -0.0160057, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.321518, 0, 1, 0, -0.259668, 0, 0, 1, -0.00820893, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.356604, 0, 1, 0, -0.267465, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.360502, 0, 1, 0, -0.251872, 0, 0, 1, -0.0277009, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.360502, 0, 1, 0, -0.240176, 0, 0, 1, -0.0315994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.352705, 0, 1, 0, -0.228481, 0, 0, 1, -0.0354978, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.325617, 0, 1, 0, -0.259668, 0, 0, 1, -0.00820893, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.360703, 0, 1, 0, -0.267465, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.349007, 0, 1, 0, -0.251872, 0, 0, 1, -0.0277009, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.364601, 0, 1, 0, -0.240176, 0, 0, 1, -0.0315994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.356804, 0, 1, 0, -0.228481, 0, 0, 1, -0.0354978, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0837153, 0, 1, 0, 0.442044, 0, 0, 1, -0.0277009, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0878144, 0, 1, 0, 0.442044, 0, 0, 1, -0.0238025, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204958, 0, 1, 0, -0.314246, 0, 0, 1, -0.0121073, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.325416, 0, 1, 0, -0.275262, 0, 0, 1, -0.000412125, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.368299, 0, 1, 0, -0.271364, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.376096, 0, 1, 0, -0.251872, 0, 0, 1, -0.0277009, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.372197, 0, 1, 0, -0.240176, 0, 0, 1, -0.0315994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.3644, 0, 1, 0, -0.224583, 0, 0, 1, -0.0354978, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.329515, 0, 1, 0, -0.275262, 0, 0, 1, -0.000412125, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.372398, 0, 1, 0, -0.271364, 0, 0, 1, -0.0199041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.364601, 0, 1, 0, -0.251872, 0, 0, 1, -0.0277009, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.376296, 0, 1, 0, -0.240176, 0, 0, 1, -0.0315994, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.368499, 0, 1, 0, -0.224583, 0, 0, 1, -0.0354978, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0993089, 0, 1, 0, 0.496622, 0, 0, 1, 0.0346735, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.103408, 0, 1, 0, 0.496622, 0, 0, 1, 0.0346735, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_screamer_trim
            objectName: "zombie_screamer_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00204958, 0.0296626, 0.000412125)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0506792, 0.0038984)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.058476, 0.0038984)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0662729, 0.0038984)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0740696, 0.0038984)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0350856, -0.0038984)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0272888, 0.0662729, 0.0038984)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0506792, -0.0233904, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.101358, -0.0116952, 0)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.120851, 0.0038984, 0.0038984)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0116952, 0.0116952, -0.00779681)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0116952, 0.00779682, -0.0038984)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.00389841, 0.0155936, -0.00779681)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0428824, 0.0233904, 0)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0155936, 0.00389841, 0)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0116952, 0.00389841, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0467808, 0.0116952, 0.00779681)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0155936, 0, 0)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0155936, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0467808, 0, 0.0116952)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0155936, 0, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0116952, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0428824, -0.0116952, 0.0155936)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0116952, 0, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0116952, -0.0038984, 0)
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
                                position: Qt.vector3d(0.0272888, 0.0662729, 0.0038984)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0506792, -0.0233904, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.101358, -0.0116952, 0)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.12085, 0.0038984, 0.0038984)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0116952, 0.0116952, -0.00779681)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0116952, 0.00779682, -0.0038984)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.00389838, 0.0155936, -0.00779681)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0428824, 0.0233904, 0)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0155936, 0.00389841, 0)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0116952, 0.00389841, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0467809, 0.0116952, 0.00779681)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0155936, 0, 0)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0155936, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0467809, 0, 0.0116952)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0155936, 0, 0)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0116952, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0428824, -0.0116952, 0.0155936)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0116952, 0, 0)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0116952, -0.0038984, 0)
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
                    position: Qt.vector3d(-0.0467808, -0.0311872, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.019492, -0.230006, 0.0155936)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.019492, -0.210514, 0.0116952)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0155936, -0.0545776, -0.0623745)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0467808, -0.0311872, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.019492, -0.230006, 0.0155936)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.019492, -0.210514, 0.00779681)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0155936, -0.0545776, -0.058476)
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
                qtmesh_gen3d_1_1790474537269_mesh_mat_material
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
