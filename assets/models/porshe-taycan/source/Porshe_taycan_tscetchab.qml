import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    PrincipledMaterial {
        id: corpus1_material
        objectName: "corpus1"
        baseColor: "#ffcccccc"
    }
    PrincipledMaterial {
        id: black_plastick1_material
        objectName: "Black_plastick1"
        baseColor: "#ff191919"
    }
    PrincipledMaterial {
        id: glass_headlight_material
        objectName: "Glass_headlight"
        baseColor: "#ff820082"
    }
    PrincipledMaterial {
        id: headlight_metal1_material
        objectName: "Headlight_metal1"
        baseColor: "#ff94cccc"
    }
    PrincipledMaterial {
        id: headlight_white_color_material
        objectName: "headlight_white_color"
        baseColor: "#ff00cc7e"
    }
    PrincipledMaterial {
        id: skin_material
        objectName: "SKIN"
        baseColor: "#ff221e1e"
    }
    PrincipledMaterial {
        id: glass2_material
        objectName: "glass2"
        baseColor: "#ff0000cc"
    }
    PrincipledMaterial {
        id: black_metal1_material
        objectName: "Black_metal1"
        baseColor: "#ff191919"
    }
    PrincipledMaterial {
        id: black_glass1_material
        objectName: "Black_glass1"
        baseColor: "#ff2f2f2f"
    }
    PrincipledMaterial {
        id: carbon_black1_material
        objectName: "Carbon_black1"
        baseColor: "#ff601717"
    }
    PrincipledMaterial {
        id: red_headlight_material
        objectName: "red_headlight"
        baseColor: "#ffcc0000"
    }
    PrincipledMaterial {
        id: potolok1_material
        objectName: "Potolok1"
        baseColor: "#ffb6b6b6"
    }
    PrincipledMaterial {
        id: glass_specular_material
        objectName: "glass_specular"
        baseColor: "#ff100b0b"
        roughness: 0.7487671971321106
    }
    PrincipledMaterial {
        id: mirror_material
        objectName: "MIRROR"
        baseColor: "#ff00cc7e"
    }
    PrincipledMaterial {
        id: znack1_material
        objectName: "znack1"
        baseColor: "#ff00cc00"
    }
    PrincipledMaterial {
        id: white_plastick1_material
        objectName: "White_plastick1"
        baseColor: "#ffcccccc"
    }
    PrincipledMaterial {
        id: rubber1_material
        objectName: "Rubber1"
        baseColor: "#ff0b0b0b"
    }
    PrincipledMaterial {
        id: whel_color_black_material
        objectName: "Whel_color_black"
        baseColor: "#ff151616"
    }
    PrincipledMaterial {
        id: whel_color_white_material
        objectName: "Whel_color_white"
        baseColor: "#ffcccccc"
    }
    PrincipledMaterial {
        id: brake_material
        objectName: "brake"
        baseColor: "#ff191919"
    }
    PrincipledMaterial {
        id: lambert1_material
        objectName: "lambert1"
        baseColor: "#ff666666"
    }
    PrincipledMaterial {
        id: whell_metal_material
        objectName: "whell_metal"
        baseColor: "#ff727272"
    }

    // Nodes:
    Node {
        id: rootNode
        objectName: "RootNode"
        Node {
            id: porsche_base
            objectName: "Porsche_base"
            scale: Qt.vector3d(0.01, 0.01, 0.01)
            Node {
                id: black_glass
                objectName: "Black_glass"
            }
            Node {
                id: glass1
                objectName: "glass1"
            }
            Node {
                id: corpus
                objectName: "corpus"
            }
            Node {
                id: black_plastick
                objectName: "Black_plastick"
                Node {
                    id: headlight
                    objectName: "headlight"
                    Node {
                        id: polySurface1043
                        objectName: "polySurface1043"
                    }
                    Node {
                        id: polySurface1054
                        objectName: "polySurface1054"
                    }
                    Node {
                        id: headlight_metal
                        objectName: "Headlight_metal"
                    }
                }
            }
            Node {
                id: glass_hedlight
                objectName: "Glass_hedlight"
            }
            Node {
                id: red_hedlight
                objectName: "Red_hedlight"
            }
            Node {
                id: black_metal
                objectName: "Black_metal"
            }
            Node {
                id: glass_specular
                objectName: "Glass_specular"
            }
            Node {
                id: white_plastick
                objectName: "White_plastick"
            }
            Node {
                id: carbon_black
                objectName: "Carbon_black"
            }
            Node {
                id: skin1
                objectName: "SKIN1"
            }
            Node {
                id: mirror
                objectName: "Mirror"
            }
            Node {
                id: potolok
                objectName: "Potolok"
            }
            Node {
                id: znack
                objectName: "znack"
            }
            Node {
                id: porsche_base_Black_plastick_headlight_Headlight_metal_polySurface1055
                objectName: "Porsche_base_Black_plastick_headlight_Headlight_metal_polySurface1055"
                Node {
                    id: transform1
                    objectName: "transform1"
                }
            }
            Model {
                id: porsche_base_Mirror_polySurface1034
                objectName: "Porsche_base_Mirror_polySurface1034"
                source: "meshes/porsche_base_Mirror_polySurface1034_mesh.mesh"
                materials: [
                    mirror_material,
                    corpus1_material,
                    black_plastick1_material
                ]
            }
            Model {
                id: porsche_base_Black_plastick_polySurface1038
                objectName: "Porsche_base_Black_plastick_polySurface1038"
                source: "meshes/porsche_base_Black_plastick_polySurface1038_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: porsche_base_corpus_polySurface1088
                objectName: "Porsche_base_corpus_polySurface1088"
                source: "meshes/porsche_base_corpus_polySurface1088_mesh.mesh"
                materials: [
                    corpus1_material,
                    black_plastick1_material,
                    glass_headlight_material
                ]
            }
            Model {
                id: group27_polySurface1119
                objectName: "group27_polySurface1119"
                source: "meshes/group27_polySurface1119_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1359
                objectName: "polySurface1359"
                source: "meshes/polySurface1359_mesh.mesh"
                materials: [
                    headlight_metal1_material,
                    black_plastick1_material,
                    headlight_white_color_material,
                    glass_headlight_material
                ]
            }
            Model {
                id: polySurface32
                objectName: "polySurface32"
                source: "meshes/polySurface32_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube16
                objectName: "pCube16"
                position: Qt.vector3d(-45.7303, 46.1602, -54.2451)
                rotation: Qt.quaternion(0.712601, 0.701569, 0, 0)
                scale: Qt.vector3d(0.496656, 0.321855, 0.124043)
                source: "meshes/pCube16_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface383
                objectName: "polySurface383"
                source: "meshes/polySurface383_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface1006
                objectName: "polySurface1006"
                position: Qt.vector3d(-13.7215, 44.5291, -103.398)
                rotation: Qt.quaternion(0.0754065, 0.703075, 0.0754065, 0.703075)
                scale: Qt.vector3d(0.552069, 0.248983, 0.124043)
                source: "meshes/polySurface1006_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pPlane15
                objectName: "pPlane15"
                position: Qt.vector3d(0, 34.2166, 219.894)
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                source: "meshes/pPlane15_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface999
                objectName: "polySurface999"
                position: Qt.vector3d(0, 17.5626, -7.41076)
                source: "meshes/polySurface999_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface229
                objectName: "polySurface229"
                source: "meshes/polySurface229_mesh.mesh"
                materials: [
                    glass2_material
                ]
            }
            Model {
                id: pPlane32
                objectName: "pPlane32"
                position: Qt.vector3d(-0.568174, 60.239, -242.065)
                rotation: Qt.quaternion(0.813797, -0.58115, 0, 0)
                scale: Qt.vector3d(0.0453539, 0.0453539, 0.0453539)
                source: "meshes/pPlane32_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: pPlane23
                objectName: "pPlane23"
                position: Qt.vector3d(0, 8.77786, 219.894)
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                source: "meshes/pPlane23_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface53
                objectName: "polySurface53"
                source: "meshes/polySurface53_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: _pCylinder585
                objectName: "_pCylinder585"
                position: Qt.vector3d(-16.9288, 35.8907, -75.8117)
                rotation: Qt.quaternion(0.954132, 0.249499, -0.165261, 0.00847205)
                scale: Qt.vector3d(1.06228, 1.06228, 1.06228)
                source: "meshes/_pCylinder585_mesh.mesh"
                materials: [
                    black_metal1_material
                ]
            }
            Model {
                id: pCube21
                objectName: "pCube21"
                position: Qt.vector3d(-3.82945, 39.7407, -85.8098)
                rotation: Qt.quaternion(0.964458, -0.264238, 0, 0)
                scale: Qt.vector3d(0.496656, 0.560381, 0.124043)
                source: "meshes/pCube21_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface157
                objectName: "polySurface157"
                position: Qt.vector3d(-0.632793, 2.2556, 16.6399)
                scale: Qt.vector3d(0.936075, 0.936075, 0.936075)
                source: "meshes/polySurface157_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube4_Done14
                objectName: "pCube4_Done14"
                source: "meshes/pCube4_Done14_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube2
                objectName: "pCube2"
                position: Qt.vector3d(81.1085, 101.633, 64.9592)
                rotation: Qt.quaternion(0.988917, 0, 0, 0.148469)
                scale: Qt.vector3d(1, 1, 1)
                source: "meshes/pCube2_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1005
                objectName: "polySurface1005"
                position: Qt.vector3d(71.2168, 44.5291, -103.398)
                rotation: Qt.quaternion(0.0754065, 0.703075, 0.0754065, 0.703075)
                scale: Qt.vector3d(0.552069, 0.248983, 0.124043)
                source: "meshes/polySurface1005_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pCube24
                objectName: "pCube24"
                position: Qt.vector3d(-2.9864, 46.1602, -84.5706)
                rotation: Qt.quaternion(0.712601, 0.701569, 0, 0)
                scale: Qt.vector3d(0.496656, 0.321855, 0.124043)
                source: "meshes/pCube24_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface1037
                objectName: "polySurface1037"
                position: Qt.vector3d(-0.838349, 0, 0)
                source: "meshes/polySurface1037_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pPlane16
                objectName: "pPlane16"
                position: Qt.vector3d(0, 31.0368, 219.894)
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                source: "meshes/pPlane16_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pPlane25
                objectName: "pPlane25"
                source: "meshes/pPlane25_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface228
                objectName: "polySurface228"
                source: "meshes/polySurface228_mesh.mesh"
                materials: [
                    black_glass1_material
                ]
            }
            Model {
                id: polySurface231
                objectName: "polySurface231"
                source: "meshes/polySurface231_mesh.mesh"
                materials: [
                    black_glass1_material
                ]
            }
            Model {
                id: polySurface380
                objectName: "polySurface380"
                source: "meshes/polySurface380_mesh.mesh"
                materials: [
                    glass_headlight_material
                ]
            }
            Model {
                id: pCube32
                objectName: "pCube32"
                position: Qt.vector3d(-46.3401, 102.718, -118.662)
                rotation: Qt.quaternion(0.997739, -0.0672004, 0, 0)
                scale: Qt.vector3d(0.267623, 0.221168, 0.0668408)
                source: "meshes/pCube32_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface232
                objectName: "polySurface232"
                source: "meshes/polySurface232_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface216
                objectName: "polySurface216"
                source: "meshes/polySurface216_mesh.mesh"
                materials: [
                    glass2_material
                ]
            }
            Model {
                id: polySurface26
                objectName: "polySurface26"
                source: "meshes/polySurface26_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1013
                objectName: "polySurface1013"
                position: Qt.vector3d(-3.66842, 40.6947, -17.6335)
                scale: Qt.vector3d(1.07435, 1.07435, 1.07435)
                source: "meshes/polySurface1013_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface164
                objectName: "polySurface164"
                source: "meshes/polySurface164_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface218
                objectName: "polySurface218"
                source: "meshes/polySurface218_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1086
                objectName: "polySurface1086"
                position: Qt.vector3d(0, 0, 0.160373)
                source: "meshes/polySurface1086_mesh.mesh"
                materials: [
                    red_headlight_material
                ]
            }
            Model {
                id: pSphere3
                objectName: "pSphere3"
                source: "meshes/pSphere3_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface966
                objectName: "polySurface966"
                position: Qt.vector3d(0, -220.57, 0)
                source: "meshes/polySurface966_mesh.mesh"
                materials: [
                    potolok1_material
                ]
            }
            Model {
                id: polySurface83
                objectName: "polySurface83"
                position: Qt.vector3d(-259.585, 0, 0)
                source: "meshes/polySurface83_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube30
                objectName: "pCube30"
                position: Qt.vector3d(-46.3489, 85.9262, -114.207)
                rotation: Qt.quaternion(0.964458, -0.264238, 0, 0)
                scale: Qt.vector3d(0.496656, 0.410446, 0.124043)
                source: "meshes/pCube30_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pCube35
                objectName: "pCube35"
                position: Qt.vector3d(37.5943, 32.8722, 16.6443)
                rotation: Qt.quaternion(0.99962, -0.0274481, 0.00241255, -0.00039754)
                scale: Qt.vector3d(0.22665, 0.173494, 0.315959)
                source: "meshes/pCube35_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1087
                objectName: "polySurface1087"
                position: Qt.vector3d(0, 0, 0.160373)
                source: "meshes/polySurface1087_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pPlane27
                objectName: "pPlane27"
                position: Qt.vector3d(126.412, 44.0716, 87.2092)
                rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                scale: Qt.vector3d(0.699047, 0.699047, 0.699047)
                source: "meshes/pPlane27_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface918
                objectName: "polySurface918"
                source: "meshes/polySurface918_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface379
                objectName: "polySurface379"
                source: "meshes/polySurface379_mesh.mesh"
                materials: [
                    black_glass1_material
                ]
            }
            Model {
                id: pSphere1
                objectName: "pSphere1"
                position: Qt.vector3d(-9.85821, 35.2855, 235.347)
                scale: Qt.vector3d(0.0355244, 0.0355244, 0.0355244)
                source: "meshes/pSphere1_mesh.mesh"
                materials: [
                    glass_specular_material
                ]
            }
            Model {
                id: polySurface1014
                objectName: "polySurface1014"
                position: Qt.vector3d(-3.66842, 40.6947, -17.6335)
                scale: Qt.vector3d(1.07435, 1.07435, 1.07435)
                source: "meshes/polySurface1014_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: pPlane17
                objectName: "pPlane17"
                position: Qt.vector3d(0, 27.8569, 219.894)
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                source: "meshes/pPlane17_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface916
                objectName: "polySurface916"
                source: "meshes/polySurface916_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube22
                objectName: "pCube22"
                position: Qt.vector3d(42.818, 85.197, -113.76)
                rotation: Qt.quaternion(0.964458, -0.264238, 0, 0)
                scale: Qt.vector3d(0.496656, 0.410446, 0.124043)
                source: "meshes/pCube22_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pCube33
                objectName: "pCube33"
                position: Qt.vector3d(41.6075, 102.169, -118.588)
                rotation: Qt.quaternion(0.997739, -0.0672004, 0, 0)
                scale: Qt.vector3d(0.267623, 0.221168, 0.0668408)
                source: "meshes/pCube33_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface940
                objectName: "polySurface940"
                source: "meshes/polySurface940_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: _polySurface86
                objectName: "_polySurface86"
                source: "meshes/_polySurface86_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube27
                objectName: "pCube27"
                position: Qt.vector3d(42.5218, 46.1602, -54.1007)
                rotation: Qt.quaternion(0.712601, 0.701569, 0, 0)
                scale: Qt.vector3d(0.496656, 0.321855, 0.124043)
                source: "meshes/pCube27_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pCube36
                objectName: "pCube36"
                position: Qt.vector3d(-4.51896, 33.0376, -57.5396)
                rotation: Qt.quaternion(0.99962, -0.0274481, 0.00241255, -0.00039754)
                scale: Qt.vector3d(0.22665, 0.173494, 0.315959)
                source: "meshes/pCube36_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface183
                objectName: "polySurface183"
                source: "meshes/polySurface183_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface939
                objectName: "polySurface939"
                source: "meshes/polySurface939_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface381
                objectName: "polySurface381"
                source: "meshes/polySurface381_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface382
                objectName: "polySurface382"
                source: "meshes/polySurface382_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: _pCylinder584
                objectName: "_pCylinder584"
                position: Qt.vector3d(-35.8723, 21.8186, -56.6101)
                rotation: Qt.quaternion(0.971421, 0.214792, 0.0986355, -0.0218095)
                scale: Qt.vector3d(1.06228, 1.06228, 1.06228)
                source: "meshes/_pCylinder584_mesh.mesh"
                materials: [
                    black_metal1_material
                ]
            }
            Model {
                id: pPlane50
                objectName: "pPlane50"
                position: Qt.vector3d(82.5753, 47.5137, 191.462)
                rotation: Qt.quaternion(0.823107, 0.563328, -0.0405585, -0.059262)
                scale: Qt.vector3d(0.145432, 0.388347, 0.388347)
                source: "meshes/pPlane50_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1003
                objectName: "polySurface1003"
                position: Qt.vector3d(77.2947, 63.6532, -98.1688)
                rotation: Qt.quaternion(0.681974, -0.186844, 0.186844, 0.681974)
                scale: Qt.vector3d(0.552069, 0.248983, 0.124043)
                source: "meshes/polySurface1003_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface179
                objectName: "polySurface179"
                source: "meshes/polySurface179_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1019
                objectName: "polySurface1019"
                position: Qt.vector3d(-106.367, -12.0294, 193.472)
                rotation: Qt.quaternion(0.693894, 0.143387, 0.692044, 0.137936)
                scale: Qt.vector3d(1.04478, 1.04478, 1.04478)
                source: "meshes/polySurface1019_mesh.mesh"
                materials: [
                    znack1_material
                ]
            }
            Model {
                id: pCube26
                objectName: "pCube26"
                position: Qt.vector3d(42.5218, 46.1602, -84.5706)
                rotation: Qt.quaternion(0.712601, 0.701569, 0, 0)
                scale: Qt.vector3d(0.496656, 0.321855, 0.124043)
                source: "meshes/pCube26_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface63
                objectName: "polySurface63"
                source: "meshes/polySurface63_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pPlane14
                objectName: "pPlane14"
                position: Qt.vector3d(0, 37.3965, 219.894)
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                source: "meshes/pPlane14_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1036
                objectName: "polySurface1036"
                source: "meshes/polySurface1036_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface220
                objectName: "polySurface220"
                source: "meshes/polySurface220_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1002
                objectName: "polySurface1002"
                source: "meshes/polySurface1002_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube14
                objectName: "pCube14"
                position: Qt.vector3d(-45.7303, 46.1602, -84.5706)
                rotation: Qt.quaternion(0.712601, 0.701569, 0, 0)
                scale: Qt.vector3d(0.496656, 0.321855, 0.124043)
                source: "meshes/pCube14_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pPlane13
                objectName: "pPlane13"
                position: Qt.vector3d(0, 35.8004, 219.915)
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                source: "meshes/pPlane13_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube31
                objectName: "pCube31"
                position: Qt.vector3d(-3.02602, 85.9612, -113.654)
                rotation: Qt.quaternion(0.964458, -0.264238, 0, 0)
                scale: Qt.vector3d(0.496656, 0.410446, 0.124043)
                source: "meshes/pCube31_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pPlane49
                objectName: "pPlane49"
                position: Qt.vector3d(0.534134, 63.7123, -98.8473)
                rotation: Qt.quaternion(0.845027, 0.534699, -0.00503885, -0.000358489)
                source: "meshes/pPlane49_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: pCube19
                objectName: "pCube19"
                position: Qt.vector3d(40.6348, 39.3506, -85.5787)
                rotation: Qt.quaternion(0.964458, -0.264238, 0, 0)
                scale: Qt.vector3d(0.496656, 0.560381, 0.124043)
                source: "meshes/pCube19_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface30
                objectName: "polySurface30"
                position: Qt.vector3d(0, 0, -3.0174)
                source: "meshes/polySurface30_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1004
                objectName: "polySurface1004"
                position: Qt.vector3d(-6.26982, 63.6532, -98.1688)
                rotation: Qt.quaternion(0.681974, -0.186844, 0.186844, 0.681974)
                scale: Qt.vector3d(0.552069, 0.248983, 0.124043)
                source: "meshes/polySurface1004_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pPlane47
                objectName: "pPlane47"
                position: Qt.vector3d(-102.384, 47.2991, -182.348)
                rotation: Qt.quaternion(0.928662, 0.370928, 0, 0)
                scale: Qt.vector3d(0.247248, 0.247248, 0.247248)
                source: "meshes/pPlane47_mesh.mesh"
                materials: [
                    white_plastick1_material
                ]
            }
            Model {
                id: polySurface929
                objectName: "polySurface929"
                position: Qt.vector3d(13.4634, 82.7832, -236.6)
                rotation: Qt.quaternion(0.96078, -0.277312, 0, 0)
                scale: Qt.vector3d(0.137226, 0.137226, 0.137226)
                source: "meshes/polySurface929_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: pCube25
                objectName: "pCube25"
                position: Qt.vector3d(-2.9864, 46.1602, -54.0902)
                rotation: Qt.quaternion(0.712601, 0.701569, 0, 0)
                scale: Qt.vector3d(0.496656, 0.321855, 0.124043)
                source: "meshes/pCube25_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: pCube28
                objectName: "pCube28"
                position: Qt.vector3d(-3.67762, 103.081, -118.712)
                rotation: Qt.quaternion(0.997739, -0.0672004, 0, 0)
                scale: Qt.vector3d(0.267623, 0.221168, 0.0668408)
                source: "meshes/pCube28_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface161
                objectName: "polySurface161"
                position: Qt.vector3d(0, 0, -5.52602)
                source: "meshes/polySurface161_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1112
                objectName: "polySurface1112"
                position: Qt.vector3d(0, 11.8238, 2.38699)
                scale: Qt.vector3d(1.28053, 0.899365, 1)
                source: "meshes/polySurface1112_mesh.mesh"
                materials: [
                    mirror_material
                ]
            }
            Model {
                id: polySurface158
                objectName: "polySurface158"
                source: "meshes/polySurface158_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1016
                objectName: "polySurface1016"
                position: Qt.vector3d(-3.66842, 40.6947, -17.6335)
                scale: Qt.vector3d(1.07435, 1.07435, 1.07435)
                source: "meshes/polySurface1016_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface377
                objectName: "polySurface377"
                source: "meshes/polySurface377_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: pCube34
                objectName: "pCube34"
                position: Qt.vector3d(-2.80894, 46.3983, 6.55812)
                source: "meshes/pCube34_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface217
                objectName: "polySurface217"
                source: "meshes/polySurface217_mesh.mesh"
                materials: [
                    glass2_material
                ]
            }
            Model {
                id: polySurface1012
                objectName: "polySurface1012"
                position: Qt.vector3d(-3.66842, 40.6947, -17.6335)
                scale: Qt.vector3d(1.07435, 1.07435, 1.07435)
                source: "meshes/polySurface1012_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: pCube37
                objectName: "pCube37"
                position: Qt.vector3d(-47.6419, 32.8722, 16.6443)
                rotation: Qt.quaternion(0.99962, -0.0274481, 0.00241255, -0.00039754)
                scale: Qt.vector3d(0.22665, 0.173494, 0.315959)
                source: "meshes/pCube37_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface230
                objectName: "polySurface230"
                source: "meshes/polySurface230_mesh.mesh"
                materials: [
                    glass2_material
                ]
            }
            Model {
                id: polySurface1035
                objectName: "polySurface1035"
                source: "meshes/polySurface1035_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface1113
                objectName: "polySurface1113"
                position: Qt.vector3d(-85.2362, 0, 0)
                source: "meshes/polySurface1113_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface106group5
                objectName: "polySurface106group5"
                source: "meshes/polySurface106group5_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1011
                objectName: "polySurface1011"
                position: Qt.vector3d(-3.66842, 40.6947, -17.6335)
                scale: Qt.vector3d(1.07435, 1.07435, 1.07435)
                source: "meshes/polySurface1011_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface233
                objectName: "polySurface233"
                source: "meshes/polySurface233_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface891
                objectName: "polySurface891"
                source: "meshes/polySurface891_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface43
                objectName: "polySurface43"
                position: Qt.vector3d(0, 1.84235, -8.03128)
                source: "meshes/polySurface43_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface378
                objectName: "polySurface378"
                source: "meshes/polySurface378_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface920
                objectName: "polySurface920"
                source: "meshes/polySurface920_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface1029
                objectName: "polySurface1029"
                source: "meshes/polySurface1029_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface108
                objectName: "polySurface108"
                source: "meshes/polySurface108_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface169
                objectName: "polySurface169"
                source: "meshes/polySurface169_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1111
                objectName: "polySurface1111"
                position: Qt.vector3d(0, 11.8238, 2.38699)
                scale: Qt.vector3d(1.28053, 0.899365, 1)
                source: "meshes/polySurface1111_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface903
                objectName: "polySurface903"
                position: Qt.vector3d(204.232, -152.488, 192.231)
                rotation: Qt.quaternion(0.586253, -0.395357, -0.57383, 0.413182)
                scale: Qt.vector3d(1.35991, 1.35991, 1.35991)
                source: "meshes/polySurface903_mesh.mesh"
                materials: [
                    znack1_material
                ]
            }
            Model {
                id: polySurface971
                objectName: "polySurface971"
                source: "meshes/polySurface971_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: pCube10
                objectName: "pCube10"
                position: Qt.vector3d(-45.1891, 40.0569, -85.9971)
                rotation: Qt.quaternion(0.964458, -0.264238, 0, 0)
                scale: Qt.vector3d(0.496656, 0.560381, 0.124043)
                source: "meshes/pCube10_mesh.mesh"
                materials: [
                    skin_material
                ]
            }
            Model {
                id: polySurface1015
                objectName: "polySurface1015"
                position: Qt.vector3d(-3.66842, 40.6947, -17.6335)
                scale: Qt.vector3d(1.07435, 1.07435, 1.07435)
                source: "meshes/polySurface1015_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface215
                objectName: "polySurface215"
                source: "meshes/polySurface215_mesh.mesh"
                materials: [
                    glass2_material
                ]
            }
            Model {
                id: polySurface214
                objectName: "polySurface214"
                source: "meshes/polySurface214_mesh.mesh"
                materials: [
                    black_plastick1_material
                ]
            }
            Model {
                id: polySurface1017
                objectName: "polySurface1017"
                position: Qt.vector3d(-3.66842, 40.6947, -12.5812)
                scale: Qt.vector3d(1.07435, 1.07435, 1.07435)
                source: "meshes/polySurface1017_mesh.mesh"
                materials: [
                    carbon_black1_material
                ]
            }
            Model {
                id: polySurface895
                objectName: "polySurface895"
                source: "meshes/polySurface895_mesh.mesh"
                materials: [
                    corpus1_material
                ]
            }
            Model {
                id: polySurface1596
                objectName: "polySurface1596"
                position: Qt.vector3d(0.127316, 0, -291.301)
                source: "meshes/polySurface1596_mesh.mesh"
                materials: [
                    znack1_material
                ]
            }
            Model {
                id: polySurface1534
                objectName: "polySurface1534"
                source: "meshes/polySurface1534_mesh.mesh"
                materials: [
                    rubber1_material,
                    whel_color_black_material,
                    whel_color_white_material,
                    brake_material,
                    lambert1_material,
                    whell_metal_material
                ]
            }
            Model {
                id: polySurface1597
                objectName: "polySurface1597"
                position: Qt.vector3d(0, -104.894, -203.053)
                rotation: Qt.quaternion(0.89331, -0.44944, 0, 0)
                source: "meshes/polySurface1597_mesh.mesh"
                materials: [
                    rubber1_material,
                    whel_color_black_material,
                    whel_color_white_material,
                    brake_material,
                    lambert1_material,
                    whell_metal_material
                ]
            }
            Model {
                id: polySurface1598
                objectName: "polySurface1598"
                position: Qt.vector3d(0.127316, 0, 0)
                source: "meshes/polySurface1598_mesh.mesh"
                materials: [
                    znack1_material
                ]
            }
        }
    }

    // Animations:
}
