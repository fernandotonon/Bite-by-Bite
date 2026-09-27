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
        id: qtmesh_gen3d_1_1790464472525_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790464472525_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790464472525_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790464472525_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790464472525_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790464472525_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790464472525_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790464472525_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790464472525_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790464472525_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790464472525_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790464472525_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790464472525_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790464472525_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790464472525_normal_png_texture
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
            joint_35,
            joint_38,
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
            joint_32,
            joint_36,
            joint_39,
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
            joint_33,
            joint_37,
            joint_40,
            joint_43,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00171156, 0, 1, 0, -0.0289351, 0, 0, 1, -0.00702056, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00171156, 0, 1, 0, -0.0798601, 0, 0, 1, -0.00702056, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00171156, 0, 1, 0, -0.142537, 0, 0, 1, -0.0109379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00171156, 0, 1, 0, -0.213048, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0335442, 0, 1, 0, -0.279642, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0369673, 0, 1, 0, -0.279642, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.100138, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.103561, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.229409, 0, 1, 0, -0.232635, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.232832, 0, 1, 0, -0.232635, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.390019, 0, 1, 0, -0.240469, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.393442, 0, 1, 0, -0.240469, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.057048, 0, 1, 0, 0.00240329, 0, 0, 1, -0.00702056, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0604711, 0, 1, 0, 0.00240329, 0, 0, 1, -0.00310326, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409605, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.440944, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444861, 0, 1, 0, -0.236552, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.437026, 0, 1, 0, -0.216966, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.413028, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.448284, 0, 1, 0, -0.240469, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.448284, 0, 1, 0, -0.2248, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.440449, 0, 1, 0, -0.216966, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0687999, 0, 1, 0, 0.22569, 0, 0, 1, -0.0226898, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.072223, 0, 1, 0, 0.22569, 0, 0, 1, -0.0187725, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00171156, 0, 1, 0, -0.291394, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.425274, 0, 1, 0, -0.260056, 0, 0, 1, -0.0109379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.46053, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464447, 0, 1, 0, -0.236552, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444861, 0, 1, 0, -0.2248, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.456613, 0, 1, 0, -0.216966, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.428697, 0, 1, 0, -0.263973, 0, 0, 1, -0.0109379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.448284, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.467871, 0, 1, 0, -0.240469, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.467871, 0, 1, 0, -0.2248, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.460036, 0, 1, 0, -0.216966, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.096221, 0, 1, 0, 0.425472, 0, 0, 1, -0.0305244, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0996441, 0, 1, 0, 0.425472, 0, 0, 1, -0.0266071, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00171156, 0, 1, 0, -0.330567, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.437026, 0, 1, 0, -0.275725, 0, 0, 1, -0.00702056, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.476199, 0, 1, 0, -0.252221, 0, 0, 1, -0.0109379, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.484034, 0, 1, 0, -0.236552, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464447, 0, 1, 0, -0.2248, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468365, 0, 1, 0, -0.213048, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.440449, 0, 1, 0, -0.279642, 0, 0, 1, -0.00702056, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.463953, 0, 1, 0, -0.252221, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487457, 0, 1, 0, -0.236552, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.48354, 0, 1, 0, -0.2248, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.471788, 0, 1, 0, -0.213048, 0, 0, 1, -0.0148552, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.104056, 0, 1, 0, 0.468562, 0, 0, 1, 0.051739, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.107479, 0, 1, 0, 0.468562, 0, 0, 1, 0.051739, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: electrician_human_trim
            objectName: "electrician_human_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00171156, 0.0289351, 0.00702056)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0509249, 0)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0626768, 0.0039173)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0705114, 0.0039173)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.078346, 0)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.039173, 0)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0352557, 0.0665941, 0)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0665941, -0.0274211, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.129271, -0.0195865, 0)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.160609, 0.00783461, 0)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0195865, 0.0117519, 0)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0156692, 0.00783461, -0.0039173)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.0117519, 0.0156692, -0.0039173)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0509249, 0.0117519, 0)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0195865, 0, 0)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0156692, 0, -0.0039173)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0548422, -0.00391731, 0)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0195865, 0, 0)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0195865, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0548422, -0.0156692, 0)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0195865, 0, 0)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156692, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0470076, -0.0235038, 0)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0195865, 0, 0)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117519, -0.00391731, 0)
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
                                position: Qt.vector3d(0.0352557, 0.0665941, 0)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0665941, -0.0274211, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.129271, -0.0195865, 0)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.160609, 0.00783461, 0)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0195865, 0.0117519, 0)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0156692, 0.0117519, -0.0039173)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.0117519, 0.0156692, -0.0039173)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0548422, 0.0117519, 0)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0156692, 0, 0)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0156692, 0, -0.0039173)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0548422, 0, 0)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0195865, 0, 0)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0195865, -0.00391731, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0548422, -0.0156692, 0)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0195865, 0, 0)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0156692, 0, 0)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0470076, -0.0235038, 0)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0195865, 0, 0)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117519, -0.00391731, 0)
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
                    position: Qt.vector3d(-0.0587595, -0.0313384, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0117519, -0.223286, 0.0156692)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0274211, -0.199782, 0.0078346)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.00783461, -0.0430903, -0.0822634)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0587595, -0.0313384, -0.0039173)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0117519, -0.223286, 0.0156692)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0274211, -0.199782, 0.0078346)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.00783461, -0.0430903, -0.078346)
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
                qtmesh_gen3d_1_1790464472525_mesh_mat_material
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
