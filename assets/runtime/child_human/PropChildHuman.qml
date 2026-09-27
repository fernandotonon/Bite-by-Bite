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
        id: qtmesh_gen3d_1_1790475717480_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790475717480_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790475717480_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790475717480_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790475717480_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790475717480_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790475717480_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790475717480_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790475717480_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790475717480_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790475717480_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790475717480_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790475717480_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790475717480_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790475717480_normal_png_texture
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
            Qt.matrix4x4(1, 0, 0, -0.00207183, 0, 1, 0, 0.0554, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00207183, 0, 1, 0, 0.00443415, 0, 0, 1, 0.017782, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00207183, 0, 1, 0, -0.0543726, 0, 0, 1, 0.0138616, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00207183, 0, 1, 0, -0.124941, 0, 0, 1, 0.00994111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0371326, 0, 1, 0, -0.187668, 0, 0, 1, 0.00210021, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0412763, 0, 1, 0, -0.187668, 0, 0, 1, 0.00210021, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.111621, 0, 1, 0, -0.164145, 0, 0, 1, 0.00210021, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.115765, 0, 1, 0, -0.164145, 0, 0, 1, 0.00210021, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.233155, 0, 1, 0, -0.152384, 0, 0, 1, 0.00602066, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.237299, 0, 1, 0, -0.152384, 0, 0, 1, 0.00994111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.378212, 0, 1, 0, -0.160225, 0, 0, 1, 0.017782, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.382355, 0, 1, 0, -0.160225, 0, 0, 1, 0.017782, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.048894, 0, 1, 0, 0.0828431, 0, 0, 1, 0.0373842, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0530377, 0, 1, 0, 0.0828431, 0, 0, 1, 0.0373842, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.397814, 0, 1, 0, -0.175906, 0, 0, 1, 0.0217025, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.437018, 0, 1, 0, -0.171986, 0, 0, 1, 0.0217025, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440939, 0, 1, 0, -0.160225, 0, 0, 1, 0.0217025, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440939, 0, 1, 0, -0.148463, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.433098, 0, 1, 0, -0.136702, 0, 0, 1, 0.0334638, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.401958, 0, 1, 0, -0.175906, 0, 0, 1, 0.0217025, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.441162, 0, 1, 0, -0.175906, 0, 0, 1, 0.0217025, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.445082, 0, 1, 0, -0.164145, 0, 0, 1, 0.0217025, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.445082, 0, 1, 0, -0.148463, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.437242, 0, 1, 0, -0.136702, 0, 0, 1, 0.0334638, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0684962, 0, 1, 0, 0.259263, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0726399, 0, 1, 0, 0.259263, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00207183, 0, 1, 0, -0.199429, 0, 0, 1, 0.00210021, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.413496, 0, 1, 0, -0.187668, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.456621, 0, 1, 0, -0.179827, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464461, 0, 1, 0, -0.164145, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460541, 0, 1, 0, -0.148463, 0, 0, 1, 0.0334638, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.4527, 0, 1, 0, -0.132782, 0, 0, 1, 0.0413047, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417639, 0, 1, 0, -0.187668, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.460764, 0, 1, 0, -0.179827, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.468605, 0, 1, 0, -0.164145, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.464685, 0, 1, 0, -0.148463, 0, 0, 1, 0.0334638, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.456844, 0, 1, 0, -0.132782, 0, 0, 1, 0.0413047, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0959394, 0, 1, 0, 0.40824, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.100083, 0, 1, 0, 0.40824, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00207183, 0, 1, 0, -0.250395, 0, 0, 1, 0.00994111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.425257, 0, 1, 0, -0.20727, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.476223, 0, 1, 0, -0.183747, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.484064, 0, 1, 0, -0.168066, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.480143, 0, 1, 0, -0.148463, 0, 0, 1, 0.0373842, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468382, 0, 1, 0, -0.132782, 0, 0, 1, 0.053066, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.429401, 0, 1, 0, -0.20727, 0, 0, 1, 0.0256229, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.480366, 0, 1, 0, -0.183747, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.488207, 0, 1, 0, -0.168066, 0, 0, 1, 0.0295433, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.484287, 0, 1, 0, -0.148463, 0, 0, 1, 0.0413047, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.472526, 0, 1, 0, -0.132782, 0, 0, 1, 0.053066, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.119462, 0, 1, 0, 0.467047, 0, 0, 1, 0.131475, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.123606, 0, 1, 0, 0.467047, 0, 0, 1, 0.131475, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: child_human_trim
            objectName: "child_human_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00207183, -0.0554, -0.0256229)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0509658, 0.00784089)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0588067, 0.00392045)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0705681, 0.00392045)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0744885, 0.0078409)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0509658, -0.0078409)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0392045, 0.0627272, 0.0078409)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0744885, -0.0235227, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.121534, -0.0117613, -0.00392045)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.145057, 0.0078409, -0.0117613)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0196022, 0.0156818, -0.00392045)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0156818, 0.0117613, -0.00392045)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.0117613, 0.0196022, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0588067, 0.0117613, -0.00392045)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0196022, 0.0078409, -0.00392045)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0196022, 0.00392044, -0.00392045)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0627272, 0, -0.00392045)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0235227, 0.00392044, -0.00392045)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0196022, 0.00392045, -0.00392045)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0627272, -0.0117614, -0.0117613)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0196022, 0, -0.00392045)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0196022, 0, -0.00392045)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0548863, -0.0235227, -0.0156818)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0196022, -0.00392045, -0.00784089)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0156818, 0, -0.0117613)
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
                                position: Qt.vector3d(0.0392045, 0.0627272, 0.0078409)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0744885, -0.0235227, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.121534, -0.0117613, -0.0078409)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.145057, 0.0078409, -0.0078409)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0196022, 0.0156818, -0.00392045)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0156818, 0.0117613, -0.00392045)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.0117614, 0.0196022, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0588067, 0.0156818, -0.00392045)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0196022, 0.00392045, -0.00392045)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0196022, 0.00392044, -0.00392045)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0627272, 0.00392044, -0.00392045)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0235227, 0, -0.00392045)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0196022, 0.00392045, -0.00392045)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0627272, -0.0117614, -0.0117613)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0196022, 0, -0.00392045)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0196022, 0, -0.00784089)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0548863, -0.0235227, -0.0156818)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0196022, -0.00392045, -0.00784089)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0156818, 0, -0.0117613)
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
                    position: Qt.vector3d(-0.0509658, -0.0274431, -0.0117613)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0196022, -0.17642, 0.0117613)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0274431, -0.148977, -0.00392045)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0235227, -0.0588067, -0.101932)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0509658, -0.0274431, -0.0117613)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0196022, -0.17642, 0.0117613)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0274431, -0.148977, -0.00392045)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0235227, -0.0588067, -0.101932)
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
                qtmesh_gen3d_1_1790475717480_mesh_mat_material
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
