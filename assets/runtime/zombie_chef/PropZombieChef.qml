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
        id: qtmesh_gen3d_1_1790471727793_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790471727793_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790471727793_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790471727793_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790471727793_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790471727793_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790471727793_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790471727793_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790471727793_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790471727793_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790471727793_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790471727793_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790471727793_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790471727793_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790471727793_normal_png_texture
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
            joint_31,
            leftUpLeg,
            rightUpLeg,
            joint_11,
            joint_15,
            joint_32,
            joint_36,
            joint_40,
            joint_44,
            leftLeg,
            rightLeg,
            spine3,
            joint_12,
            joint_16,
            joint_19,
            joint_22,
            joint_25,
            joint_33,
            joint_37,
            joint_41,
            joint_45,
            joint_48,
            leftFoot,
            rightFoot,
            neck,
            joint_13,
            joint_17,
            joint_20,
            joint_23,
            joint_26,
            joint_34,
            joint_38,
            joint_42,
            joint_46,
            joint_49,
            joint_54,
            joint_59,
            head,
            joint_14,
            joint_18,
            joint_21,
            joint_24,
            joint_27,
            joint_35,
            joint_39,
            joint_43,
            joint_47,
            joint_50,
            joint_55,
            joint_60
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00195546, 0, 1, 0, 0.00201431, 0, 0, 1, 0.00687344, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00195546, 0, 1, 0, -0.045013, 0, 0, 1, 0.00687344, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00195546, 0, 1, 0, -0.0959592, 0, 0, 1, 0.00687344, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00195546, 0, 1, 0, -0.158662, 0, 0, 1, 0.0029545, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0254771, 0, 1, 0, -0.213527, 0, 0, 1, 0.0029545, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.029388, 0, 1, 0, -0.213527, 0, 0, 1, 0.0029545, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0803423, 0, 1, 0, -0.186095, 0, 0, 1, 0.0029545, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0842532, 0, 1, 0, -0.186095, 0, 0, 1, 0.0029545, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.190073, 0, 1, 0, -0.170419, 0, 0, 1, 0.0029545, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.193984, 0, 1, 0, -0.170419, 0, 0, 1, 0.00687344, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.319398, 0, 1, 0, -0.170419, 0, 0, 1, 0.0147113, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.323309, 0, 1, 0, -0.170419, 0, 0, 1, 0.0147113, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0529097, 0, 1, 0, 0.0294469, 0, 0, 1, 0.00687344, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0568206, 0, 1, 0, 0.0294469, 0, 0, 1, 0.00687344, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.335073, 0, 1, 0, -0.186095, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.374263, 0, 1, 0, -0.186095, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.338984, 0, 1, 0, -0.186095, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.378174, 0, 1, 0, -0.186095, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.378174, 0, 1, 0, -0.174338, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.378174, 0, 1, 0, -0.162581, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0568286, 0, 1, 0, 0.237151, 0, 0, 1, -0.0166402, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0607396, 0, 1, 0, 0.237151, 0, 0, 1, -0.0166402, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00195546, 0, 1, 0, -0.225284, 0, 0, 1, 0.0029545, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.34683, 0, 1, 0, -0.197852, 0, 0, 1, 0.0264681, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.389939, 0, 1, 0, -0.190014, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.374263, 0, 1, 0, -0.174338, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.374263, 0, 1, 0, -0.162581, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.370344, 0, 1, 0, -0.150824, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.350741, 0, 1, 0, -0.197852, 0, 0, 1, 0.0264681, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.393849, 0, 1, 0, -0.190014, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.393849, 0, 1, 0, -0.174338, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.393849, 0, 1, 0, -0.158662, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.374255, 0, 1, 0, -0.150824, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0764233, 0, 1, 0, 0.444854, 0, 0, 1, -0.0362349, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0803343, 0, 1, 0, 0.444854, 0, 0, 1, -0.0362349, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00195546, 0, 1, 0, -0.280149, 0, 0, 1, -0.000964441, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.358587, 0, 1, 0, -0.209608, 0, 0, 1, 0.034306, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.401695, 0, 1, 0, -0.193933, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.389939, 0, 1, 0, -0.174338, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.389939, 0, 1, 0, -0.158662, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.382101, 0, 1, 0, -0.142986, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.362498, 0, 1, 0, -0.209608, 0, 0, 1, 0.034306, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405606, 0, 1, 0, -0.193933, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.409525, 0, 1, 0, -0.174338, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.409525, 0, 1, 0, -0.158662, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.386012, 0, 1, 0, -0.142986, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0881802, 0, 1, 0, 0.487963, 0, 0, 1, 0.0499818, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0920911, 0, 1, 0, 0.487963, 0, 0, 1, 0.0499818, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00195546, 0, 1, 0, -0.472177, 0, 0, 1, -0.0362349, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.366425, 0, 1, 0, -0.221365, 0, 0, 1, 0.038225, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.413452, 0, 1, 0, -0.193933, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.405614, 0, 1, 0, -0.174338, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.405614, 0, 1, 0, -0.158662, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393857, 0, 1, 0, -0.139068, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.370336, 0, 1, 0, -0.221365, 0, 0, 1, 0.038225, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417363, 0, 1, 0, -0.193933, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.421282, 0, 1, 0, -0.174338, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.421282, 0, 1, 0, -0.158662, 0, 0, 1, 0.0186303, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397768, 0, 1, 0, -0.139068, 0, 0, 1, 0.0225492, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0920991, 0, 1, 0, 0.484044, 0, 0, 1, 0.0813333, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.09601, 0, 1, 0, 0.484044, 0, 0, 1, 0.0813333, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_chef_trim
            objectName: "zombie_chef_trim"
            Node {
                id: hips
                objectName: "Hips"
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0470273, 0)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0509462, 0)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.062703, 0.00391894)
                            Node {
                                id: spine3
                                objectName: "Spine3"
                                position: Qt.vector3d(0, 0.066622, 0)
                                Node {
                                    id: neck
                                    objectName: "Neck"
                                    position: Qt.vector3d(0, 0.0548651, 0.00391894)
                                    Node {
                                        id: head
                                        objectName: "Head"
                                        position: Qt.vector3d(0, 0.192028, 0.0352705)
                                    }
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0274326, 0.0548652, 0)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0548652, -0.0274326, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.10973, -0.0156758, 0)
                                        Node {
                                            id: joint_10
                                            objectName: "joint_10"
                                            position: Qt.vector3d(-0.129325, 0, -0.0117568)
                                            Node {
                                                id: joint_11
                                                objectName: "joint_11"
                                                position: Qt.vector3d(-0.0156758, 0.0156758, -0.00783788)
                                                Node {
                                                    id: joint_12
                                                    objectName: "joint_12"
                                                    position: Qt.vector3d(-0.0117568, 0.0117568, -0.00391894)
                                                    Node {
                                                        id: joint_13
                                                        objectName: "joint_13"
                                                        position: Qt.vector3d(-0.0117568, 0.0117568, -0.00783788)
                                                        Node {
                                                            id: joint_14
                                                            objectName: "joint_14"
                                                            position: Qt.vector3d(-0.00783789, 0.0117568, -0.00391894)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_15
                                                objectName: "joint_15"
                                                position: Qt.vector3d(-0.0548652, 0.0156758, -0.00391894)
                                                Node {
                                                    id: joint_16
                                                    objectName: "joint_16"
                                                    position: Qt.vector3d(-0.0156758, 0.00391893, -0.00391894)
                                                    Node {
                                                        id: joint_17
                                                        objectName: "joint_17"
                                                        position: Qt.vector3d(-0.0117568, 0.00391895, 0)
                                                        Node {
                                                            id: joint_18
                                                            objectName: "joint_18"
                                                            position: Qt.vector3d(-0.0117568, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0548652, 0.00391895, -0.00391894)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0156758, 0, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156758, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0548652, -0.00783788, -0.00391894)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156758, -0.00391893, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0156758, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_25
                                                objectName: "joint_25"
                                                position: Qt.vector3d(-0.0509462, -0.0195947, -0.00391894)
                                                Node {
                                                    id: joint_26
                                                    objectName: "joint_26"
                                                    position: Qt.vector3d(-0.0117568, -0.00783788, 0)
                                                    Node {
                                                        id: joint_27
                                                        objectName: "joint_27"
                                                        position: Qt.vector3d(-0.0117568, -0.00391893, -0.00391894)
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
                                position: Qt.vector3d(0.0274326, 0.0548652, 0)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0548652, -0.0274326, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.10973, -0.0156758, -0.00391894)
                                        Node {
                                            id: joint_31
                                            objectName: "joint_31"
                                            position: Qt.vector3d(0.129325, 0, -0.00783788)
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0156758, 0.0156758, -0.00783788)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0117568, 0.0117568, -0.00391894)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0117568, 0.0117568, -0.00783788)
                                                        Node {
                                                            id: joint_35
                                                            objectName: "joint_35"
                                                            position: Qt.vector3d(0.00783786, 0.0117568, -0.00391894)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_36
                                                objectName: "joint_36"
                                                position: Qt.vector3d(0.0548652, 0.0156758, -0.00391894)
                                                Node {
                                                    id: joint_37
                                                    objectName: "joint_37"
                                                    position: Qt.vector3d(0.0156758, 0.00391893, -0.00391894)
                                                    Node {
                                                        id: joint_38
                                                        objectName: "joint_38"
                                                        position: Qt.vector3d(0.0117568, 0.00391895, 0)
                                                        Node {
                                                            id: joint_39
                                                            objectName: "joint_39"
                                                            position: Qt.vector3d(0.0117568, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_40
                                                objectName: "joint_40"
                                                position: Qt.vector3d(0.0548652, 0.00391895, -0.00391894)
                                                Node {
                                                    id: joint_41
                                                    objectName: "joint_41"
                                                    position: Qt.vector3d(0.0156758, 0, 0)
                                                    Node {
                                                        id: joint_42
                                                        objectName: "joint_42"
                                                        position: Qt.vector3d(0.0156758, 0, 0)
                                                        Node {
                                                            id: joint_43
                                                            objectName: "joint_43"
                                                            position: Qt.vector3d(0.0117568, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_44
                                                objectName: "joint_44"
                                                position: Qt.vector3d(0.0548652, -0.00783788, -0.00391894)
                                                Node {
                                                    id: joint_45
                                                    objectName: "joint_45"
                                                    position: Qt.vector3d(0.0156758, -0.00391893, 0)
                                                    Node {
                                                        id: joint_46
                                                        objectName: "joint_46"
                                                        position: Qt.vector3d(0.0156758, 0, 0)
                                                        Node {
                                                            id: joint_47
                                                            objectName: "joint_47"
                                                            position: Qt.vector3d(0.0117568, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_48
                                                objectName: "joint_48"
                                                position: Qt.vector3d(0.0509462, -0.0195947, -0.00391894)
                                                Node {
                                                    id: joint_49
                                                    objectName: "joint_49"
                                                    position: Qt.vector3d(0.0117568, -0.00783788, 0)
                                                    Node {
                                                        id: joint_50
                                                        objectName: "joint_50"
                                                        position: Qt.vector3d(0.0117568, -0.00391893, -0.00391894)
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
                    position: Qt.vector3d(-0.0548652, -0.0274326, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.00391894, -0.207704, 0.0235136)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0195947, -0.207704, 0.0195947)
                            Node {
                                id: joint_54
                                objectName: "joint_54"
                                position: Qt.vector3d(-0.0117568, -0.0431083, -0.0862167)
                                Node {
                                    id: joint_55
                                    objectName: "joint_55"
                                    position: Qt.vector3d(-0.00391894, 0.00391895, -0.0313515)
                                }
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0548652, -0.0274326, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.00391894, -0.207704, 0.0235136)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0195947, -0.207704, 0.0195947)
                            Node {
                                id: joint_59
                                objectName: "joint_59"
                                position: Qt.vector3d(0.0117568, -0.0431083, -0.0862167)
                                Node {
                                    id: joint_60
                                    objectName: "joint_60"
                                    position: Qt.vector3d(0.00391894, 0.00391895, -0.0313515)
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
                qtmesh_gen3d_1_1790471727793_mesh_mat_material
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
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_0.qad"
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
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_0.qad"
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
                value: Qt.vector3d(0.00195546, -0.00201431, -0.00687344)
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
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_1.qad"
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
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_1.qad"
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
                value: Qt.vector3d(0.00195546, -0.00201431, -0.00687344)
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
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_2.qad"
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
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_2.qad"
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
                value: Qt.vector3d(0.00195546, -0.00201431, -0.00687344)
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
            target: leftUpLeg
            property: "rotation"
            keyframeSource: "animations/leftUpLeg_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_3.qad"
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
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            keyframeSource: "animations/rightArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_3.qad"
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
                value: Qt.vector3d(0.00195546, -0.00201431, -0.00687344)
            }
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_3.qad"
        }
    }
}
