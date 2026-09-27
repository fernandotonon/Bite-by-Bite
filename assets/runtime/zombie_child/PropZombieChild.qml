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
        id: qtmesh_gen3d_1_1790472385523_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790472385523_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790472385523_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790472385523_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790472385523_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790472385523_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790472385523_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790472385523_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790472385523_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790472385523_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790472385523_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790472385523_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790472385523_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790472385523_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790472385523_normal_png_texture
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
            Qt.matrix4x4(1, 0, 0, -0.0179316, 0, 1, 0, 0.112629, 0, 0, 1, 0.0246377, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0179316, 0, 1, 0, 0.0577845, 0, 0, 1, 0.0207203, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0179316, 0, 1, 0, -0.0048945, 0, 0, 1, 0.0128854, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0179316, 0, 1, 0, -0.0793258, 0, 0, 1, 0.00896796, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0212428, 0, 1, 0, -0.157675, 0, 0, 1, 0.00505052, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.057106, 0, 1, 0, -0.157675, 0, 0, 1, 0.00505052, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.103509, 0, 1, 0, -0.145922, 0, 0, 1, 0.00505052, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.135455, 0, 1, 0, -0.145922, 0, 0, 1, 0.00505052, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.232785, 0, 1, 0, -0.14984, 0, 0, 1, 0.0128854, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.256895, 0, 1, 0, -0.14984, 0, 0, 1, 0.0128854, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.381647, 0, 1, 0, -0.153757, 0, 0, 1, 0.0207203, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397923, 0, 1, 0, -0.153757, 0, 0, 1, 0.0207203, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0329951, 0, 1, 0, 0.140051, 0, 0, 1, 0.0324726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0688583, 0, 1, 0, 0.140051, 0, 0, 1, 0.0324726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.3934, 0, 1, 0, -0.169427, 0, 0, 1, 0.0285552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.428656, 0, 1, 0, -0.177262, 0, 0, 1, 0.0246377, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.432574, 0, 1, 0, -0.161592, 0, 0, 1, 0.0324726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.436491, 0, 1, 0, -0.145922, 0, 0, 1, 0.03639, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.428656, 0, 1, 0, -0.130253, 0, 0, 1, 0.0403075, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405758, 0, 1, 0, -0.173344, 0, 0, 1, 0.0285552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.437098, 0, 1, 0, -0.181179, 0, 0, 1, 0.0207203, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.441015, 0, 1, 0, -0.165509, 0, 0, 1, 0.0324726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.441015, 0, 1, 0, -0.14984, 0, 0, 1, 0.0403075, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.437098, 0, 1, 0, -0.130253, 0, 0, 1, 0.0481424, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0643347, 0, 1, 0, 0.300666, 0, 0, 1, 0.0207203, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.100198, 0, 1, 0, 0.300666, 0, 0, 1, 0.0207203, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0179316, 0, 1, 0, -0.161592, 0, 0, 1, 0.00113308, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.401234, 0, 1, 0, -0.181179, 0, 0, 1, 0.0324726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.452161, 0, 1, 0, -0.185097, 0, 0, 1, 0.0285552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.456079, 0, 1, 0, -0.165509, 0, 0, 1, 0.03639, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.456079, 0, 1, 0, -0.145922, 0, 0, 1, 0.0442249, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448244, 0, 1, 0, -0.126335, 0, 0, 1, 0.0520598, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.409675, 0, 1, 0, -0.189014, 0, 0, 1, 0.0324726, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.456685, 0, 1, 0, -0.189014, 0, 0, 1, 0.0246377, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.46452, 0, 1, 0, -0.169427, 0, 0, 1, 0.03639, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.460602, 0, 1, 0, -0.145922, 0, 0, 1, 0.0442249, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452767, 0, 1, 0, -0.126335, 0, 0, 1, 0.0559772, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0839218, 0, 1, 0, 0.437776, 0, 0, 1, 0.0285552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.115868, 0, 1, 0, 0.437776, 0, 0, 1, 0.0285552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0179316, 0, 1, 0, -0.259528, 0, 0, 1, -0.00670179, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409069, 0, 1, 0, -0.200766, 0, 0, 1, 0.0403075, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.471748, 0, 1, 0, -0.192932, 0, 0, 1, 0.0285552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.479583, 0, 1, 0, -0.169427, 0, 0, 1, 0.0403075, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.475666, 0, 1, 0, -0.145922, 0, 0, 1, 0.0520598, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.463913, 0, 1, 0, -0.122418, 0, 0, 1, 0.0638121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.413593, 0, 1, 0, -0.208601, 0, 0, 1, 0.0403075, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.476272, 0, 1, 0, -0.196849, 0, 0, 1, 0.0285552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.484107, 0, 1, 0, -0.169427, 0, 0, 1, 0.0403075, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.480189, 0, 1, 0, -0.145922, 0, 0, 1, 0.0520598, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.468437, 0, 1, 0, -0.122418, 0, 0, 1, 0.0638121, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.111344, 0, 1, 0, 0.480868, 0, 0, 1, 0.134326, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.139372, 0, 1, 0, 0.480868, 0, 0, 1, 0.134326, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_child_trim
            objectName: "zombie_child_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.0179316, -0.112629, -0.0246377)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0548441, 0.00391744)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.062679, 0.00783488)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0744313, 0.00391744)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0822662, 0.00783488)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.097936, 0.00783488)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0391744, 0.0783488, 0.00391744)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0822662, -0.0117523, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.129275, 0.00391744, -0.00783488)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.148863, 0.00391744, -0.00783488)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0117523, 0.0156697, -0.00783488)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.00783488, 0.0117523, -0.00391744)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.00783488, 0.0195872, -0.00783488)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0470093, 0.0235046, -0.00391744)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0235046, 0.00783488, -0.00391744)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0195872, 0.00783487, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0509267, 0.00783487, -0.0117523)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0235046, 0.00391744, -0.00391744)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0235046, 0.00391744, -0.00391744)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0548441, -0.00783488, -0.0156698)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0195872, 0, -0.00783488)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0195872, 0, -0.00783488)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0470093, -0.0235046, -0.0195872)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0195872, -0.00391744, -0.0117523)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0156697, -0.00391743, -0.0117523)
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
                                position: Qt.vector3d(0.0391744, 0.0783488, 0.00391744)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0783488, -0.0117523, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.121441, 0.00391744, -0.00783488)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.141028, 0.00391744, -0.00783488)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.00783488, 0.0195872, -0.00783488)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.00391743, 0.0156697, -0.00391744)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.00391746, 0.0195872, -0.00783488)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0391744, 0.0274221, 0)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0195872, 0.00783487, -0.00391744)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0195872, 0.00783488, -0.00391744)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0430918, 0.0117523, -0.0117523)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0235046, 0.00391744, -0.00391744)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0195872, 0, -0.00391744)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0430918, -0.00391744, -0.0195872)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0195872, -0.00391744, -0.00391744)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0195872, 0, -0.00783488)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0391744, -0.0235046, -0.0274221)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0156698, -0.00391744, -0.00783488)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0156698, -0.00391743, -0.00783488)
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
                    position: Qt.vector3d(-0.0509267, -0.0274221, -0.00783488)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0313395, -0.160615, 0.0117523)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0195872, -0.13711, -0.00783488)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0274221, -0.0430918, -0.105771)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0509267, -0.0274221, -0.00783488)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0313395, -0.160615, 0.0117523)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0156698, -0.13711, -0.00783488)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0235046, -0.0430918, -0.105771)
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
                qtmesh_gen3d_1_1790472385523_mesh_mat_material
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
