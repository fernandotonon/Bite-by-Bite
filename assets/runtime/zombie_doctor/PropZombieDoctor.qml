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
        id: qtmesh_gen3d_1_1790470622153_diffuse_png_texture
        objectName: "qtmesh_gen3d_1_1790470622153_diffuse.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790470622153_diffuse.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790470622153_roughness_png_texture
        objectName: "qtmesh_gen3d_1_1790470622153_roughness.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790470622153_roughness.png"
    }
    Texture {
        id: qtmesh_gen3d_1_1790470622153_normal_png_texture
        objectName: "qtmesh_gen3d_1_1790470622153_normal.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/qtmesh_gen3d_1_1790470622153_normal.png"
    }
    PrincipledMaterial {
        id: qtmesh_gen3d_1_1790470622153_mesh_mat_material
        objectName: "qtmesh_gen3d_1_1790470622153_mesh_mat"
        baseColorMap: qtmesh_gen3d_1_1790470622153_diffuse_png_texture
        metalnessMap: qtmesh_gen3d_1_1790470622153_roughness_png_texture
        roughnessMap: qtmesh_gen3d_1_1790470622153_roughness_png_texture
        roughness: 1
        normalMap: qtmesh_gen3d_1_1790470622153_normal_png_texture
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
            Qt.matrix4x4(1, 0, 0, -0.00183078, 0, 1, 0, 0.00838705, 0, 0, 1, 4.66298e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00183078, 0, 1, 0, -0.0386579, 0, 0, 1, -0.00387378, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00183078, 0, 1, 0, -0.0974641, 0, 0, 1, -0.0117146, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00183078, 0, 1, 0, -0.164111, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.033453, 0, 1, 0, -0.226838, 0, 0, 1, -0.0273963, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0371145, 0, 1, 0, -0.226838, 0, 0, 1, -0.0273963, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.107941, 0, 1, 0, -0.195474, 0, 0, 1, -0.0273963, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.111602, 0, 1, 0, -0.195474, 0, 0, 1, -0.0273963, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.229474, 0, 1, 0, -0.187634, 0, 0, 1, -0.0391575, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.233135, 0, 1, 0, -0.187634, 0, 0, 1, -0.0391575, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.378449, 0, 1, 0, -0.183713, 0, 0, 1, -0.0352371, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.382111, 0, 1, 0, -0.183713, 0, 0, 1, -0.0352371, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0373734, 0, 1, 0, 0.0397504, 0, 0, 1, -0.0117146, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0410349, 0, 1, 0, 0.0397504, 0, 0, 1, -0.0077942, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.398051, 0, 1, 0, -0.203315, 0, 0, 1, -0.0273963, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.441176, 0, 1, 0, -0.207236, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.445096, 0, 1, 0, -0.195474, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.445096, 0, 1, 0, -0.183713, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.441176, 0, 1, 0, -0.171952, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.401713, 0, 1, 0, -0.203315, 0, 0, 1, -0.0273963, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.444838, 0, 1, 0, -0.207236, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.448758, 0, 1, 0, -0.195474, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.448758, 0, 1, 0, -0.183713, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.444838, 0, 1, 0, -0.171952, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.053055, 0, 1, 0, 0.231851, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0567166, 0, 1, 0, 0.231851, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00183078, 0, 1, 0, -0.238599, 0, 0, 1, -0.0273963, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.413733, 0, 1, 0, -0.218997, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.460778, 0, 1, 0, -0.211156, 0, 0, 1, -0.015635, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464699, 0, 1, 0, -0.195474, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.464699, 0, 1, 0, -0.183713, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.456858, 0, 1, 0, -0.164111, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.417395, 0, 1, 0, -0.218997, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.46444, 0, 1, 0, -0.211156, 0, 0, 1, -0.015635, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.46836, 0, 1, 0, -0.195474, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.46836, 0, 1, 0, -0.183713, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.460519, 0, 1, 0, -0.164111, 0, 0, 1, -0.0195554, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0765775, 0, 1, 0, 0.400428, 0, 0, 1, -0.0313167, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0802391, 0, 1, 0, 0.400428, 0, 0, 1, -0.0313167, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.00183078, 0, 1, 0, -0.277803, 0, 0, 1, -0.0234759, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.425494, 0, 1, 0, -0.238599, 0, 0, 1, -0.0117146, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.47646, 0, 1, 0, -0.215077, 0, 0, 1, -0.00387378, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.484301, 0, 1, 0, -0.195474, 0, 0, 1, -0.0077942, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.48038, 0, 1, 0, -0.179793, 0, 0, 1, -0.0077942, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.468619, 0, 1, 0, -0.160191, 0, 0, 1, -0.0117146, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.429156, 0, 1, 0, -0.238599, 0, 0, 1, -0.0117146, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.480121, 0, 1, 0, -0.215077, 0, 0, 1, -0.00387378, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.487962, 0, 1, 0, -0.195474, 0, 0, 1, -0.0077942, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.484042, 0, 1, 0, -0.179793, 0, 0, 1, -0.0077942, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.47228, 0, 1, 0, -0.160191, 0, 0, 1, -0.0117146, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, 0.0961796, 0, 1, 0, 0.439633, 0, 0, 1, 0.051012, 0, 0, 0, 1),
            Qt.matrix4x4(1, 0, 0, -0.0998411, 0, 1, 0, 0.439633, 0, 0, 1, 0.051012, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: a7
        objectName: "a7"
        Node {
            id: zombie_doctor_trim
            objectName: "zombie_doctor_trim"
            Node {
                id: hips
                objectName: "Hips"
                Node {
                    id: spine
                    objectName: "Spine"
                    position: Qt.vector3d(0, 0.047045, 0.00392041)
                    Node {
                        id: spine1
                        objectName: "Spine1"
                        position: Qt.vector3d(0, 0.0588062, 0.00784083)
                        Node {
                            id: spine2
                            objectName: "Spine2"
                            position: Qt.vector3d(0, 0.066647, 0.00784083)
                            Node {
                                id: neck
                                objectName: "Neck"
                                position: Qt.vector3d(0, 0.0744879, 0.00784083)
                                Node {
                                    id: head
                                    objectName: "Head"
                                    position: Qt.vector3d(0, 0.0392041, -0.00392041)
                                }
                            }
                            Node {
                                id: leftArm
                                objectName: "LeftArm"
                                position: Qt.vector3d(-0.0352837, 0.0627266, 0.00784083)
                                Node {
                                    id: leftForeArm
                                    objectName: "LeftForeArm"
                                    position: Qt.vector3d(-0.0744879, -0.0313633, 0)
                                    Node {
                                        id: leftHand
                                        objectName: "LeftHand"
                                        position: Qt.vector3d(-0.121533, -0.00784083, 0.0117612)
                                        Node {
                                            id: joint_9
                                            objectName: "joint_9"
                                            position: Qt.vector3d(-0.148976, -0.00392041, -0.00392041)
                                            Node {
                                                id: joint_10
                                                objectName: "joint_10"
                                                position: Qt.vector3d(-0.0196021, 0.0196021, -0.00784083)
                                                Node {
                                                    id: joint_11
                                                    objectName: "joint_11"
                                                    position: Qt.vector3d(-0.0156817, 0.0156817, -0.00784083)
                                                    Node {
                                                        id: joint_12
                                                        objectName: "joint_12"
                                                        position: Qt.vector3d(-0.0117612, 0.0196021, -0.00784083)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_13
                                                objectName: "joint_13"
                                                position: Qt.vector3d(-0.0627266, 0.0235225, -0.0117612)
                                                Node {
                                                    id: joint_14
                                                    objectName: "joint_14"
                                                    position: Qt.vector3d(-0.0196021, 0.00392041, -0.00784083)
                                                    Node {
                                                        id: joint_15
                                                        objectName: "joint_15"
                                                        position: Qt.vector3d(-0.0156817, 0.00392042, -0.0117612)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_16
                                                objectName: "joint_16"
                                                position: Qt.vector3d(-0.0666471, 0.0117612, -0.0117612)
                                                Node {
                                                    id: joint_17
                                                    objectName: "joint_17"
                                                    position: Qt.vector3d(-0.0196021, 0, -0.00392041)
                                                    Node {
                                                        id: joint_18
                                                        objectName: "joint_18"
                                                        position: Qt.vector3d(-0.0196021, 0, -0.0117612)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_19
                                                objectName: "joint_19"
                                                position: Qt.vector3d(-0.0666471, 0, -0.0117612)
                                                Node {
                                                    id: joint_20
                                                    objectName: "joint_20"
                                                    position: Qt.vector3d(-0.0196021, 0, -0.00392041)
                                                    Node {
                                                        id: joint_21
                                                        objectName: "joint_21"
                                                        position: Qt.vector3d(-0.0156817, -0.00392042, -0.0117612)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_22
                                                objectName: "joint_22"
                                                position: Qt.vector3d(-0.0627266, -0.0117612, -0.0117612)
                                                Node {
                                                    id: joint_23
                                                    objectName: "joint_23"
                                                    position: Qt.vector3d(-0.0156817, -0.00784083, -0.00392041)
                                                    Node {
                                                        id: joint_24
                                                        objectName: "joint_24"
                                                        position: Qt.vector3d(-0.0117612, -0.00392042, -0.00784083)
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
                                position: Qt.vector3d(0.0352837, 0.0627266, 0.00784083)
                                Node {
                                    id: rightForeArm
                                    objectName: "RightForeArm"
                                    position: Qt.vector3d(0.0744879, -0.0313633, 0)
                                    Node {
                                        id: rightHand
                                        objectName: "RightHand"
                                        position: Qt.vector3d(0.121533, -0.00784083, 0.0117612)
                                        Node {
                                            id: joint_28
                                            objectName: "joint_28"
                                            position: Qt.vector3d(0.148976, -0.00392041, -0.00392041)
                                            Node {
                                                id: joint_29
                                                objectName: "joint_29"
                                                position: Qt.vector3d(0.0196021, 0.0196021, -0.00784083)
                                                Node {
                                                    id: joint_30
                                                    objectName: "joint_30"
                                                    position: Qt.vector3d(0.0156817, 0.0156817, -0.00784083)
                                                    Node {
                                                        id: joint_31
                                                        objectName: "joint_31"
                                                        position: Qt.vector3d(0.0117612, 0.0196021, -0.00784083)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_32
                                                objectName: "joint_32"
                                                position: Qt.vector3d(0.0627266, 0.0235225, -0.0117612)
                                                Node {
                                                    id: joint_33
                                                    objectName: "joint_33"
                                                    position: Qt.vector3d(0.0196021, 0.00392041, -0.00784083)
                                                    Node {
                                                        id: joint_34
                                                        objectName: "joint_34"
                                                        position: Qt.vector3d(0.0156817, 0.00392042, -0.0117612)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_35
                                                objectName: "joint_35"
                                                position: Qt.vector3d(0.0666471, 0.0117612, -0.0117612)
                                                Node {
                                                    id: joint_36
                                                    objectName: "joint_36"
                                                    position: Qt.vector3d(0.0196021, 0, -0.00392041)
                                                    Node {
                                                        id: joint_37
                                                        objectName: "joint_37"
                                                        position: Qt.vector3d(0.0196021, 0, -0.0117612)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_38
                                                objectName: "joint_38"
                                                position: Qt.vector3d(0.0666471, 0, -0.0117612)
                                                Node {
                                                    id: joint_39
                                                    objectName: "joint_39"
                                                    position: Qt.vector3d(0.0196021, 0, -0.00392041)
                                                    Node {
                                                        id: joint_40
                                                        objectName: "joint_40"
                                                        position: Qt.vector3d(0.0156817, -0.00392042, -0.0117612)
                                                    }
                                                }
                                            }
                                            Node {
                                                id: joint_41
                                                objectName: "joint_41"
                                                position: Qt.vector3d(0.0627266, -0.0117612, -0.0117612)
                                                Node {
                                                    id: joint_42
                                                    objectName: "joint_42"
                                                    position: Qt.vector3d(0.0156817, -0.00784083, -0.00392041)
                                                    Node {
                                                        id: joint_43
                                                        objectName: "joint_43"
                                                        position: Qt.vector3d(0.0117612, -0.00392042, -0.00784083)
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
                    position: Qt.vector3d(-0.0392041, -0.0313633, 0.0117612)
                    Node {
                        id: leftLeg
                        objectName: "LeftLeg"
                        position: Qt.vector3d(-0.0156817, -0.1921, 0.00784083)
                        Node {
                            id: leftFoot
                            objectName: "LeftFoot"
                            position: Qt.vector3d(-0.0235225, -0.168578, 0.0117612)
                            Node {
                                id: joint_47
                                objectName: "joint_47"
                                position: Qt.vector3d(-0.0196021, -0.0392042, -0.0823287)
                            }
                        }
                    }
                }
                Node {
                    id: rightUpLeg
                    objectName: "RightUpLeg"
                    position: Qt.vector3d(0.0392041, -0.0313633, 0.00784083)
                    Node {
                        id: rightLeg
                        objectName: "RightLeg"
                        position: Qt.vector3d(0.0156817, -0.1921, 0.0117612)
                        Node {
                            id: rightFoot
                            objectName: "RightFoot"
                            position: Qt.vector3d(0.0235225, -0.168578, 0.0117612)
                            Node {
                                id: joint_51
                                objectName: "joint_51"
                                position: Qt.vector3d(0.0196021, -0.0392042, -0.0823287)
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
                qtmesh_gen3d_1_1790470622153_mesh_mat_material
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
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00183078, -0.00838705, -4.66298e-05)
            }
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
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.999549, -0.00413953, -0.0296667, 0.00206988)
            }
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
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.706005, -0.697357, 0.104565, 0.065708)
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
                value: Qt.quaternion(0.908853, 0.416584, -0.0164134, -0.0132387)
            }
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
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00183078, -0.00838705, -4.66298e-05)
            }
        }
        KeyframeGroup {
            target: hips
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.98546, 0.169229, 0.00126282, -0.0151538)
            }
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
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00183078, -0.00838705, -4.66298e-05)
            }
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
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00183078, -0.00838705, -4.66298e-05)
            }
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
