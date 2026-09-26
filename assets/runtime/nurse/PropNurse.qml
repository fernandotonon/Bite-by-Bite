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
        id: qtmesh_gen3d_1_1790411326108_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790411326108_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790411326108_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790411326108_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790411326108_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790411326108_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790411326108_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790411326108_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790411326108_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790411326108_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790411326108_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790411326108_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790411326108_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790411326108_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790411326108_normal_png_texture
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
            joint_10,
            joint_33,
            leftUpLeg,
            rightUpLeg,
            joint_11,
            joint_15,
            joint_19,
            joint_26,
            joint_34,
            joint_38,
            joint_42,
            joint_46,
            joint_50,
            leftLeg,
            rightLeg,
            spine3,
            joint_12,
            joint_16,
            joint_20,
            joint_23,
            joint_27,
            joint_35,
            joint_39,
            joint_43,
            joint_47,
            joint_51,
            leftFoot,
            rightFoot,
            neck,
            joint_13,
            joint_17,
            joint_21,
            joint_24,
            joint_28,
            joint_36,
            joint_40,
            joint_44,
            joint_48,
            joint_52,
            joint_57,
            joint_62,
            head,
            joint_14,
            joint_18,
            joint_22,
            joint_25,
            joint_29,
            joint_37,
            joint_41,
            joint_45,
            joint_49,
            joint_53,
            joint_58,
            joint_63
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00191069, 0, 1, 0, -0.00614356, 0, 0, 1, -0.00981971, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00191069, 0, 1, 0, -0.0570102, 0, 0, 1, -0.0137325, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00191069, 0, 1, 0, -0.119615, 0, 0, 1, -0.0176453, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00191069, 0, 1, 0, -0.190046, 0, 0, 1, -0.0215582, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0293918, 0, 1, 0, -0.256564, 0, 0, 1, -0.025471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0332132, 0, 1, 0, -0.256564, 0, 0, 1, -0.025471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0880841, 0, 1, 0, -0.221348, 0, 0, 1, -0.025471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0919055, 0, 1, 0, -0.221348, 0, 0, 1, -0.025471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.201556, 0, 1, 0, -0.213523, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.205377, 0, 1, 0, -0.213523, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.330679, 0, 1, 0, -0.213523, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.3345, 0, 1, 0, -0.213523, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0489559, 0, 1, 0, 0.025159, 0, 0, 1, -0.00981971, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0527773, 0, 1, 0, 0.025159, 0, 0, 1, -0.00981971, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.34633, 0, 1, 0, -0.229174, 0, 0, 1, -0.0293838, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377633, 0, 1, 0, -0.233087, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377633, 0, 1, 0, -0.221348, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.37372, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.350151, 0, 1, 0, -0.229174, 0, 0, 1, -0.0293838, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.381454, 0, 1, 0, -0.233087, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.381454, 0, 1, 0, -0.221348, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.381454, 0, 1, 0, -0.20961, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.377541, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0646072, 0, 1, 0, 0.240364, 0, 0, 1, -0.0176453, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.080167, 0, 1, 0, 0.240364, 0, 0, 1, -0.0176453, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00191069, 0, 1, 0, -0.268302, 0, 0, 1, -0.025471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.358068, 0, 1, 0, -0.240913, 0, 0, 1, -0.025471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393284, 0, 1, 0, -0.237, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.397197, 0, 1, 0, -0.225261, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377633, 0, 1, 0, -0.20961, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.389371, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.36189, 0, 1, 0, -0.240913, 0, 0, 1, -0.025471, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397105, 0, 1, 0, -0.237, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.401018, 0, 1, 0, -0.225261, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397105, 0, 1, 0, -0.20961, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.393192, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0802585, 0, 1, 0, 0.439918, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0958183, 0, 1, 0, 0.439918, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00191069, 0, 1, 0, -0.30743, 0, 0, 1, -0.0215582, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.365894, 0, 1, 0, -0.256564, 0, 0, 1, -0.0215582, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.408935, 0, 1, 0, -0.237, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.412848, 0, 1, 0, -0.229174, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393284, 0, 1, 0, -0.20961, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.401109, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.369715, 0, 1, 0, -0.256564, 0, 0, 1, -0.0215582, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.412756, 0, 1, 0, -0.237, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.416669, 0, 1, 0, -0.225261, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.412756, 0, 1, 0, -0.20961, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.404931, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0880841, 0, 1, 0, 0.49861, 0, 0, 1, 0.0293085, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0919055, 0, 1, 0, 0.49861, 0, 0, 1, 0.0332213, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00191069, 0, 1, 0, -0.479594, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.37372, 0, 1, 0, -0.268302, 0, 0, 1, -0.0215582, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.420674, 0, 1, 0, -0.237, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.424586, 0, 1, 0, -0.229174, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.408935, 0, 1, 0, -0.20961, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.408935, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.377541, 0, 1, 0, -0.268302, 0, 0, 1, -0.0215582, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.424495, 0, 1, 0, -0.237, 0, 0, 1, -0.0372094, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.428408, 0, 1, 0, -0.225261, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.424495, 0, 1, 0, -0.20961, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.412756, 0, 1, 0, -0.197872, 0, 0, 1, -0.0411222, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0919969, 0, 1, 0, 0.49861, 0, 0, 1, 0.0684366, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0958183, 0, 1, 0, 0.49861, 0, 0, 1, 0.0762623, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: nurse_trim
            objectName: "nurse_trim"
            Node {
                id: hips
                objectName: "Hips"
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0508666, 0.00391282)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0626051, 0.00391282)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0704307, 0.00391282)
                            Node {
                                id: spine3
                                objectName: "Spine3"
                                position: Qt.vector3d(0, 0.0782563, 0.00391282)
                                Node {
                                    id: neck
                                    objectName: "Neck"
                                    position: Qt.vector3d(0, 0.0391282, -0.00391282)
                                    Node {
                                        id: head
                                        objectName: "Head"
                                        position: Qt.vector3d(0, 0.172164, 0.0195641)
                                    }
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0313025, 0.0665179, 0.00391282)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0586923, -0.0352153, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.113472, -0.00782564, 0.0117385)
                                        Node {
                                            id: joint_10
                                            objectName: "joint_10"
                                            position: Qt.vector3d(-0.129123, 0, 0)
                                            Node {
                                                id: joint_11
                                                objectName: "joint_11"
                                                position: Qt.vector3d(-0.0156513, 0.0156513, -0.00782564)
                                                Node {
                                                    id: joint_12
                                                    objectName: "joint_12"
                                                    position: Qt.vector3d(-0.0117384, 0.0117384, -0.00391282)
                                                    Node {
                                                        id: joint_13
                                                        objectName: "joint_13"
                                                        position: Qt.vector3d(-0.00782564, 0.0156513, -0.00391282)
                                                        Node {
                                                            id: joint_14
                                                            objectName: "joint_14"
                                                            position: Qt.vector3d(-0.00782564, 0.0117384, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_15
                                                objectName: "joint_15"
                                                position: Qt.vector3d(-0.0469538, 0.0195641, 0)
                                                Node {
                                                    id: joint_16
                                                    objectName: "joint_16"
                                                    position: Qt.vector3d(-0.0156513, 0.00391282, 0)
                                                    Node {
                                                        id: joint_17
                                                        objectName: "joint_17"
                                                        position: Qt.vector3d(-0.0156513, 0, 0)
                                                        Node {
                                                            id: joint_18
                                                            objectName: "joint_18"
                                                            position: Qt.vector3d(-0.0117384, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0469538, 0.00782564, 0.00391282)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0195641, 0.00391281, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156513, 0.00391282, 0)
                                                        Node {
                                                            id: joint_22
                                                            objectName: "joint_22"
                                                            position: Qt.vector3d(-0.0117384, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_23
                                                objectName: "joint_23"
                                                position: Qt.vector3d(-0.0469538, -0.00391281, 0.00391282)
                                                Node {
                                                    id: joint_24
                                                    objectName: "joint_24"
                                                    position: Qt.vector3d(-0.0156513, 0, 0)
                                                    Node {
                                                        id: joint_25
                                                        objectName: "joint_25"
                                                        position: Qt.vector3d(-0.0156513, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_26
                                                objectName: "joint_26"
                                                position: Qt.vector3d(-0.043041, -0.0156513, 0.00391282)
                                                Node {
                                                    id: joint_27
                                                    objectName: "joint_27"
                                                    position: Qt.vector3d(-0.0156513, 0, 0)
                                                    Node {
                                                        id: joint_28
                                                        objectName: "joint_28"
                                                        position: Qt.vector3d(-0.0117384, 0, 0)
                                                        Node {
                                                            id: joint_29
                                                            objectName: "joint_29"
                                                        }
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
                                position: Qt.vector3d(0.0313025, 0.0665179, 0.00391282)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0586923, -0.0352153, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.113472, -0.00782564, 0.0117385)
                                        Node {
                                            id: joint_33
                                            objectName: "joint_33"
                                            position: Qt.vector3d(0.129123, 0, 0)
                                            Node {
                                                id: joint_34
                                                objectName: "joint_34"
                                                position: Qt.vector3d(0.0156513, 0.0156513, -0.00782564)
                                                Node {
                                                    id: joint_35
                                                    objectName: "joint_35"
                                                    position: Qt.vector3d(0.0117385, 0.0117384, -0.00391282)
                                                    Node {
                                                        id: joint_36
                                                        objectName: "joint_36"
                                                        position: Qt.vector3d(0.00782561, 0.0156513, -0.00391282)
                                                        Node {
                                                            id: joint_37
                                                            objectName: "joint_37"
                                                            position: Qt.vector3d(0.00782564, 0.0117384, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0469538, 0.0195641, 0)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0156513, 0.00391282, 0)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0156513, 0, 0)
                                                        Node {
                                                            id: joint_41
                                                            objectName: "joint_41"
                                                            position: Qt.vector3d(0.0117384, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_42
                                                objectName: "joint_42"
                                                position: Qt.vector3d(0.0469538, 0.00782564, 0.00391282)
                                                Node {
                                                    id: joint_43
                                                    objectName: "joint_43"
                                                    position: Qt.vector3d(0.0195641, 0.00391281, 0)
                                                    Node {
                                                        id: joint_44
                                                        objectName: "joint_44"
                                                        position: Qt.vector3d(0.0156513, 0, 0)
                                                        Node {
                                                            id: joint_45
                                                            objectName: "joint_45"
                                                            position: Qt.vector3d(0.0117384, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_46
                                                objectName: "joint_46"
                                                position: Qt.vector3d(0.0469538, -0.00391281, 0.00391282)
                                                Node {
                                                    id: joint_47
                                                    objectName: "joint_47"
                                                    position: Qt.vector3d(0.0156513, 0, 0)
                                                    Node {
                                                        id: joint_48
                                                        objectName: "joint_48"
                                                        position: Qt.vector3d(0.0156513, 0, 0)
                                                        Node {
                                                            id: joint_49
                                                            objectName: "joint_49"
                                                            position: Qt.vector3d(0.0117384, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_50
                                                objectName: "joint_50"
                                                position: Qt.vector3d(0.043041, -0.0156513, 0.00391282)
                                                Node {
                                                    id: joint_51
                                                    objectName: "joint_51"
                                                    position: Qt.vector3d(0.0156513, 0, 0)
                                                    Node {
                                                        id: joint_52
                                                        objectName: "joint_52"
                                                        position: Qt.vector3d(0.0117384, 0, 0)
                                                        Node {
                                                            id: joint_53
                                                            objectName: "joint_53"
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
                }
                Node {
                    id: leftUpLeg
                    objectName: "LeftUpLeg"
                    position: Qt.vector3d(-0.0508666, -0.0313025, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0156513, -0.215205, 0.00782563)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0156513, -0.199554, 0.0234769)
                            Node {
                                id: joint_57
                                objectName: "joint_57"
                                position: Qt.vector3d(-0.00782564, -0.0586922, -0.0704307)
                                Node {
                                    id: joint_58
                                    objectName: "joint_58"
                                    position: Qt.vector3d(-0.00391281, 0, -0.0391282)
                                }
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0508666, -0.0313025, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0273897, -0.215205, 0.00782563)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0156513, -0.199554, 0.0195641)
                            Node {
                                id: joint_62
                                objectName: "joint_62"
                                position: Qt.vector3d(-0.00391281, -0.0586922, -0.0704307)
                                Node {
                                    id: joint_63
                                    objectName: "joint_63"
                                    position: Qt.vector3d(0.00391281, 0, -0.043041)
                                }
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
                qtmesh_gen3d_1_1790411326108_mesh_mat_material
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
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: hips
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00191069, 0.00614356, 0.00981971)
            }
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_0.qad"
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
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_1.qad"
        }
        KeyframeGroup {
            target: hips
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00191069, 0.00614356, 0.00981971)
            }
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_1.qad"
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
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_2.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_2.qad"
        }
        KeyframeGroup {
            target: hips
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00191069, 0.00614356, 0.00981971)
            }
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_2.qad"
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
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_3.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightHand
            property: "rotation"
            keyframeSource: "animations/rightHand_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_3.qad"
        }
        KeyframeGroup {
            target: hips
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00191069, 0.00614356, 0.00981971)
            }
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_3.qad"
        }
    }
}
