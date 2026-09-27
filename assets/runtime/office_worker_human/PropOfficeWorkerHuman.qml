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
        id: qtmesh_gen3d_1_1790478371716_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790478371716_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790478371716_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790478371716_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790478371716_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790478371716_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790478371716_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790478371716_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790478371716_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790478371716_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790478371716_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790478371716_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790478371716_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790478371716_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790478371716_normal_png_texture
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
            joint_22,
            joint_29,
            joint_32,
            joint_35,
            joint_41,
            leftLeg,
            rightLeg,
            neck,
            joint_11,
            joint_14,
            joint_17,
            joint_19,
            joint_23,
            joint_30,
            joint_33,
            joint_36,
            joint_38,
            joint_42,
            leftFoot,
            rightFoot,
            head,
            joint_12,
            joint_15,
            joint_18,
            joint_20,
            joint_24,
            joint_31,
            joint_34,
            joint_37,
            joint_39,
            joint_43,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00243691, 0, 1, 0, -0.0412911, 0, 0, 1, -0.0199623, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00243691, 0, 1, 0, -0.0922188, 0, 0, 1, -0.0199623, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00243691, 0, 1, 0, -0.150982, 0, 0, 1, -0.0199623, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00243691, 0, 1, 0, -0.217579, 0, 0, 1, -0.0199623, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0289033, 0, 1, 0, -0.284177, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0337771, 0, 1, 0, -0.284177, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.087666, 0, 1, 0, -0.268507, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0925399, 0, 1, 0, -0.268507, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.216944, 0, 1, 0, -0.24892, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.221818, 0, 1, 0, -0.24892, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.361892, 0, 1, 0, -0.24892, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.366766, 0, 1, 0, -0.24892, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0524084, 0, 1, 0, -0.0138684, 0, 0, 1, -0.0199623, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0572822, 0, 1, 0, -0.0138684, 0, 0, 1, -0.0199623, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377563, 0, 1, 0, -0.26459, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.41282, 0, 1, 0, -0.26459, 0, 0, 1, -0.0395499, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.41282, 0, 1, 0, -0.252837, 0, 0, 1, -0.0395499, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.408903, 0, 1, 0, -0.229332, 0, 0, 1, -0.0317149, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.382436, 0, 1, 0, -0.26459, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417694, 0, 1, 0, -0.26459, 0, 0, 1, -0.0395499, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417694, 0, 1, 0, -0.252837, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.413776, 0, 1, 0, -0.229332, 0, 0, 1, -0.0317149, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.071996, 0, 1, 0, 0.229018, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0768698, 0, 1, 0, 0.229018, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00243691, 0, 1, 0, -0.29593, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.389315, 0, 1, 0, -0.276342, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.42849, 0, 1, 0, -0.26459, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.432408, 0, 1, 0, -0.252837, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.41282, 0, 1, 0, -0.241085, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.424573, 0, 1, 0, -0.229332, 0, 0, 1, -0.0277974, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.394189, 0, 1, 0, -0.276342, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.433364, 0, 1, 0, -0.26459, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.437282, 0, 1, 0, -0.252837, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.421612, 0, 1, 0, -0.241085, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.429447, 0, 1, 0, -0.229332, 0, 0, 1, -0.0277974, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.087666, 0, 1, 0, 0.444481, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0925399, 0, 1, 0, 0.444481, 0, 0, 1, -0.0317149, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00243691, 0, 1, 0, -0.339023, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.39715, 0, 1, 0, -0.292012, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.44416, 0, 1, 0, -0.268507, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448078, 0, 1, 0, -0.252837, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.42849, 0, 1, 0, -0.241085, 0, 0, 1, -0.0317149, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.436325, 0, 1, 0, -0.225415, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.402024, 0, 1, 0, -0.292012, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.449034, 0, 1, 0, -0.268507, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452952, 0, 1, 0, -0.252837, 0, 0, 1, -0.0356324, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.433364, 0, 1, 0, -0.241085, 0, 0, 1, -0.0317149, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.441199, 0, 1, 0, -0.225415, 0, 0, 1, -0.0238799, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.103336, 0, 1, 0, 0.495409, 0, 0, 1, 0.0583881, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.10821, 0, 1, 0, 0.495409, 0, 0, 1, 0.0583881, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: office_worker_human_trim
            objectName: "office_worker_human_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00243691, 0.0412911, 0.0199623)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0509278, 0)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0587628, 0)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0665978, 0)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0783504, 0.00391752)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0430927, 0)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0313402, 0.0665978, 0.00391752)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0587628, -0.0156701, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.129278, -0.0195876, 0.0117526)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.144948, 0, 0)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0156701, 0.0156701, 0)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0117526, 0.0117525, 0)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.00783503, 0.0156701, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0509278, 0.0156701, 0.00391752)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0156701, 0, -0.00391752)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0156701, 0.00391752, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0509278, 0.00391752, 0.00391752)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0195876, 0, -0.00391752)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0156701, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0509278, -0.00783505, 0)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0156701, 0, -0.00391752)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156701, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0470102, -0.0195876, -0.00391752)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156701, 0, -0.00391752)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117525, -0.00391752, -0.00391752)
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
                                position: Qt.vector3d(0.0313402, 0.0665978, 0.00391752)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0587628, -0.0156701, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.129278, -0.0195876, 0.0117526)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.144948, 0, 0)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0156701, 0.0156701, 0)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0117526, 0.0117525, 0)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.00783503, 0.0156701, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0509278, 0.0156701, 0.00391752)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0156701, 0, -0.00391752)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0156701, 0.00391752, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0509278, 0.00391752, 0)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0195876, 0, 0)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0156701, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0548453, -0.00783505, 0)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0117525, 0, -0.00391752)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0156701, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0470102, -0.0195876, -0.00391752)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0156701, 0, -0.00391752)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117526, -0.00391752, -0.00391752)
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
                    position: Qt.vector3d(-0.0548453, -0.0274226, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0195876, -0.242886, 0.00391752)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0156701, -0.215464, 0.0117526)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0156701, -0.0509278, -0.0940205)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0548453, -0.0274226, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0195876, -0.242886, 0.00391752)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0156701, -0.215464, 0.00783504)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0156701, -0.0509278, -0.090103)
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
                qtmesh_gen3d_1_1790478371716_mesh_mat_material
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
