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
        id: qtmesh_gen3d_1_1790475073631_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790475073631_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790475073631_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790475073631_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790475073631_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790475073631_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790475073631_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790475073631_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790475073631_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790475073631_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790475073631_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790475073631_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790475073631_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790475073631_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790475073631_normal_png_texture
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
            Qt.matrix4x4(1, 0, 0, -0.001792, 0, 1, 0, -0.029002, 0, 0, 1, -0.00859723, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.001792, 0, 1, 0, -0.0760218, 0, 0, 1, -0.0125155, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.001792, 0, 1, 0, -0.130878, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.001792, 0, 1, 0, -0.193571, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0373912, 0, 1, 0, -0.248428, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0409751, 0, 1, 0, -0.248428, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.115757, 0, 1, 0, -0.209245, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.119341, 0, 1, 0, -0.209245, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.22547, 0, 1, 0, -0.185735, 0, 0, 1, -0.0321071, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.229054, 0, 1, 0, -0.185735, 0, 0, 1, -0.0321071, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.378285, 0, 1, 0, -0.177898, 0, 0, 1, -0.0281888, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.381869, 0, 1, 0, -0.177898, 0, 0, 1, -0.0281888, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0373912, 0, 1, 0, 0.00234447, 0, 0, 1, -0.0125155, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0409751, 0, 1, 0, 0.00234447, 0, 0, 1, -0.0125155, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.397876, 0, 1, 0, -0.19749, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444896, 0, 1, 0, -0.201408, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448814, 0, 1, 0, -0.189653, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448814, 0, 1, 0, -0.17398, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444896, 0, 1, 0, -0.158306, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.40146, 0, 1, 0, -0.19749, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.44848, 0, 1, 0, -0.201408, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452398, 0, 1, 0, -0.189653, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452398, 0, 1, 0, -0.17398, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.44848, 0, 1, 0, -0.158306, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0491461, 0, 1, 0, 0.213933, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0527301, 0, 1, 0, 0.213933, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.001792, 0, 1, 0, -0.264101, 0, 0, 1, -0.0242705, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.413549, 0, 1, 0, -0.213163, 0, 0, 1, -0.0125155, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464487, 0, 1, 0, -0.205326, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468406, 0, 1, 0, -0.189653, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464487, 0, 1, 0, -0.17398, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460569, 0, 1, 0, -0.154388, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417133, 0, 1, 0, -0.213163, 0, 0, 1, -0.0125155, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.468071, 0, 1, 0, -0.205326, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.47199, 0, 1, 0, -0.189653, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.468071, 0, 1, 0, -0.17398, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.464153, 0, 1, 0, -0.154388, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0648194, 0, 1, 0, 0.405931, 0, 0, 1, -0.0360254, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0684034, 0, 1, 0, 0.405931, 0, 0, 1, -0.0321071, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.001792, 0, 1, 0, -0.299366, 0, 0, 1, -0.0203522, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.425304, 0, 1, 0, -0.232754, 0, 0, 1, -0.00467891, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.476242, 0, 1, 0, -0.205326, 0, 0, 1, -0.0125155, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.484079, 0, 1, 0, -0.189653, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.484079, 0, 1, 0, -0.170061, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.472324, 0, 1, 0, -0.146552, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.428888, 0, 1, 0, -0.232754, 0, 0, 1, -0.00467891, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.483745, 0, 1, 0, -0.205326, 0, 0, 1, -0.0125155, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487663, 0, 1, 0, -0.189653, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487663, 0, 1, 0, -0.170061, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.475908, 0, 1, 0, -0.146552, 0, 0, 1, -0.0164339, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0765743, 0, 1, 0, 0.445114, 0, 0, 1, 0.0540958, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0801583, 0, 1, 0, 0.445114, 0, 0, 1, 0.0540958, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: doctor_human_trim
            objectName: "doctor_human_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.001792, 0.029002, 0.00859723)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0470198, 0.00391832)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0548564, 0.00391831)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.062693, 0.00391832)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0705297, 0.00391831)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0352648, -0.00391831)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0391832, 0.0548564, 0.00391831)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0783663, -0.0391832, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.109713, -0.0235099, 0.00783663)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.152814, -0.00783662, -0.00391832)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0195916, 0.0195916, -0.00783663)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0156732, 0.0156733, -0.00783663)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.011755, 0.0195916, -0.00783663)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0666113, 0.0235099, -0.00391831)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0195916, 0.00391832, -0.00783663)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.011755, 0, -0.00391831)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0705297, 0.0117549, -0.00391831)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0195916, 0, -0.00391831)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0156732, 0, -0.00391832)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0705297, -0.00391832, -0.00391831)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0156732, 0, -0.00391831)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0195916, -0.00391831, -0.00391832)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0666113, -0.0195916, -0.00391831)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156732, -0.00391832, -0.00391831)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.011755, -0.00783662, -0.00391832)
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
                                position: Qt.vector3d(0.0391832, 0.0548564, 0.00391831)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0783663, -0.0391832, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.109713, -0.0235099, 0.00783663)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.152814, -0.00783662, -0.00391832)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0195916, 0.0195916, -0.00783663)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0156732, 0.0156733, -0.00783663)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.011755, 0.0195916, -0.00783663)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0666113, 0.0235099, -0.00391831)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0195916, 0.00391832, -0.00783663)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0156732, 0, -0.00391831)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0705297, 0.0117549, -0.00391831)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0195916, 0, -0.00391831)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0156732, 0, -0.00391832)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0705297, -0.00391832, -0.00391831)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0156732, 0, -0.00391831)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0195916, -0.00391831, -0.00391832)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0666113, -0.0195916, -0.00391831)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0156732, -0.00391832, -0.00391831)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.011755, -0.00783662, -0.00391832)
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
                    position: Qt.vector3d(-0.0391832, -0.0313465, 0.00391832)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0117549, -0.211589, 0.0117549)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0156733, -0.191997, 0.0117549)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0117549, -0.0391831, -0.0901212)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0391832, -0.0313465, 0.00391832)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0117549, -0.211589, 0.00783663)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0156733, -0.191997, 0.0117549)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0117549, -0.0391831, -0.0862029)
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
                qtmesh_gen3d_1_1790475073631_mesh_mat_material
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
