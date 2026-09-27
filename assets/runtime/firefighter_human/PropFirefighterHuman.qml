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
        id: qtmesh_gen3d_1_1790477372420_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790477372420_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790477372420_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790477372420_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790477372420_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790477372420_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790477372420_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790477372420_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790477372420_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790477372420_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790477372420_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790477372420_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790477372420_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790477372420_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790477372420_normal_png_texture
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            hips,
            spine,
            spine1,
            spine2,
            rightArm,
            leftArm,
            rightForeArm,
            leftForeArm,
            rightHand,
            leftHand,
            joint_30,
            joint_10,
            joint_31,
            joint_35,
            joint_45,
            leftUpLeg,
            rightUpLeg,
            spine3,
            joint_11,
            joint_15,
            joint_18,
            joint_21,
            joint_24,
            joint_32,
            joint_36,
            joint_39,
            joint_42,
            joint_46,
            leftLeg,
            rightLeg,
            neck,
            joint_12,
            joint_16,
            joint_19,
            joint_22,
            joint_25,
            joint_33,
            joint_37,
            joint_40,
            joint_43,
            joint_47,
            leftFoot,
            rightFoot,
            head,
            joint_13,
            joint_17,
            joint_20,
            joint_23,
            joint_26,
            joint_34,
            joint_38,
            joint_41,
            joint_44,
            joint_48,
            joint_52,
            joint_56
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.0019538, 0, 1, 0, 0.0406302, 0, 0, 1, -0.00770964, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0019538, 0, 1, 0, -0.0102537, 0, 0, 1, -0.00770964, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0019538, 0, 1, 0, -0.0767943, 0, 0, 1, -0.0116238, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0019538, 0, 1, 0, -0.151163, 0, 0, 1, -0.0116238, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0489236, 0, 1, 0, -0.221618, 0, 0, 1, -0.0155379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.045016, 0, 1, 0, -0.221618, 0, 0, 1, -0.0155379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.142863, 0, 1, 0, -0.198133, 0, 0, 1, -0.0155379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.138956, 0, 1, 0, -0.198133, 0, 0, 1, -0.0155379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.252459, 0, 1, 0, -0.186391, 0, 0, 1, -0.0155379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.248552, 0, 1, 0, -0.186391, 0, 0, 1, -0.0155379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.385541, 0, 1, 0, -0.186391, 0, 0, 1, -0.0116238, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.381633, 0, 1, 0, -0.186391, 0, 0, 1, -0.0116238, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.401197, 0, 1, 0, -0.205961, 0, 0, 1, 0.00403281, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.444253, 0, 1, 0, -0.209875, 0, 0, 1, 0.000118664, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.444253, 0, 1, 0, -0.170734, 0, 0, 1, -0.00770964, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0645868, 0, 1, 0, 0.0719435, 0, 0, 1, -0.00770964, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0684944, 0, 1, 0, 0.0719435, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0019538, 0, 1, 0, -0.237274, 0, 0, 1, -0.0155379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.39729, 0, 1, 0, -0.205961, 0, 0, 1, 0.00403281, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440345, 0, 1, 0, -0.209875, 0, 0, 1, 0.000118664, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444259, 0, 1, 0, -0.194219, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444259, 0, 1, 0, -0.182476, 0, 0, 1, -0.00770964, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440345, 0, 1, 0, -0.170734, 0, 0, 1, -0.00770964, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.41294, 0, 1, 0, -0.221618, 0, 0, 1, 0.0118611, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.463824, 0, 1, 0, -0.209875, 0, 0, 1, 0.00403281, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.448167, 0, 1, 0, -0.194219, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.448167, 0, 1, 0, -0.182476, 0, 0, 1, -0.00770964, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.463824, 0, 1, 0, -0.16682, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0880717, 0, 1, 0, 0.251994, 0, 0, 1, -0.0233662, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0919793, 0, 1, 0, 0.251994, 0, 0, 1, -0.0194521, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0019538, 0, 1, 0, -0.276416, 0, 0, 1, -0.0116238, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409032, 0, 1, 0, -0.221618, 0, 0, 1, 0.0118611, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.459916, 0, 1, 0, -0.209875, 0, 0, 1, 0.00403281, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.46383, 0, 1, 0, -0.194219, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.46383, 0, 1, 0, -0.182476, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.459916, 0, 1, 0, -0.16682, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.420768, 0, 1, 0, -0.237274, 0, 0, 1, 0.0196894, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.483394, 0, 1, 0, -0.209875, 0, 0, 1, 0.00794697, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.467738, 0, 1, 0, -0.194219, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.467738, 0, 1, 0, -0.182476, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.475566, 0, 1, 0, -0.162906, 0, 0, 1, 0.000118664, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.107642, 0, 1, 0, 0.38899, 0, 0, 1, -0.0351087, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.11155, 0, 1, 0, 0.38899, 0, 0, 1, -0.0351087, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0019538, 0, 1, 0, -0.413411, 0, 0, 1, 0.0275177, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.41686, 0, 1, 0, -0.237274, 0, 0, 1, 0.0196894, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.479487, 0, 1, 0, -0.209875, 0, 0, 1, 0.00794697, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.483401, 0, 1, 0, -0.194219, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.479487, 0, 1, 0, -0.178562, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.471659, 0, 1, 0, -0.162906, 0, 0, 1, 0.000118664, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.428596, 0, 1, 0, -0.249017, 0, 0, 1, 0.0236036, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.499051, 0, 1, 0, -0.209875, 0, 0, 1, 0.0118611, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487309, 0, 1, 0, -0.194219, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.483394, 0, 1, 0, -0.178562, 0, 0, 1, -0.00379549, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487309, 0, 1, 0, -0.162906, 0, 0, 1, 0.00403281, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.127213, 0, 1, 0, 0.43596, 0, 0, 1, 0.0510026, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.131121, 0, 1, 0, 0.43596, 0, 0, 1, 0.0510026, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: firefighter_human_trim
            objectName: "firefighter_human_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.0019538, -0.0406302, 0.00770964)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.050884, 0)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0665406, 0.00391415)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0743689, 0)
                            Node {
                                id: spine3
                                objectName: "Spine3"
                                position: Qt.vector3d(0, 0.0861113, 0.00391415)
                                Node {
                                    id: neck
                                    objectName: "Neck"
                                    position: Qt.vector3d(0, 0.0391415, -0.00391415)
                                    Node {
                                        id: head
                                        objectName: "Head"
                                        position: Qt.vector3d(0, 0.136995, -0.0391415)
                                    }
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0469698, 0.0704547, 0.00391415)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0939396, -0.0234849, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.109596, -0.0117425, 0)
                                        Node {
                                            id: joint_10
                                            objectName: "joint_10"
                                            position: Qt.vector3d(-0.133081, 0, -0.00391415)
                                            Node {
                                                id: joint_11
                                                objectName: "joint_11"
                                                position: Qt.vector3d(-0.0156566, 0.0195708, -0.0156566)
                                                Node {
                                                    id: joint_12
                                                    objectName: "joint_12"
                                                    position: Qt.vector3d(-0.0117425, 0.0156566, -0.0078283)
                                                    Node {
                                                        id: joint_13
                                                        objectName: "joint_13"
                                                        position: Qt.vector3d(-0.0078283, 0.0156566, -0.0078283)
                                                        Node {
                                                            id: joint_14
                                                            objectName: "joint_14"
                                                            position: Qt.vector3d(-0.0078283, 0.0117425, -0.00391415)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_15
                                                objectName: "joint_15"
                                                position: Qt.vector3d(-0.0587123, 0.0234849, -0.0117425)
                                                Node {
                                                    id: joint_16
                                                    objectName: "joint_16"
                                                    position: Qt.vector3d(-0.0195707, 0, -0.00391415)
                                                    Node {
                                                        id: joint_17
                                                        objectName: "joint_17"
                                                        position: Qt.vector3d(-0.0195708, 0, -0.00391415)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_18
                                                objectName: "joint_18"
                                                position: Qt.vector3d(-0.0626264, 0.0078283, -0.0078283)
                                                Node {
                                                    id: joint_19
                                                    objectName: "joint_19"
                                                    position: Qt.vector3d(-0.0195707, 0, 0)
                                                    Node {
                                                        id: joint_20
                                                        objectName: "joint_20"
                                                        position: Qt.vector3d(-0.0195708, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_21
                                                objectName: "joint_21"
                                                position: Qt.vector3d(-0.0626264, -0.00391415, -0.00391415)
                                                Node {
                                                    id: joint_22
                                                    objectName: "joint_22"
                                                    position: Qt.vector3d(-0.0195707, 0, -0.00391415)
                                                    Node {
                                                        id: joint_23
                                                        objectName: "joint_23"
                                                        position: Qt.vector3d(-0.0156566, -0.00391416, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_24
                                                objectName: "joint_24"
                                                position: Qt.vector3d(-0.0587123, -0.0156566, -0.00391415)
                                                Node {
                                                    id: joint_25
                                                    objectName: "joint_25"
                                                    position: Qt.vector3d(-0.0195707, -0.00391415, -0.00391415)
                                                    Node {
                                                        id: joint_26
                                                        objectName: "joint_26"
                                                        position: Qt.vector3d(-0.0117425, -0.00391416, -0.00391415)
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
                                position: Qt.vector3d(0.0469698, 0.0704547, 0.00391415)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0939396, -0.0234849, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.109596, -0.0117425, 0)
                                        Node {
                                            id: joint_30
                                            objectName: "joint_30"
                                            position: Qt.vector3d(0.133081, 0, -0.00391415)
                                            Node {
                                                id: joint_31
                                                objectName: "joint_31"
                                                position: Qt.vector3d(0.0156566, 0.0195708, -0.0156566)
                                                Node {
                                                    id: joint_32
                                                    objectName: "joint_32"
                                                    position: Qt.vector3d(0.0117425, 0.0156566, -0.0078283)
                                                    Node {
                                                        id: joint_33
                                                        objectName: "joint_33"
                                                        position: Qt.vector3d(0.0078283, 0.0156566, -0.0078283)
                                                        Node {
                                                            id: joint_34
                                                            objectName: "joint_34"
                                                            position: Qt.vector3d(0.0078283, 0.0117425, -0.00391415)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0587123, 0.0234849, -0.0117425)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0195707, 0, -0.00391415)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0195708, 0, -0.00391415)
                                                        Node {
                                                            id: joint_38
                                                            objectName: "joint_38"
                                                            position: Qt.vector3d(0.0156566, 0, -0.00391415)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_39
                                                objectName: "joint_39"
                                                position: Qt.vector3d(0.0626264, 0.0078283, -0.0078283)
                                                Node {
                                                    id: joint_40
                                                    objectName: "joint_40"
                                                    position: Qt.vector3d(0.0195707, 0, 0)
                                                    Node {
                                                        id: joint_41
                                                        objectName: "joint_41"
                                                        position: Qt.vector3d(0.0195708, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_42
                                                objectName: "joint_42"
                                                position: Qt.vector3d(0.0626264, -0.00391415, -0.00391415)
                                                Node {
                                                    id: joint_43
                                                    objectName: "joint_43"
                                                    position: Qt.vector3d(0.0195707, 0, -0.00391415)
                                                    Node {
                                                        id: joint_44
                                                        objectName: "joint_44"
                                                        position: Qt.vector3d(0.0156566, -0.00391416, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_45
                                                objectName: "joint_45"
                                                position: Qt.vector3d(0.0587123, -0.0156566, -0.00391415)
                                                Node {
                                                    id: joint_46
                                                    objectName: "joint_46"
                                                    position: Qt.vector3d(0.0195707, -0.00391415, -0.00391415)
                                                    Node {
                                                        id: joint_47
                                                        objectName: "joint_47"
                                                        position: Qt.vector3d(0.0117425, -0.00391416, -0.00391415)
                                                        Node {
                                                            id: joint_48
                                                            objectName: "joint_48"
                                                            position: Qt.vector3d(0.0117424, 0, -0.00391415)
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
                    position: Qt.vector3d(-0.0665406, -0.0313132, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0234849, -0.180051, 0.0156566)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0195708, -0.136995, 0.0117425)
                            Node {
                                id: joint_52
                                objectName: "joint_52"
                                position: Qt.vector3d(-0.0195708, -0.0469698, -0.0861113)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0665406, -0.0313132, -0.00391415)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0234849, -0.180051, 0.0156566)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0195708, -0.136995, 0.0156566)
                            Node {
                                id: joint_56
                                objectName: "joint_56"
                                position: Qt.vector3d(0.0195708, -0.0469698, -0.0861113)
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
                qtmesh_gen3d_1_1790477372420_mesh_mat_material
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_0.qad"
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
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_0.qad"
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
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_0.qad"
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_1.qad"
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
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_1.qad"
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
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_1.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_1.qad"
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_2.qad"
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
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_2.qad"
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
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_2.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_2.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_2.qad"
        }
        KeyframeGroup {
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_2.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_2.qad"
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_3.qad"
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
            target: rightForeArm
            property: "rotation"
            keyframeSource: "animations/rightForeArm_rotation_3.qad"
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
            target: spine2
            property: "rotation"
            keyframeSource: "animations/spine2_rotation_3.qad"
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_3.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            keyframeSource: "animations/spine_rotation_3.qad"
        }
        KeyframeGroup {
            target: spine1
            property: "rotation"
            keyframeSource: "animations/spine1_rotation_3.qad"
        }
    }
}
