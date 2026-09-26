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
        id: qtmesh_gen3d_1_1790409769365_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790409769365_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790409769365_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790409769365_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790409769365_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790409769365_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790409769365_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790409769365_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790409769365_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790409769365_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790409769365_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790409769365_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790409769365_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790409769365_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790409769365_normal_png_texture
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
            joint_11,
            joint_15,
            joint_25,
            joint_33,
            joint_37,
            joint_41,
            joint_48,
            leftUpLeg,
            rightUpLeg,
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
            joint_49,
            leftLeg,
            rightLeg,
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
            joint_50,
            leftFoot,
            rightFoot,
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
            joint_51,
            joint_55,
            joint_59
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00156993, 0, 1, 0, 0.0488819, 0, 0, 1, -0.0176453, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00156993, 0, 1, 0, -0.00596583, 0, 0, 1, -0.021563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00156993, 0, 1, 0, -0.0725666, 0, 0, 1, -0.0254807, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00156993, 0, 1, 0, -0.15092, 0, 0, 1, -0.0293984, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.037607, 0, 1, 0, -0.225357, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0407469, 0, 1, 0, -0.225357, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.119879, 0, 1, 0, -0.18618, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.123018, 0, 1, 0, -0.18618, 0, 0, 1, -0.0372338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.237409, 0, 1, 0, -0.174427, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.240549, 0, 1, 0, -0.174427, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.374529, 0, 1, 0, -0.166591, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.377668, 0, 1, 0, -0.166591, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.394117, 0, 1, 0, -0.190097, 0, 0, 1, -0.0372338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.437212, 0, 1, 0, -0.194015, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.433294, 0, 1, 0, -0.147003, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397257, 0, 1, 0, -0.190097, 0, 0, 1, -0.0372338, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.440352, 0, 1, 0, -0.194015, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.440352, 0, 1, 0, -0.178344, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.436434, 0, 1, 0, -0.147003, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0571955, 0, 1, 0, 0.0802234, 0, 0, 1, -0.0176453, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0603353, 0, 1, 0, 0.0802234, 0, 0, 1, -0.0176453, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00156993, 0, 1, 0, -0.241027, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.40587, 0, 1, 0, -0.209686, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.4568, 0, 1, 0, -0.197933, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.437212, 0, 1, 0, -0.178344, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.441129, 0, 1, 0, -0.162674, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.452882, 0, 1, 0, -0.139167, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.40901, 0, 1, 0, -0.209686, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.45994, 0, 1, 0, -0.197933, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.463858, 0, 1, 0, -0.178344, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.440352, 0, 1, 0, -0.162674, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.456022, 0, 1, 0, -0.139167, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0767839, 0, 1, 0, 0.280026, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0799238, 0, 1, 0, 0.280026, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00156993, 0, 1, 0, -0.291957, 0, 0, 1, -0.0254807, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.417623, 0, 1, 0, -0.233192, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.476389, 0, 1, 0, -0.20185, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460718, 0, 1, 0, -0.178344, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460718, 0, 1, 0, -0.162674, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468553, 0, 1, 0, -0.131332, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.420763, 0, 1, 0, -0.233192, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.479528, 0, 1, 0, -0.20185, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.483446, 0, 1, 0, -0.178344, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.463858, 0, 1, 0, -0.162674, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.471693, 0, 1, 0, -0.131332, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0846193, 0, 1, 0, 0.440651, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0877592, 0, 1, 0, 0.440651, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00156993, 0, 1, 0, -0.452583, 0, 0, 1, -0.0176453, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.429376, 0, 1, 0, -0.244945, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.492059, 0, 1, 0, -0.205768, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.480306, 0, 1, 0, -0.178344, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.480306, 0, 1, 0, -0.162674, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.480306, 0, 1, 0, -0.127414, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.432516, 0, 1, 0, -0.244945, 0, 0, 1, -0.0333161, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.495199, 0, 1, 0, -0.205768, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.499117, 0, 1, 0, -0.178344, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.483446, 0, 1, 0, -0.162674, 0, 0, 1, -0.0450691, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.483446, 0, 1, 0, -0.127414, 0, 0, 1, -0.0411515, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.115961, 0, 1, 0, 0.495499, 0, 0, 1, 0.0528732, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.119101, 0, 1, 0, 0.495499, 0, 0, 1, 0.0528732, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_janitor_trim
            objectName: "zombie_janitor_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00156993, -0.0488819, 0.0176453)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0548477, 0.00391769)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0666008, 0.00391769)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0783539, 0.00391769)
                            Node {
                                id: spine3
                                objectName: "Spine3"
                                position: Qt.vector3d(0, 0.0901069, 0.00391769)
                                Node {
                                    id: neck
                                    objectName: "Neck"
                                    position: Qt.vector3d(0, 0.05093, -0.00783538)
                                    Node {
                                        id: head
                                        objectName: "Head"
                                        position: Qt.vector3d(0, 0.160625, -0.00783539)
                                    }
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0391769, 0.0744362, 0.00391769)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0822716, -0.0391769, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.117531, -0.0117531, 0.00783539)
                                        Node {
                                            id: joint_10
                                            objectName: "joint_10"
                                            position: Qt.vector3d(-0.137119, -0.00783539, 0)
                                            Node {
                                                id: joint_11
                                                objectName: "joint_11"
                                                position: Qt.vector3d(-0.0195885, 0.0235062, -0.00391769)
                                                Node {
                                                    id: joint_12
                                                    objectName: "joint_12"
                                                    position: Qt.vector3d(-0.0117531, 0.0195885, -0.00391769)
                                                    Node {
                                                        id: joint_13
                                                        objectName: "joint_13"
                                                        position: Qt.vector3d(-0.0117531, 0.0235061, 0)
                                                        Node {
                                                            id: joint_14
                                                            objectName: "joint_14"
                                                            position: Qt.vector3d(-0.0117531, 0.0117531, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_15
                                                objectName: "joint_15"
                                                position: Qt.vector3d(-0.0626831, 0.0274239, 0)
                                                Node {
                                                    id: joint_16
                                                    objectName: "joint_16"
                                                    position: Qt.vector3d(-0.0195884, 0.00391769, 0)
                                                    Node {
                                                        id: joint_17
                                                        objectName: "joint_17"
                                                        position: Qt.vector3d(-0.0195885, 0.00391769, 0)
                                                        Node {
                                                            id: joint_18
                                                            objectName: "joint_18"
                                                            position: Qt.vector3d(-0.0156708, 0.00391769, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0626831, 0.0117531, 0.00391769)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0235061, 0, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0195885, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0666008, -0.00391769, 0.00391769)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0195885, 0, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0195885, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_25
                                                objectName: "joint_25"
                                                position: Qt.vector3d(-0.0587654, -0.0195885, 0.00391769)
                                                Node {
                                                    id: joint_26
                                                    objectName: "joint_26"
                                                    position: Qt.vector3d(-0.0195884, -0.00783539, -0.00391769)
                                                    Node {
                                                        id: joint_27
                                                        objectName: "joint_27"
                                                        position: Qt.vector3d(-0.0156708, -0.00783539, 0)
                                                        Node {
                                                            id: joint_28
                                                            objectName: "joint_28"
                                                            position: Qt.vector3d(-0.0117531, -0.00391769, 0)
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
                                position: Qt.vector3d(0.0391769, 0.0744362, 0.00391769)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0822716, -0.0391769, 0.00391769)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.117531, -0.0117531, 0.00391769)
                                        Node {
                                            id: joint_32
                                            objectName: "joint_32"
                                            position: Qt.vector3d(0.137119, -0.00783539, 0)
                                            Node {
                                                id: joint_33
                                                objectName: "joint_33"
                                                position: Qt.vector3d(0.0195885, 0.0235062, -0.00391769)
                                                Node {
                                                    id: joint_34
                                                    objectName: "joint_34"
                                                    position: Qt.vector3d(0.0117531, 0.0195885, -0.00391769)
                                                    Node {
                                                        id: joint_35
                                                        objectName: "joint_35"
                                                        position: Qt.vector3d(0.0117531, 0.0235061, 0)
                                                        Node {
                                                            id: joint_36
                                                            objectName: "joint_36"
                                                            position: Qt.vector3d(0.0117531, 0.0117531, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_37
                                                objectName: "joint_37"
                                                position: Qt.vector3d(0.0626831, 0.0274239, 0)
                                                Node {
                                                    id: joint_38
                                                    objectName: "joint_38"
                                                    position: Qt.vector3d(0.0195885, 0.00391769, 0)
                                                    Node {
                                                        id: joint_39
                                                        objectName: "joint_39"
                                                        position: Qt.vector3d(0.0195885, 0.00391769, 0)
                                                        Node {
                                                            id: joint_40
                                                            objectName: "joint_40"
                                                            position: Qt.vector3d(0.0156708, 0.00391769, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0626831, 0.0117531, 0.00391769)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0235062, 0, 0)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0195885, 0, 0)
                                                        Node {
                                                            id: joint_44
                                                            objectName: "joint_44"
                                                            position: Qt.vector3d(0.0156708, 0, 0)
                                                        }
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_45
                                                objectName: "joint_45"
                                                position: Qt.vector3d(0.0626831, -0.00391769, 0.00391769)
                                                Node {
                                                    id: joint_46
                                                    objectName: "joint_46"
                                                    position: Qt.vector3d(0.0235062, 0, 0)
                                                    Node {
                                                        id: joint_47
                                                        objectName: "joint_47"
                                                        position: Qt.vector3d(0.0195885, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_48
                                                objectName: "joint_48"
                                                position: Qt.vector3d(0.0587654, -0.0195885, 0.00391769)
                                                Node {
                                                    id: joint_49
                                                    objectName: "joint_49"
                                                    position: Qt.vector3d(0.0195884, -0.00783539, -0.00391769)
                                                    Node {
                                                        id: joint_50
                                                        objectName: "joint_50"
                                                        position: Qt.vector3d(0.0156708, -0.00783539, 0)
                                                        Node {
                                                            id: joint_51
                                                            objectName: "joint_51"
                                                            position: Qt.vector3d(0.0117531, -0.00391769, 0)
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
                    position: Qt.vector3d(-0.0587654, -0.0313415, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0195885, -0.199802, 0.0156708)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.00783538, -0.160625, 0)
                            Node {
                                id: joint_55
                                objectName: "joint_55"
                                position: Qt.vector3d(-0.0313415, -0.0548477, -0.0861892)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0587654, -0.0313415, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0195885, -0.199802, 0.0156708)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.00783539, -0.160625, 0)
                            Node {
                                id: joint_59
                                objectName: "joint_59"
                                position: Qt.vector3d(0.0313415, -0.0548477, -0.0861892)
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
                qtmesh_gen3d_1_1790409769365_mesh_mat_material
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
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_0.qad"
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
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999549, -0.00146292, -0.0299898, 1.10037e-07)
            }
        }
        KeyframeGroup {
            target: rightLeg
            property: "rotation"
            keyframeSource: "animations/rightLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftLeg
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.669678, -0.739313, 0.0702919, 0.00260755)
            }
        }
        KeyframeGroup {
            target: rightUpLeg
            property: "rotation"
            keyframeSource: "animations/rightUpLeg_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftUpLeg
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.902511, 0.429984, -0.0208838, 0.0123042)
            }
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
            target: neck
            property: "rotation"
            keyframeSource: "animations/neck_rotation_1.qad"
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
            target: hips
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.990809, 0.135102, 0.00047747, -0.00668458)
            }
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
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_2.qad"
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
            target: hips
            property: "rotation"
            keyframeSource: "animations/hips_rotation_3.qad"
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
