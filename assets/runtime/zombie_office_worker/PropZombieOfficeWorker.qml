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
        id: qtmesh_gen3d_1_1790474143677_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790474143677_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790474143677_diffuse.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790474143677_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790474143677_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790474143677_roughness.jpg"
    }
    Texture {
        id: qtmesh_gen3d_1_1790474143677_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790474143677_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790474143677_normal.jpg"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790474143677_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790474143677_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790474143677_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790474143677_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790474143677_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790474143677_normal_png_texture
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
            joint_22,
            joint_29,
            joint_32,
            joint_38,
            joint_41,
            leftLeg,
            rightLeg,
            neck,
            joint_11,
            joint_14,
            joint_16,
            joint_19,
            joint_23,
            joint_30,
            joint_33,
            joint_35,
            joint_39,
            joint_42,
            leftFoot,
            rightFoot,
            head,
            joint_12,
            joint_15,
            joint_17,
            joint_20,
            joint_24,
            joint_31,
            joint_34,
            joint_36,
            joint_40,
            joint_43,
            joint_47,
            joint_51
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 0, 0, -0.00212395, 0, 1, 0, -0.0652202, 0, 0, 1, -0.00276258, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00212395, 0, 1, 0, -0.112262, 0, 0, 1, -0.00668271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00212395, 0, 1, 0, -0.163223, 0, 0, 1, -0.0106028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00212395, 0, 1, 0, -0.222025, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0292371, 0, 1, 0, -0.280827, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.033485, 0, 1, 0, -0.280827, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0919591, 0, 1, 0, -0.253386, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.096207, 0, 1, 0, -0.253386, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.248764, 0, 1, 0, -0.241626, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.253012, 0, 1, 0, -0.241626, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.389889, 0, 1, 0, -0.241626, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.394137, 0, 1, 0, -0.241626, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0488377, 0, 1, 0, -0.0416994, 0, 0, 1, -0.00276258, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0530856, 0, 1, 0, -0.0416994, 0, 0, 1, -0.00276258, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.409489, 0, 1, 0, -0.261227, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.448691, 0, 1, 0, -0.265147, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.444771, 0, 1, 0, -0.222025, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.413737, 0, 1, 0, -0.261227, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.452939, 0, 1, 0, -0.265147, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.456859, 0, 1, 0, -0.233786, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.449019, 0, 1, 0, -0.222025, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0605981, 0, 1, 0, 0.197428, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.064846, 0, 1, 0, 0.197428, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00212395, 0, 1, 0, -0.292588, 0, 0, 1, -0.0184431, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.42125, 0, 1, 0, -0.276907, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464371, 0, 1, 0, -0.269067, 0, 0, 1, -0.0106028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.452611, 0, 1, 0, -0.249466, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.452611, 0, 1, 0, -0.233786, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460451, 0, 1, 0, -0.214185, 0, 0, 1, -0.00668271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.425498, 0, 1, 0, -0.276907, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.468619, 0, 1, 0, -0.269067, 0, 0, 1, -0.0106028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.456859, 0, 1, 0, -0.249466, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.472539, 0, 1, 0, -0.233786, 0, 0, 1, -0.0106028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.464699, 0, 1, 0, -0.214185, 0, 0, 1, -0.00668271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0762786, 0, 1, 0, 0.424796, 0, 0, 1, -0.0419639, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0805265, 0, 1, 0, 0.424796, 0, 0, 1, -0.0380437, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00212395, 0, 1, 0, -0.327869, 0, 0, 1, -0.014523, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.42909, 0, 1, 0, -0.292588, 0, 0, 1, -0.00668271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.476132, 0, 1, 0, -0.272987, 0, 0, 1, -0.00668271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468291, 0, 1, 0, -0.249466, 0, 0, 1, -0.0106028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468291, 0, 1, 0, -0.233786, 0, 0, 1, -0.0106028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.472212, 0, 1, 0, -0.210265, 0, 0, 1, 0.00115754, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.433338, 0, 1, 0, -0.292588, 0, 0, 1, -0.00668271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.4843, 0, 1, 0, -0.272987, 0, 0, 1, -0.00668271, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.472539, 0, 1, 0, -0.249466, 0, 0, 1, -0.0106028, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.48822, 0, 1, 0, -0.233786, 0, 0, 1, 0.00115754, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.476459, 0, 1, 0, -0.210265, 0, 0, 1, 0.00115754, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0841189, 0, 1, 0, 0.475757, 0, 0, 1, 0.0442789, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0883668, 0, 1, 0, 0.475757, 0, 0, 1, 0.044279, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_office_worker_trim
            objectName: "zombie_office_worker_trim"
            Node {
                id: hips
                objectName: "Hips"
                position: Qt.vector3d(0.00212395, 0.0652202, 0.00276258)
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.0470415, 0.00392013)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0509617, 0.00392013)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.0588019, 0.00392013)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0705623, 0.00392013)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0352812, -0.00392013)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.031361, 0.0588019, 0.00392013)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.062722, -0.0274409, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.156805, -0.0117604, 0)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.141125, 0, 0)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0196006, 0.0196006, 0)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0117604, 0.0156805, -0.00392013)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.00784025, 0.0156805, -0.00784026)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0588019, 0.0235208, 0)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0156805, 0.00392011, -0.00784026)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0117604, 0.00392014, -0.00392013)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.062722, 0.00784025, -0.00392013)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0156805, 0, -0.00392013)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0156805, -0.00392012, -0.00392013)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.062722, -0.00784026, -0.00392013)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0156805, 0, -0.00392013)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156805, 0, -0.0117604)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0548818, -0.0196006, -0.00392013)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156805, -0.00784026, -0.00784026)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117604, -0.00392012, -0.00784026)
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
                                position: Qt.vector3d(0.031361, 0.0588019, 0.00392013)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.062722, -0.0274409, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.156805, -0.0117604, 0)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.141125, 0, 0)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0196007, 0.0196006, 0)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0117604, 0.0156805, -0.00392013)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.00784025, 0.0156805, -0.00784026)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0588019, 0.0235208, 0)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0156805, 0.00392011, -0.00784026)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0156805, 0.00392014, -0.00392013)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0627221, 0.00784025, -0.00392013)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0156805, 0, -0.00392013)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0156805, -0.00392012, -0.00392013)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0627221, -0.00784026, -0.00392013)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0156805, 0, -0.00392013)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0156805, 0, -0.0117604)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0548818, -0.0196006, -0.00392013)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0156805, -0.00784026, -0.00784026)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117604, -0.00392012, -0.00784026)
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
                    position: Qt.vector3d(-0.0509617, -0.0235208, 0)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0117604, -0.239128, 0.0156805)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0156805, -0.227367, 0.0235208)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.00784025, -0.0509617, -0.0862428)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0509617, -0.0235208, 0)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0117604, -0.239128, 0.0156805)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0156805, -0.227367, 0.0196006)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.00784026, -0.0509617, -0.0823227)
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
                qtmesh_gen3d_1_1790474143677_mesh_mat_material
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
                value: Qt.quaternion(0.822596, -0.567034, 0.0425273, 1.77376e-07)
            }
        }
        KeyframeGroup {
            target: rightForeArm
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.790062, 0.405572, 0.459219, 0.0207594)
            }
        }
        KeyframeGroup {
            target: rightArm
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.666302, -0.544487, 0.353419, -0.366976)
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
                value: Qt.quaternion(0.999942, 0.0107707, 3.15358e-08, 6.61547e-09)
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
                value: Qt.quaternion(0.999963, 0.00865676, -2.49145e-06, 2.98975e-05)
            }
        }
        KeyframeGroup {
            target: spine2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999914, 0.0131472, 7.94308e-08, 1.32301e-08)
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
