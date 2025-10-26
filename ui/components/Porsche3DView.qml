import QtQuick
import QtQuick3D

Item {
    id: root
    
    property bool leftBlinker: false
    property bool rightBlinker: false
    property bool highBeam: false
    property real speed: 0
    property bool lightsOn: false
    
    signal partClicked(string part)
    
    // Real 3D Porsche Taycan Model
    View3D {
        anchors.fill: parent
        
        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.Transparent
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }
        
        // Camera - positioned for best view
        PerspectiveCamera {
            position: Qt.vector3d(0, 120, 350)
            eulerRotation.x: -10
            clipNear: 1
            clipFar: 10000
        }
        
        // Main directional light
        DirectionalLight {
            eulerRotation.x: -35
            eulerRotation.y: -45
            brightness: 1.2
            castsShadow: false
        }
        
        // Fill light
        DirectionalLight {
            eulerRotation.x: -20
            eulerRotation.y: 135
            brightness: 0.6
        }
        
        // Ambient cyan light
        PointLight {
            position: Qt.vector3d(0, 250, 0)
            brightness: root.lightsOn ? 80 : 40
            color: "#00d4ff"
            
            Behavior on brightness {
                NumberAnimation { duration: 300 }
            }
        }
        
        // Porsche Taycan 3D Model - CONVERTED with balsam!
        Porshe_taycan_tscetchab {
            id: porscheModel
            
            scale: Qt.vector3d(0.8, 0.8, 0.8)
            eulerRotation.y: -90
            position: Qt.vector3d(0, -80, 0)
            
            // Gentle rocking animation
            SequentialAnimation on eulerRotation.x {
                running: root.speed > 0
                loops: Animation.Infinite
                NumberAnimation {
                    from: 0
                    to: -1.5
                    duration: 800
                    easing.type: Easing.InOutSine
                }
                NumberAnimation {
                    from: -1.5
                    to: 0
                    duration: 800
                    easing.type: Easing.InOutSine
                }
            }
        }
        
        // Left Blinker Light
        SpotLight {
            position: Qt.vector3d(-120, 30, 150)
            eulerRotation.x: -10
            eulerRotation.y: 5
            brightness: root.leftBlinker ? 150 : 0
            color: "#ffaa00"
            coneAngle: 35
            innerConeAngle: 20
            
            Behavior on brightness {
                NumberAnimation { duration: 100 }
            }
        }
        
        // Right Blinker Light
        SpotLight {
            position: Qt.vector3d(120, 30, 150)
            eulerRotation.x: -10
            eulerRotation.y: -5
            brightness: root.rightBlinker ? 150 : 0
            color: "#ffaa00"
            coneAngle: 35
            innerConeAngle: 20
            
            Behavior on brightness {
                NumberAnimation { duration: 100 }
            }
        }
        
        // High Beam Lights
        SpotLight {
            position: Qt.vector3d(-60, 35, 180)
            eulerRotation.x: -5
            brightness: root.highBeam ? 200 : 0
            color: "#ffffff"
            coneAngle: 40
            innerConeAngle: 25
            
            Behavior on brightness {
                NumberAnimation { duration: 200 }
            }
        }
        
        SpotLight {
            position: Qt.vector3d(60, 35, 180)
            eulerRotation.x: -5
            brightness: root.highBeam ? 200 : 0
            color: "#ffffff"
            coneAngle: 40
            innerConeAngle: 25
            
            Behavior on brightness {
                NumberAnimation { duration: 200 }
            }
        }
    }
    
    // Car label removed
}

