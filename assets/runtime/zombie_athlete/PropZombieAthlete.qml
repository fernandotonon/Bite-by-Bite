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
        id: qtmesh_gen3d_1_1790473583074_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790473583074_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790473583074_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790473583074_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790473583074_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790473583074_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790473583074_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790473583074_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790473583074_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790473583074_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790473583074_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790473583074_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790473583074_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790473583074_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790473583074_normal_png_texture
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
            joint_13,
            joint_16,
            joint_19,
            joint_22,
            joint_32,
            joint_35,
            joint_38,
            leftLeg,
            rightLeg,
            neck,
            joint_10,
            joint_14,
            joint_17,
            joint_20,
            joint_23,
            joint_29,
            joint_33,
            joint_36,
            joint_39,
            joint_41,
            leftFoot,
            rightFoot,
            head,
            joint_11,
            joint_15,
            joint_18,
            joint_21,
            joint_24,
            joint_30,
            joint_34,
            joint_37,
            joint_40,
            joint_42,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00961179, 0, 1, 0, -0.0721953, 0, 0, 1, 0.00835241, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00961179, 0, 1, 0, -0.119208, 0, 0, 1, 0.00835241, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00961179, 0, 1, 0, -0.170139, 0, 0, 1, 0.00443468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00961179, 0, 1, 0, -0.228904, 0, 0, 1, 0.000516947, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0178123, 0, 1, 0, -0.279835, 0, 0, 1, -0.00340078, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0370359, 0, 1, 0, -0.279835, 0, 0, 1, -0.00340078, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0765783, 0, 1, 0, -0.248493, 0, 0, 1, -0.0112362, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0958019, 0, 1, 0, -0.248493, 0, 0, 1, -0.00731851, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.198028, 0, 1, 0, -0.240658, 0, 0, 1, -0.0190717, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.209416, 0, 1, 0, -0.240658, 0, 0, 1, -0.0190717, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.342984, 0, 1, 0, -0.232822, 0, 0, 1, -0.0269072, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.354372, 0, 1, 0, -0.232822, 0, 0, 1, -0.0269072, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0413187, 0, 1, 0, -0.0486889, 0, 0, 1, 0.00443468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.06446, 0, 1, 0, -0.0486889, 0, 0, 1, 0.00443468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393914, 0, 1, 0, -0.23674, 0, 0, 1, -0.0386604, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393914, 0, 1, 0, -0.228904, 0, 0, 1, -0.0425781, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.389997, 0, 1, 0, -0.217151, 0, 0, 1, -0.0464958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.382161, 0, 1, 0, -0.205398, 0, 0, 1, -0.0425781, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.401385, 0, 1, 0, -0.240658, 0, 0, 1, -0.0425781, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.401385, 0, 1, 0, -0.228904, 0, 0, 1, -0.0425781, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397467, 0, 1, 0, -0.217151, 0, 0, 1, -0.0425781, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0609074, 0, 1, 0, 0.190293, 0, 0, 1, -0.00340078, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0840487, 0, 1, 0, 0.190293, 0, 0, 1, -0.00340078, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00961179, 0, 1, 0, -0.295506, 0, 0, 1, -0.00340078, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.362573, 0, 1, 0, -0.240658, 0, 0, 1, -0.0229894, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409585, 0, 1, 0, -0.23674, 0, 0, 1, -0.0425781, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409585, 0, 1, 0, -0.224987, 0, 0, 1, -0.0464958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.405668, 0, 1, 0, -0.213234, 0, 0, 1, -0.0504136, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.397832, 0, 1, 0, -0.20148, 0, 0, 1, -0.0425781, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.370043, 0, 1, 0, -0.244575, 0, 0, 1, -0.0269072, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.413138, 0, 1, 0, -0.240658, 0, 0, 1, -0.0464958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.413138, 0, 1, 0, -0.228904, 0, 0, 1, -0.0504136, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.413138, 0, 1, 0, -0.217151, 0, 0, 1, -0.0464958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.393549, 0, 1, 0, -0.205398, 0, 0, 1, -0.0347426, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0883315, 0, 1, 0, 0.433192, 0, 0, 1, 0.00443468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.111473, 0, 1, 0, 0.433192, 0, 0, 1, 0.00443468, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00961179, 0, 1, 0, -0.334683, 0, 0, 1, -0.015154, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.382161, 0, 1, 0, -0.252411, 0, 0, 1, -0.0229894, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.421339, 0, 1, 0, -0.23674, 0, 0, 1, -0.0464958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.421339, 0, 1, 0, -0.221069, 0, 0, 1, -0.0504136, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.417421, 0, 1, 0, -0.209316, 0, 0, 1, -0.0543313, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409585, 0, 1, 0, -0.193645, 0, 0, 1, -0.0386604, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.385714, 0, 1, 0, -0.256329, 0, 0, 1, -0.0308249, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.424891, 0, 1, 0, -0.240658, 0, 0, 1, -0.0504136, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.424891, 0, 1, 0, -0.228904, 0, 0, 1, -0.0543313, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.424891, 0, 1, 0, -0.217151, 0, 0, 1, -0.0504136, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405303, 0, 1, 0, -0.20148, 0, 0, 1, -0.0386604, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0961669, 0, 1, 0, 0.48804, 0, 0, 1, 0.0749538, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.123226, 0, 1, 0, 0.48804, 0, 0, 1, 0.0749538, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_athlete_trim
            objectName: "zombie_athlete_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00961179, 0.0721953, -0.00835241)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0470128, 0)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0509305, 0.00391773)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.058766, 0.00391773)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0666014, 0.00391773)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0391773, 0.0117532)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0274241, 0.0509305, 0.00391773)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.058766, -0.0313418, 0.00783546)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.12145, -0.00783546, 0.00783546)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.144956, -0.00783546, 0.00783546)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0195886, 0.00783546, -0.00391773)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0195886, 0.0117532, 0)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.0156709, 0.00391772, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0509305, 0.00391772, 0.0117532)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0156709, 0, 0.00391773)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0117532, 0, 0.00391773)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0509305, -0.00391774, 0.0156709)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0156709, -0.00391772, 0.00391773)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0117532, -0.00391774, 0.00391773)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0470128, -0.0156709, 0.0195887)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0156709, -0.00391772, 0.00391773)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0117532, -0.00391774, 0.00391773)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0391773, -0.0274241, 0.0156709)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156709, -0.00391774, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117532, -0.00783546, -0.00391773)
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
                                position: Qt.vector3d(0.0274241, 0.0509305, 0.00391773)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.058766, -0.0313418, 0.00391773)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.113614, -0.00783546, 0.0117532)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.144956, -0.00783546, 0.00783546)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0156709, 0.0117532, 0)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0156709, 0.0117532, 0.00391773)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.0156709, 0.00391772, 0.00391773)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0470128, 0.00783546, 0.0156709)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0117532, 0, 0.00391773)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0117532, 0, 0.00391773)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0470128, -0.00391774, 0.0156709)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0117532, 0, 0.00783546)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0117532, 0, 0.00391773)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.043095, -0.0156709, 0.0156709)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0156709, 0, 0.00391773)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0117532, 0, 0.00391773)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0391773, -0.0274241, 0.00783546)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0117532, -0.00391774, 0.00391773)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117532, 0, 0)
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
                    position: Qt.vector3d(-0.0509305, -0.0235064, 0.00391773)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0195887, -0.238982, 0.00783546)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0274241, -0.242899, -0.00783546)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.00783546, -0.0548483, -0.0705192)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0548482, -0.0235064, 0.00391773)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0195887, -0.238982, 0.00783546)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0274241, -0.242899, -0.00783546)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0117532, -0.0548483, -0.0705192)
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
                qtmesh_gen3d_1_1790473583074_mesh_mat_material
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
