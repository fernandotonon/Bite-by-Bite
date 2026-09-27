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
        id: qtmesh_gen3d_1_1790467142179_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790467142179_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790467142179_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790467142179_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790467142179_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790467142179_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790467142179_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790467142179_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790467142179_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790467142179_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790467142179_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790467142179_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790467142179_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790467142179_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790467142179_normal_png_texture
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
            joint_38,
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
            joint_39,
            joint_43,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00204683, 0, 1, 0, -0.0256782, 0, 0, 1, -0.0104242, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204683, 0, 1, 0, -0.0766041, 0, 0, 1, -0.0143416, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204683, 0, 1, 0, -0.131447, 0, 0, 1, -0.0182589, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204683, 0, 1, 0, -0.194125, 0, 0, 1, -0.0260937, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0332095, 0, 1, 0, -0.252886, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0373032, 0, 1, 0, -0.252886, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0998049, 0, 1, 0, -0.221547, 0, 0, 1, -0.0378458, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.103899, 0, 1, 0, -0.221547, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.217326, 0, 1, 0, -0.198043, 0, 0, 1, -0.0495979, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.22142, 0, 1, 0, -0.198043, 0, 0, 1, -0.0495979, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.362269, 0, 1, 0, -0.198043, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.366363, 0, 1, 0, -0.198043, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.048879, 0, 1, 0, 0.00174339, 0, 0, 1, -0.0143416, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0529727, 0, 1, 0, 0.00174339, 0, 0, 1, -0.0143416, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.377939, 0, 1, 0, -0.213712, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.413195, 0, 1, 0, -0.221547, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.417112, 0, 1, 0, -0.209795, 0, 0, 1, -0.0378458, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.42103, 0, 1, 0, -0.198043, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.417112, 0, 1, 0, -0.186291, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.382032, 0, 1, 0, -0.213712, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417289, 0, 1, 0, -0.221547, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.421206, 0, 1, 0, -0.209795, 0, 0, 1, -0.0378458, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.421206, 0, 1, 0, -0.186291, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0684659, 0, 1, 0, 0.232869, 0, 0, 1, -0.0221763, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0725596, 0, 1, 0, 0.232869, 0, 0, 1, -0.0221763, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204683, 0, 1, 0, -0.264638, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.393608, 0, 1, 0, -0.225464, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.428864, 0, 1, 0, -0.229382, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.432782, 0, 1, 0, -0.213712, 0, 0, 1, -0.0378458, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.432782, 0, 1, 0, -0.20196, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.428864, 0, 1, 0, -0.190208, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.397702, 0, 1, 0, -0.225464, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.432958, 0, 1, 0, -0.229382, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.436875, 0, 1, 0, -0.213712, 0, 0, 1, -0.0378458, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.425123, 0, 1, 0, -0.198043, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.432958, 0, 1, 0, -0.190208, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0880528, 0, 1, 0, 0.444407, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0921465, 0, 1, 0, 0.444407, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00204683, 0, 1, 0, -0.303812, 0, 0, 1, -0.0221763, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.40536, 0, 1, 0, -0.237216, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440617, 0, 1, 0, -0.233299, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448451, 0, 1, 0, -0.21763, 0, 0, 1, -0.0378458, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448451, 0, 1, 0, -0.205877, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440617, 0, 1, 0, -0.190208, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.409454, 0, 1, 0, -0.237216, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.44471, 0, 1, 0, -0.233299, 0, 0, 1, -0.0417632, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452545, 0, 1, 0, -0.21763, 0, 0, 1, -0.0378458, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.436875, 0, 1, 0, -0.20196, 0, 0, 1, -0.0339284, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.44471, 0, 1, 0, -0.190208, 0, 0, 1, -0.0300111, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.103722, 0, 1, 0, 0.495333, 0, 0, 1, 0.0522538, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.107816, 0, 1, 0, 0.495333, 0, 0, 1, 0.0522538, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_nurse_trim
            objectName: "zombie_nurse_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00204683, 0.0256782, 0.0104242)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0509259, 0.00391737)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0548433, 0.00391737)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.062678, 0.00783475)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0705128, 0.00391738)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0391738, -0.00783475)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0352564, 0.0587606, 0.00783475)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0665954, -0.031339, 0.00391738)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.117521, -0.0235043, 0.0117521)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.144943, 0, -0.00783475)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0156695, 0.0156695, 0)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0156695, 0.0117521, 0)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.0117521, 0.0117521, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0509259, 0.0235043, 0)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0156695, 0.00783475, 0)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0117521, 0.00391737, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0548433, 0.0117521, -0.00391737)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0156695, 0.00391737, 0)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0156695, 0.00391738, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0587606, 0, -0.00783475)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0117521, 0.00391738, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156695, 0.00391737, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0548433, -0.0117521, -0.0117521)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0117521, 0.00391738, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117521, 0, 0)
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
                                position: Qt.vector3d(0.0352564, 0.0587606, 0.00391738)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0665954, -0.031339, 0.00391737)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.117521, -0.0235043, 0.0156695)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.144943, 0, -0.00783475)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0156695, 0.0156695, 0)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0156695, 0.0117521, 0)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.0117521, 0.0117521, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0509259, 0.0235043, 0)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0156695, 0.00783475, 0)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0117521, 0.00391737, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0548432, 0.0117521, -0.00391737)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0156695, 0.00391737, 0)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0156695, 0.00391738, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0587606, 0, -0.00783475)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0117521, 0.00391738, 0)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0156695, 0.00391737, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0548432, -0.0117521, -0.0117521)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0117521, 0.00391738, 0)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117521, 0, 0)
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
                    position: Qt.vector3d(-0.0509259, -0.0274216, 0.00391737)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0195869, -0.231125, 0.00783475)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0195869, -0.211538, 0.0117521)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0156695, -0.0509259, -0.0861823)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0509259, -0.0274216, 0.00391737)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0195869, -0.231125, 0.00783475)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0195869, -0.211538, 0.00783475)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0156695, -0.0509259, -0.0822649)
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
                qtmesh_gen3d_1_1790467142179_mesh_mat_material
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
