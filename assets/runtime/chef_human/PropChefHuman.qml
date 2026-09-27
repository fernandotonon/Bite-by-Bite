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
        id: qtmesh_gen3d_1_1790476204309_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790476204309_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790476204309_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790476204309_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790476204309_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790476204309_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790476204309_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790476204309_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790476204309_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790476204309_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790476204309_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790476204309_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790476204309_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790476204309_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790476204309_normal_png_texture
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
            joint_32,
            leftUpLeg,
            rightUpLeg,
            joint_11,
            joint_15,
            joint_25,
            joint_33,
            joint_37,
            joint_41,
            leftLeg,
            rightLeg,
            spine3,
            joint_12,
            joint_16,
            joint_19,
            joint_22,
            joint_26,
            joint_34,
            joint_38,
            joint_42,
            joint_45,
            joint_48,
            leftFoot,
            rightFoot,
            neck,
            joint_13,
            joint_17,
            joint_20,
            joint_23,
            joint_27,
            joint_35,
            joint_39,
            joint_43,
            joint_46,
            joint_49,
            joint_55,
            joint_60,
            head,
            joint_14,
            joint_18,
            joint_21,
            joint_24,
            joint_28,
            joint_36,
            joint_40,
            joint_44,
            joint_47,
            joint_50,
            joint_56,
            joint_61
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00234797, 0, 1, 0, 0.0251982, 0, 0, 1, 0.0158044, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00234797, 0, 1, 0, -0.0218255, 0, 0, 1, 0.0158044, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00234797, 0, 1, 0, -0.0766864, 0, 0, 1, 0.0158044, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00234797, 0, 1, 0, -0.139385, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0290011, 0, 1, 0, -0.194245, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0336971, 0, 1, 0, -0.194245, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0877806, 0, 1, 0, -0.170734, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0924766, 0, 1, 0, -0.170734, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.221014, 0, 1, 0, -0.158978, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.22571, 0, 1, 0, -0.158978, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.381678, 0, 1, 0, -0.158978, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.386374, 0, 1, 0, -0.158978, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0485943, 0, 1, 0, 0.04871, 0, 0, 1, 0.0158044, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0532902, 0, 1, 0, 0.04871, 0, 0, 1, 0.0158044, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.401272, 0, 1, 0, -0.170734, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440458, 0, 1, 0, -0.170734, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.436539, 0, 1, 0, -0.135466, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405967, 0, 1, 0, -0.170734, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.445154, 0, 1, 0, -0.170734, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.445154, 0, 1, 0, -0.158978, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0564316, 0, 1, 0, 0.22113, 0, 0, 1, -0.00378874, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0611275, 0, 1, 0, 0.22113, 0, 0, 1, -0.00378874, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00234797, 0, 1, 0, -0.206001, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.413027, 0, 1, 0, -0.18249, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460051, 0, 1, 0, -0.170734, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440458, 0, 1, 0, -0.158978, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440458, 0, 1, 0, -0.147222, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.456132, 0, 1, 0, -0.131547, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417723, 0, 1, 0, -0.186408, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.464747, 0, 1, 0, -0.170734, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.464747, 0, 1, 0, -0.158978, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.445154, 0, 1, 0, -0.147222, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.441235, 0, 1, 0, -0.135466, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0799434, 0, 1, 0, 0.389631, 0, 0, 1, -0.0155446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0846393, 0, 1, 0, 0.389631, 0, 0, 1, -0.0155446, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00234797, 0, 1, 0, -0.256944, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.424783, 0, 1, 0, -0.198164, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.475726, 0, 1, 0, -0.174652, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460051, 0, 1, 0, -0.158978, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460051, 0, 1, 0, -0.147222, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.471807, 0, 1, 0, -0.127629, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.429479, 0, 1, 0, -0.198164, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.480421, 0, 1, 0, -0.174652, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.48434, 0, 1, 0, -0.158978, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.464747, 0, 1, 0, -0.147222, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.460828, 0, 1, 0, -0.131547, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0995366, 0, 1, 0, 0.42098, 0, 0, 1, 0.0432349, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.104232, 0, 1, 0, 0.42098, 0, 0, 1, 0.0432349, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00234797, 0, 1, 0, -0.398014, 0, 0, 1, -0.0390565, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.432621, 0, 1, 0, -0.20992, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.4914, 0, 1, 0, -0.178571, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.479644, 0, 1, 0, -0.158978, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.479644, 0, 1, 0, -0.147222, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.483563, 0, 1, 0, -0.12371, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.437317, 0, 1, 0, -0.20992, 0, 0, 1, 0.0118858, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.496096, 0, 1, 0, -0.178571, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.500015, 0, 1, 0, -0.158978, 0, 0, 1, 0.00404853, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.48434, 0, 1, 0, -0.147222, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.476503, 0, 1, 0, -0.127629, 0, 0, 1, 0.00796716, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.103455, 0, 1, 0, 0.417062, 0, 0, 1, 0.0706653, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.108151, 0, 1, 0, 0.417062, 0, 0, 1, 0.0706653, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: chef_human_trim
            objectName: "chef_human_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00234797, -0.0251982, -0.0158044)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0470236, 0)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0548609, 0)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0626982, 0.00391864)
                            Node {
                                id: spine3
                                objectName: "Spine3"
                                position: Qt.vector3d(0, 0.0666168, 0)
                                Node {
                                    id: neck
                                    objectName: "Neck"
                                    position: Qt.vector3d(0, 0.0509422, 0)
                                    Node {
                                        id: head
                                        objectName: "Head"
                                        position: Qt.vector3d(0, 0.141071, 0.0509423)
                                    }
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0313491, 0.0548609, 0)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0587795, -0.0235118, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.133234, -0.0117559, 0)
                                        Node {
                                            id: joint_10
                                            objectName: "joint_10"
                                            position: Qt.vector3d(-0.160664, 0, 0.00391864)
                                            Node {
                                                id: joint_11
                                                objectName: "joint_11"
                                                position: Qt.vector3d(-0.0195932, 0.0117559, -0.00391864)
                                                Node {
                                                    id: joint_12
                                                    objectName: "joint_12"
                                                    position: Qt.vector3d(-0.0117559, 0.0117559, 0)
                                                    Node {
                                                        id: joint_13
                                                        objectName: "joint_13"
                                                        position: Qt.vector3d(-0.0117559, 0.0156745, 0)
                                                        Node {
                                                            id: joint_14
                                                            objectName: "joint_14"
                                                            position: Qt.vector3d(-0.00783727, 0.0117559, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_15
                                                objectName: "joint_15"
                                                position: Qt.vector3d(-0.0587795, 0.0117559, 0)
                                                Node {
                                                    id: joint_16
                                                    objectName: "joint_16"
                                                    position: Qt.vector3d(-0.0195932, 0, 0)
                                                    Node {
                                                        id: joint_17
                                                        objectName: "joint_17"
                                                        position: Qt.vector3d(-0.0156746, 0.00391863, 0)
                                                        Node {
                                                            id: joint_18
                                                            objectName: "joint_18"
                                                            position: Qt.vector3d(-0.0156745, 0.00391863, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0587795, 0, 0.00391864)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0195932, 0, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0195932, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0587795, -0.0117559, 0.00391864)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0195932, 0, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0195932, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_25
                                                objectName: "joint_25"
                                                position: Qt.vector3d(-0.0548609, -0.0235118, 0)
                                                Node {
                                                    id: joint_26
                                                    objectName: "joint_26"
                                                    position: Qt.vector3d(-0.0195932, -0.00391863, 0)
                                                    Node {
                                                        id: joint_27
                                                        objectName: "joint_27"
                                                        position: Qt.vector3d(-0.0156745, -0.00391863, 0)
                                                        Node {
                                                            id: joint_28
                                                            objectName: "joint_28"
                                                            position: Qt.vector3d(-0.0117559, -0.00391863, 0)
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
                                position: Qt.vector3d(0.0313491, 0.0548609, 0)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0587795, -0.0235118, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.133234, -0.0117559, 0)
                                        Node {
                                            id: joint_32
                                            objectName: "joint_32"
                                            position: Qt.vector3d(0.160664, 0, 0.00391864)
                                            Node {
                                                id: joint_33
                                                objectName: "joint_33"
                                                position: Qt.vector3d(0.0195932, 0.0117559, -0.00391864)
                                                Node {
                                                    id: joint_34
                                                    objectName: "joint_34"
                                                    position: Qt.vector3d(0.0117559, 0.0156745, 0)
                                                    Node {
                                                        id: joint_35
                                                        objectName: "joint_35"
                                                        position: Qt.vector3d(0.0117559, 0.0117559, 0)
                                                        Node {
                                                            id: joint_36
                                                            objectName: "joint_36"
                                                            position: Qt.vector3d(0.00783727, 0.0117559, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_37
                                                objectName: "joint_37"
                                                position: Qt.vector3d(0.0587795, 0.0117559, 0)
                                                Node {
                                                    id: joint_38
                                                    objectName: "joint_38"
                                                    position: Qt.vector3d(0.0195932, 0, 0)
                                                    Node {
                                                        id: joint_39
                                                        objectName: "joint_39"
                                                        position: Qt.vector3d(0.0156745, 0.00391863, 0)
                                                        Node {
                                                            id: joint_40
                                                            objectName: "joint_40"
                                                            position: Qt.vector3d(0.0156746, 0.00391863, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0587795, 0, 0.00391864)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0195932, 0, 0)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0195932, 0, 0)
                                                        Node {
                                                            id: joint_44
                                                            objectName: "joint_44"
                                                            position: Qt.vector3d(0.0156745, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_45
                                                objectName: "joint_45"
                                                position: Qt.vector3d(0.0587795, -0.0117559, 0)
                                                Node {
                                                    id: joint_46
                                                    objectName: "joint_46"
                                                    position: Qt.vector3d(0.0195932, 0, 0)
                                                    Node {
                                                        id: joint_47
                                                        objectName: "joint_47"
                                                        position: Qt.vector3d(0.0195932, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_48
                                                objectName: "joint_48"
                                                position: Qt.vector3d(0.0548609, -0.0235118, 0)
                                                Node {
                                                    id: joint_49
                                                    objectName: "joint_49"
                                                    position: Qt.vector3d(0.0195932, -0.00391863, 0)
                                                    Node {
                                                        id: joint_50
                                                        objectName: "joint_50"
                                                        position: Qt.vector3d(0.0156746, -0.00391863, 0)
                                                        Node {
                                                            id: joint_51
                                                            objectName: "joint_51"
                                                            position: Qt.vector3d(0.0117559, -0.00391863, 0)
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
                    position: Qt.vector3d(-0.0509423, -0.0235118, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.00783727, -0.17242, 0.0195932)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0235118, -0.168501, 0.0117559)
                            Node {
                                id: joint_55
                                objectName: "joint_55"
                                position: Qt.vector3d(-0.0195932, -0.0313491, -0.0587795)
                                Node {
                                    id: joint_56
                                    objectName: "joint_56"
                                    position: Qt.vector3d(-0.00391863, 0.00391865, -0.0274304)
                                }
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0509423, -0.0235118, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.00783727, -0.17242, 0.0195932)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0235118, -0.168501, 0.0117559)
                            Node {
                                id: joint_60
                                objectName: "joint_60"
                                position: Qt.vector3d(0.0195932, -0.0313491, -0.0587795)
                                Node {
                                    id: joint_61
                                    objectName: "joint_61"
                                    position: Qt.vector3d(0.00391863, 0.00391865, -0.0274304)
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
                qtmesh_gen3d_1_1790476204309_mesh_mat_material
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
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_0.qad"
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_0.qad"
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_1.qad"
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
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_2.qad"
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_2.qad"
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
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_3.qad"
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
            target: spine3
            property: "rotation"
            keyframeSource: "animations/spine3_rotation_3.qad"
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
            property: "rotation"
            keyframeSource: "animations/hips_rotation_3.qad"
        }
    }
}
