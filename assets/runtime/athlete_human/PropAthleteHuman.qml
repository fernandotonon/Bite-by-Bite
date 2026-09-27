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
        id: qtmesh_gen3d_1_1790476655752_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790476655752_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790476655752_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790476655752_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790476655752_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790476655752_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790476655752_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790476655752_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790476655752_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790476655752_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790476655752_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790476655752_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790476655752_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790476655752_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790476655752_normal_png_texture
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
            Qt.matrix4x4(1, 0, 0, -0.00205285, 0, 1, 0, -0.0650031, 0, 0, 1, 0.00119912, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00205285, 0, 1, 0, -0.115914, 0, 0, 1, 0.00119912, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00205285, 0, 1, 0, -0.174658, 0, 0, 1, -0.00271713, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00205285, 0, 1, 0, -0.241235, 0, 0, 1, -0.0105496, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0292772, 0, 1, 0, -0.303895, 0, 0, 1, -0.0183822, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0333829, 0, 1, 0, -0.303895, 0, 0, 1, -0.0183822, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.088021, 0, 1, 0, -0.276481, 0, 0, 1, -0.0183822, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0921267, 0, 1, 0, -0.276481, 0, 0, 1, -0.0183822, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.201592, 0, 1, 0, -0.252983, 0, 0, 1, -0.0262147, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.205698, 0, 1, 0, -0.252983, 0, 0, 1, -0.0262147, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.326913, 0, 1, 0, -0.252983, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.331018, 0, 1, 0, -0.252983, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0527747, 0, 1, 0, -0.0375893, 0, 0, 1, 0.00511538, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0568804, 0, 1, 0, -0.0375893, 0, 0, 1, 0.00511538, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.342578, 0, 1, 0, -0.268648, 0, 0, 1, -0.0262147, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377824, 0, 1, 0, -0.268648, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377824, 0, 1, 0, -0.2569, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377824, 0, 1, 0, -0.241235, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.369991, 0, 1, 0, -0.229486, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.346683, 0, 1, 0, -0.268648, 0, 0, 1, -0.0262147, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.38193, 0, 1, 0, -0.268648, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.38193, 0, 1, 0, -0.2569, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.38193, 0, 1, 0, -0.241235, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.374097, 0, 1, 0, -0.229486, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.072356, 0, 1, 0, 0.205219, 0, 0, 1, -0.0105496, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0764617, 0, 1, 0, 0.205219, 0, 0, 1, -0.0105496, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00205285, 0, 1, 0, -0.31956, 0, 0, 1, -0.0183822, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.354326, 0, 1, 0, -0.284313, 0, 0, 1, -0.0222984, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393489, 0, 1, 0, -0.268648, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.397405, 0, 1, 0, -0.252983, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393489, 0, 1, 0, -0.237318, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.38174, 0, 1, 0, -0.22557, 0, 0, 1, -0.0262147, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.358432, 0, 1, 0, -0.284313, 0, 0, 1, -0.0222984, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397595, 0, 1, 0, -0.268648, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.401511, 0, 1, 0, -0.252983, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397595, 0, 1, 0, -0.237318, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.385846, 0, 1, 0, -0.22557, 0, 0, 1, -0.0262147, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0997698, 0, 1, 0, 0.440194, 0, 0, 1, 0.00903163, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.103876, 0, 1, 0, 0.440194, 0, 0, 1, 0.00903163, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00205285, 0, 1, 0, -0.35089, 0, 0, 1, -0.0183822, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.362159, 0, 1, 0, -0.299978, 0, 0, 1, -0.0144659, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409154, 0, 1, 0, -0.268648, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.41307, 0, 1, 0, -0.249067, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.405238, 0, 1, 0, -0.233402, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393489, 0, 1, 0, -0.217737, 0, 0, 1, -0.0222984, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.366265, 0, 1, 0, -0.299978, 0, 0, 1, -0.0144659, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.41326, 0, 1, 0, -0.268648, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417176, 0, 1, 0, -0.249067, 0, 0, 1, -0.0340472, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.409343, 0, 1, 0, -0.233402, 0, 0, 1, -0.0301309, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397595, 0, 1, 0, -0.217737, 0, 0, 1, -0.0222984, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.111519, 0, 1, 0, 0.495022, 0, 0, 1, 0.0834405, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.115624, 0, 1, 0, 0.495022, 0, 0, 1, 0.0834405, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: athlete_human_trim
            objectName: "athlete_human_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00205285, 0.0650031, -0.00119912)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0509113, 0)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0587438, 0.00391626)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0665763, 0.00783251)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0783251, 0.00783251)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.03133, 0)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.03133, 0.0626601, 0.00783251)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0587438, -0.0274138, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.113571, -0.0234975, 0.00783251)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.12532, 0, 0.00391626)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.015665, 0.015665, -0.00391626)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0117488, 0.015665, -0.00391626)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.0078325, 0.015665, -0.00783251)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0509113, 0.015665, 0.00391626)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.015665, 0, 0)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.015665, 0, -0.00391626)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0509113, 0.00391626, 0.00391626)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0195813, -0.00391626, 0)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.015665, -0.00391626, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0509113, -0.0117488, 0.00391626)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.015665, -0.00391625, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0117488, -0.00391626, -0.00391626)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0430788, -0.0234975, 0)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0117488, -0.00391626, -0.00391626)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117488, -0.00783251, -0.00391626)
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
                                position: Qt.vector3d(0.03133, 0.0626601, 0.00783251)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0587438, -0.0274138, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.113571, -0.0234975, 0.00783251)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.12532, 0, 0.00391626)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.015665, 0.015665, -0.00391626)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0117488, 0.015665, -0.00391626)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.0078325, 0.015665, -0.00783251)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0509113, 0.015665, 0.00391626)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.015665, 0, 0)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.015665, 0, -0.00391626)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0509113, 0.00391626, 0.00391626)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0195813, -0.00391626, 0)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.015665, -0.00391626, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0509113, -0.0117488, 0.00391626)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.015665, -0.00391625, 0)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0117488, -0.00391626, -0.00391626)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0430788, -0.0234975, 0)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0117488, -0.00391626, -0.00391626)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117488, -0.00783251, -0.00391626)
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
                    position: Qt.vector3d(-0.0548276, -0.0274138, -0.00391626)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0195813, -0.242808, 0.015665)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0274138, -0.234975, -0.0195813)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0117488, -0.0548276, -0.0744089)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0548276, -0.0274138, -0.00391626)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0195813, -0.242808, 0.015665)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0274138, -0.234975, -0.0195813)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0117488, -0.0548276, -0.0744089)
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
                qtmesh_gen3d_1_1790476655752_mesh_mat_material
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
