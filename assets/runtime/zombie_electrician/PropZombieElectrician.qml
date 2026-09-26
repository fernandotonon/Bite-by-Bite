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
        id: qtmesh_gen3d_1_1790408666047_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790408666047_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790408666047_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790408666047_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790408666047_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790408666047_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790408666047_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790408666047_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790408666047_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790408666047_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790408666047_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790408666047_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790408666047_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790408666047_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790408666047_normal_png_texture
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
            joint_22,
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
            joint_23,
            joint_31,
            joint_34,
            joint_37,
            joint_40,
            joint_43,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00221435, 0, 1, 0, -0.036599, 0, 0, 1, -0.00508509, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00221435, 0, 1, 0, -0.0874924, 0, 0, 1, -0.00899996, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00221435, 0, 1, 0, -0.146215, 0, 0, 1, -0.0129148, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00221435, 0, 1, 0, -0.212768, 0, 0, 1, -0.0168297, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0251898, 0, 1, 0, -0.275406, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0296185, 0, 1, 0, -0.275406, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.079998, 0, 1, 0, -0.248002, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0844267, 0, 1, 0, -0.248002, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.181785, 0, 1, 0, -0.232343, 0, 0, 1, -0.0324892, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.186213, 0, 1, 0, -0.232343, 0, 0, 1, -0.0285743, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.291401, 0, 1, 0, -0.236258, 0, 0, 1, -0.0403189, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.29583, 0, 1, 0, -0.236258, 0, 0, 1, -0.0364041, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0525939, 0, 1, 0, -0.0131098, 0, 0, 1, -0.00508509, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0570226, 0, 1, 0, -0.0131098, 0, 0, 1, -0.00508509, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.307061, 0, 1, 0, -0.248002, 0, 0, 1, -0.0324892, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.33838, 0, 1, 0, -0.251917, 0, 0, 1, -0.0442338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.33838, 0, 1, 0, -0.240172, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.33838, 0, 1, 0, -0.228428, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.311489, 0, 1, 0, -0.248002, 0, 0, 1, -0.0285743, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.342808, 0, 1, 0, -0.251917, 0, 0, 1, -0.0442338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.346723, 0, 1, 0, -0.240172, 0, 0, 1, -0.0481487, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.346723, 0, 1, 0, -0.228428, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.338893, 0, 1, 0, -0.216683, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0643385, 0, 1, 0, 0.229612, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0687672, 0, 1, 0, 0.229612, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00221435, 0, 1, 0, -0.287151, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.318805, 0, 1, 0, -0.259747, 0, 0, 1, -0.0246594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.354039, 0, 1, 0, -0.251917, 0, 0, 1, -0.0481487, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.354039, 0, 1, 0, -0.240172, 0, 0, 1, -0.0559784, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.354039, 0, 1, 0, -0.228428, 0, 0, 1, -0.0559784, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.334465, 0, 1, 0, -0.220598, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.323234, 0, 1, 0, -0.259747, 0, 0, 1, -0.0207446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.358468, 0, 1, 0, -0.251917, 0, 0, 1, -0.0481487, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.358468, 0, 1, 0, -0.240172, 0, 0, 1, -0.0559784, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.358468, 0, 1, 0, -0.228428, 0, 0, 1, -0.0559784, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.350638, 0, 1, 0, -0.216683, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0839128, 0, 1, 0, 0.44493, 0, 0, 1, -0.0246594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0883415, 0, 1, 0, 0.44493, 0, 0, 1, -0.0246594, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00221435, 0, 1, 0, -0.322385, 0, 0, 1, -0.0168297, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.32272, 0, 1, 0, -0.275406, 0, 0, 1, -0.0168297, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.365784, 0, 1, 0, -0.251917, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.369699, 0, 1, 0, -0.240172, 0, 0, 1, -0.0598933, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.365784, 0, 1, 0, -0.224513, 0, 0, 1, -0.0598933, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.346209, 0, 1, 0, -0.216683, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.327149, 0, 1, 0, -0.275406, 0, 0, 1, -0.0129148, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.370212, 0, 1, 0, -0.251917, 0, 0, 1, -0.0520636, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.374127, 0, 1, 0, -0.240172, 0, 0, 1, -0.0598933, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.370212, 0, 1, 0, -0.224513, 0, 0, 1, -0.0598933, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.362383, 0, 1, 0, -0.212768, 0, 0, 1, -0.0559784, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0917426, 0, 1, 0, 0.495824, 0, 0, 1, 0.053638, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0961713, 0, 1, 0, 0.495824, 0, 0, 1, 0.053638, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_electrician_trim
            objectName: "zombie_electrician_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00221435, 0.036599, 0.00508509)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0508933, 0.00391487)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0587231, 0.00391487)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0665528, 0.00391487)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0743826, 0.00391487)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0352339, -0.00391487)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0274041, 0.062638, 0.00391487)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0548082, -0.0274041, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.101787, -0.0156595, 0.0117446)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.109616, 0.00391488, 0.00782974)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0156595, 0.0117446, -0.00782974)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0117446, 0.0117446, -0.00782974)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.00391486, 0.0156595, -0.00782974)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0469785, 0.0156595, 0.00391487)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0156595, 0, 0.00391487)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0117446, 0, 0.00391487)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0469785, 0.00391486, 0.0117446)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0156595, 0, 0.00391487)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0156595, 0, 0.00391487)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0469785, -0.00782976, 0.0117446)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0156595, 0, 0.00391487)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0117446, -0.00391486, 0.00391487)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0430636, -0.0156595, 0.0117446)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0117446, -0.00391486, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117446, -0.00391488, 0.00391487)
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
                                position: Qt.vector3d(0.0274041, 0.062638, 0.00391487)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0548082, -0.0274041, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.101787, -0.0156595, 0.00782975)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.109616, 0.00391488, 0.00782974)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0156595, 0.0117446, -0.00782974)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0117446, 0.0117446, -0.00782975)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.00391489, 0.0156595, -0.00782974)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0469785, 0.0156595, 0.00782974)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0156595, 0, 0.00391487)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0117446, 0, 0.00391487)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0508933, 0.00391486, 0.0117446)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0117446, 0, 0.00782974)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0156595, 0, 0.00391487)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0508933, -0.00782976, 0.0156595)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0117446, 0, 0.00391487)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0117446, -0.00391486, 0.00391487)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0430636, -0.0195744, 0.0156595)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0117446, 0, 0)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117446, -0.00391488, 0.00391487)
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
                    position: Qt.vector3d(-0.0548082, -0.0234892, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0117446, -0.242722, 0.0156595)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0195744, -0.215318, 0.00391487)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.00782974, -0.0508933, -0.0782975)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0548082, -0.0234892, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0117446, -0.242722, 0.0156595)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0195744, -0.215318, 0.00391487)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.00782974, -0.0508933, -0.0782975)
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
                qtmesh_gen3d_1_1790408666047_mesh_mat_material
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
