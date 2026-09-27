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
        id: qtmesh_gen3d_1_1790471163022_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790471163022_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790471163022_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790471163022_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790471163022_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790471163022_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790471163022_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790471163022_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790471163022_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790471163022_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790471163022_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790471163022_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790471163022_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790471163022_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790471163022_normal_png_texture
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
            Qt.matrix4x4(1, 0, 0, -0.00211602, 0, 1, 0, 0.0491165, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00211602, 0, 1, 0, 0.00207854, 0, 0, 1, -0.0142762, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00211602, 0, 1, 0, -0.0606388, 0, 0, 1, -0.018196, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00211602, 0, 1, 0, -0.131196, 0, 0, 1, -0.0221158, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0410021, 0, 1, 0, -0.193913, 0, 0, 1, -0.0260357, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0452342, 0, 1, 0, -0.193913, 0, 0, 1, -0.0260357, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.131158, 0, 1, 0, -0.170394, 0, 0, 1, -0.0338753, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.13539, 0, 1, 0, -0.170394, 0, 0, 1, -0.0299555, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.244833, 0, 1, 0, -0.150795, 0, 0, 1, -0.041715, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.249065, 0, 1, 0, -0.150795, 0, 0, 1, -0.041715, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.385947, 0, 1, 0, -0.154715, 0, 0, 1, -0.041715, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.390179, 0, 1, 0, -0.154715, 0, 0, 1, -0.041715, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0566815, 0, 1, 0, 0.0804752, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0609135, 0, 1, 0, 0.0804752, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.405547, 0, 1, 0, -0.174314, 0, 0, 1, -0.0377952, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448665, 0, 1, 0, -0.182154, 0, 0, 1, -0.0377952, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.452585, 0, 1, 0, -0.162554, 0, 0, 1, -0.0377952, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.452585, 0, 1, 0, -0.142955, 0, 0, 1, -0.0338753, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448665, 0, 1, 0, -0.127276, 0, 0, 1, -0.0338753, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.405859, 0, 1, 0, -0.174314, 0, 0, 1, -0.0377952, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452897, 0, 1, 0, -0.182154, 0, 0, 1, -0.0377952, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.456817, 0, 1, 0, -0.162554, 0, 0, 1, -0.0377952, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.456817, 0, 1, 0, -0.142955, 0, 0, 1, -0.0338753, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452897, 0, 1, 0, -0.127276, 0, 0, 1, -0.0338753, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0802005, 0, 1, 0, 0.237268, 0, 0, 1, -0.0221158, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0844325, 0, 1, 0, 0.237268, 0, 0, 1, -0.0221158, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00211602, 0, 1, 0, -0.209592, 0, 0, 1, -0.0260357, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.417306, 0, 1, 0, -0.193913, 0, 0, 1, -0.0338753, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468264, 0, 1, 0, -0.186073, 0, 0, 1, -0.0299555, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.472184, 0, 1, 0, -0.166474, 0, 0, 1, -0.0260357, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.472184, 0, 1, 0, -0.142955, 0, 0, 1, -0.0260357, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464344, 0, 1, 0, -0.123356, 0, 0, 1, -0.0221158, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.421538, 0, 1, 0, -0.193913, 0, 0, 1, -0.0338753, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.472496, 0, 1, 0, -0.186073, 0, 0, 1, -0.0299555, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.476416, 0, 1, 0, -0.166474, 0, 0, 1, -0.0260357, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.476416, 0, 1, 0, -0.142955, 0, 0, 1, -0.0260357, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.468576, 0, 1, 0, -0.123356, 0, 0, 1, -0.0221158, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.09196, 0, 1, 0, 0.362703, 0, 0, 1, -0.0299555, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.096192, 0, 1, 0, 0.362703, 0, 0, 1, -0.0299555, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00211602, 0, 1, 0, -0.252711, 0, 0, 1, -0.018196, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.425146, 0, 1, 0, -0.213512, 0, 0, 1, -0.0299555, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.483943, 0, 1, 0, -0.189993, 0, 0, 1, -0.0142762, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.487863, 0, 1, 0, -0.166474, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.483943, 0, 1, 0, -0.142955, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.476104, 0, 1, 0, -0.119436, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.429378, 0, 1, 0, -0.213512, 0, 0, 1, -0.0299555, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.488175, 0, 1, 0, -0.189993, 0, 0, 1, -0.0142762, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.492095, 0, 1, 0, -0.166474, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.488175, 0, 1, 0, -0.142955, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.480336, 0, 1, 0, -0.119436, 0, 0, 1, -0.0103563, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.111559, 0, 1, 0, 0.413661, 0, 0, 1, 0.0484412, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.115791, 0, 1, 0, 0.413661, 0, 0, 1, 0.0484412, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_security_guard_trim
            objectName: "zombie_security_guard_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00211602, -0.0491165, 0.0103563)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.047038, 0.00391983)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0627173, 0.00391983)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.070557, 0.00391983)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0783966, 0.00391983)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0431181, -0.00783966)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0431182, 0.0627173, 0.00391983)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0901561, -0.023519, 0.00783966)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.113675, -0.0195992, 0.00783966)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.141114, 0.00391982, 0)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0195992, 0.0195992, -0.00391983)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0117595, 0.0195992, -0.00391983)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.00783968, 0.0195992, -0.00391983)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0627173, 0.0274388, -0.00391983)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0195992, 0.00391982, -0.00783966)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0156793, 0.00391984, -0.0156793)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0666372, 0.00783966, -0.00391983)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0195992, 0.00391984, -0.0117595)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0156793, 0, -0.0156793)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0666372, -0.0117595, -0.00783966)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0195992, 0, -0.00783966)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0117595, 0, -0.0156793)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0627173, -0.0274388, -0.00783966)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156793, -0.00391984, -0.0117595)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117595, -0.00391982, -0.0117595)
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
                                position: Qt.vector3d(0.0431182, 0.0627173, 0.00391983)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0901562, -0.023519, 0.00391983)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.113675, -0.0195992, 0.0117595)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.141114, 0.00391982, 0)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0156793, 0.0195992, -0.00391983)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0156793, 0.0195992, -0.00391983)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.00783968, 0.0195992, -0.00391983)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0627173, 0.0274388, -0.00391983)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0195992, 0.00391982, -0.00783966)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0156793, 0.00391984, -0.0156793)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0666372, 0.00783966, -0.00391983)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0195992, 0.00391984, -0.0117595)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0156793, 0, -0.0156793)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0666372, -0.0117595, -0.00783966)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0195992, 0, -0.00783966)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0117595, 0, -0.0156793)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0627173, -0.0274388, -0.00783966)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0156793, -0.00391984, -0.0117595)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117595, -0.00391982, -0.0117595)
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
                    position: Qt.vector3d(-0.0587975, -0.0313587, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.023519, -0.156793, 0.0117595)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0117595, -0.125435, 0.00783966)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0195992, -0.0509578, -0.0783966)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0587975, -0.0313587, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.023519, -0.156793, 0.0117595)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0117595, -0.125435, 0.00783966)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0195992, -0.0509578, -0.0783966)
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
                qtmesh_gen3d_1_1790471163022_mesh_mat_material
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
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.822596, -0.557469, 0.0961154, -0.057669)
            }
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.74115, 0.443535, 0.498426, 0.0744637)
            }
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.649741, -0.544336, 0.301948, -0.436305)
            }
        }
        KeyframeGroup {
            target: leftForeArm
            property: "rotation"
            keyframeSource: "animations/leftForeArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: spine
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999855, 0.0170459, 2.1948e-07, 1.79458e-08)
            }
        }
        KeyframeGroup {
            target: leftArm
            property: "rotation"
            keyframeSource: "animations/leftArm_rotation_1.qad"
        }
        KeyframeGroup {
            target: leftHand
            property: "rotation"
            keyframeSource: "animations/leftHand_rotation_1.qad"
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(1, -0.000732151, -2.49136e-06, 2.98963e-05)
            }
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999954, 0.00964167, -2.55264e-08, 5.25991e-09)
            }
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
