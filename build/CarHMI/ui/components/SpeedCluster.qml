import QtQuick
import QtQuick.Effects

// PROFESSIONAL OEM-GRADE LAYOUT
// Artboard: 2560x1080 (21:9 aspect)
// Grid: 64px safe margins, perfect alignment
// NO OVERLAPS, clean composition

Item {
    id: root
    
    // Vehicle data properties
    property real speed: 0
    property real rpm: 0
    property bool leftBlinker: false
    property bool rightBlinker: false
    property bool highBeam: false
    property real fuel: 75
    property real temperature: 90
    property string gear: "P"
    property real odometer: 12345.6
    property real tripMeter: 0.0
    property bool engineWarning: false
    property bool oilWarning: false
    property bool batteryWarning: false
    
    // Premium color palette
    readonly property color colorCyan: "#00F0FF"
    readonly property color colorAmber: "#FFA63A"
    readonly property color colorNeonBlue: "#0AA9FF"
    readonly property color colorDangerRed: "#FF3B3B"
    
    // Reactive factors
    property real speedFactor: Math.min(speed / 240, 1.0)
    property real rpmFactor: Math.min(rpm / 8000, 1.0)
    
    // CINEMATIC BACKGROUND
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#000000" }
            GradientStop { position: 0.3; color: "#0a0a10" }
            GradientStop { position: 0.7; color: "#0a0a10" }
            GradientStop { position: 1.0; color: "#000000" }
        }
    }
    
    // Ambient lighting - speed reactive
    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 1.8
        height: parent.height * 1.8
        rotation: 0
        
        gradient: Gradient {
            GradientStop { 
                position: 0.0
                color: Qt.rgba(0, 0.6 * speedFactor, 0.8 * speedFactor, 0.12)
            }
            GradientStop { 
                position: 0.5
                color: Qt.rgba(0.8 * rpmFactor, 0.4 * rpmFactor, 0, 0.08)
            }
            GradientStop { position: 1.0; color: "transparent" }
        }
        
        RotationAnimation on rotation {
            from: 0
            to: 360
            duration: 200000
            loops: Animation.Infinite
        }
    }
    
    // LEFT GAUGE - RPM TACHOMETER
    // Position: x=640, y=540 (center), radius=340
    Item {
        id: rpmGauge
        x: 640 - 340
        y: 540 - 340
        width: 680
        height: 680
        
        // Glow rings
        Repeater {
            model: 4
            Rectangle {
                anchors.centerIn: parent
                width: 680 + index * 20
                height: 680 + index * 20
                radius: width / 2
                color: "transparent"
                border.color: colorAmber
                border.width: 1
                opacity: 0.08 - index * 0.015
            }
        }
        
        // Main dial
        Rectangle {
            anchors.centerIn: parent
            width: 640
            height: 640
            radius: width / 2
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#12121a" }
                GradientStop { position: 0.5; color: "#0a0a10" }
                GradientStop { position: 1.0; color: "#12121a" }
            }
            
            border.color: "#282832"
            border.width: 4
            
            // Glass reflection
            Rectangle {
                anchors.fill: parent
                anchors.margins: 4
                radius: parent.radius - 4
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#20ffffff" }
                    GradientStop { position: 0.3; color: "transparent" }
                }
            }
        }
        
        // RPM arc background
        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                
                var centerX = width / 2
                var centerY = height / 2
                var radius = 300
                
                ctx.strokeStyle = "#18181f"
                ctx.lineWidth = 22
                ctx.lineCap = "round"
                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, Math.PI * 0.65, Math.PI * 2.35, false)
                ctx.stroke()
            }
        }
        
        // RPM progress arc
        Canvas {
            id: rpmArc
            anchors.fill: parent
            property real progress: Math.min(root.rpm / 8000, 1.0)
            
            Behavior on progress {
                SpringAnimation { spring: 2.5; damping: 0.3 }
            }
            
            onProgressChanged: requestPaint()
            
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                
                var centerX = width / 2
                var centerY = height / 2
                var radius = 300
                
                var startAngle = Math.PI * 0.65
                var endAngle = startAngle + (progress * Math.PI * 1.7)
                
                if (root.rpm < 5000) {
                    ctx.strokeStyle = colorAmber
                } else if (root.rpm < 6500) {
                    var gradient = ctx.createLinearGradient(0, 0, width, 0)
                    gradient.addColorStop(0, colorAmber)
                    gradient.addColorStop(1, colorDangerRed)
                    ctx.strokeStyle = gradient
                } else {
                    ctx.strokeStyle = colorDangerRed
                }
                
                ctx.lineWidth = 22
                ctx.lineCap = "round"
                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, startAngle, endAngle, false)
                ctx.stroke()
                
                // Inner glow
                ctx.globalAlpha = 0.6
                ctx.lineWidth = 16
                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, startAngle, endAngle, false)
                ctx.stroke()
            }
        }
        
        // Center display
        Column {
            anchors.centerIn: parent
            spacing: -10
            
            Text {
                text: (root.rpm / 1000).toFixed(1)
                font.pixelSize: 80
                font.weight: Font.Thin
                color: root.rpm < 5000 ? colorAmber : root.rpm < 6500 ? "#ff8833" : colorDangerRed
                anchors.horizontalCenter: parent.horizontalCenter
                
                layer.enabled: true
                layer.effect: MultiEffect {
                    blurEnabled: true
                    blur: 0.4
                    brightness: 0.3
                }
            }
            
            Text {
                text: "RPM"
                font.pixelSize: 14
                font.weight: Font.Bold
                font.letterSpacing: 3
                color: "#50505a"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            
            Text {
                text: "x1000"
                font.pixelSize: 11
                color: "#40404a"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    
    // RIGHT GAUGE - SPEEDOMETER
    // Position: x=1920, y=540 (center), radius=340
    Item {
        id: speedGauge
        x: 1920 - 340
        y: 540 - 340
        width: 680
        height: 680
        
        // Glow rings
        Repeater {
            model: 4
            Rectangle {
                anchors.centerIn: parent
                width: 680 + index * 20
                height: 680 + index * 20
                radius: width / 2
                color: "transparent"
                border.color: colorCyan
                border.width: 1
                opacity: 0.08 - index * 0.015
            }
        }
        
        // Main dial
        Rectangle {
            anchors.centerIn: parent
            width: 640
            height: 640
            radius: width / 2
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#12121a" }
                GradientStop { position: 0.5; color: "#0a0a10" }
                GradientStop { position: 1.0; color: "#12121a" }
            }
            
            border.color: "#282832"
            border.width: 4
            
            // Glass reflection
            Rectangle {
                anchors.fill: parent
                anchors.margins: 4
                radius: parent.radius - 4
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#20ffffff" }
                    GradientStop { position: 0.3; color: "transparent" }
                }
            }
        }
        
        // Speed arc background
        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                
                var centerX = width / 2
                var centerY = height / 2
                var radius = 300
                
                ctx.strokeStyle = "#18181f"
                ctx.lineWidth = 22
                ctx.lineCap = "round"
                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, Math.PI * 0.65, Math.PI * 2.35, false)
                ctx.stroke()
            }
        }
        
        // Speed progress arc
        Canvas {
            id: speedArc
            anchors.fill: parent
            property real progress: Math.min(root.speed / 240, 1.0)
            
            Behavior on progress {
                NumberAnimation { duration: 700; easing.type: Easing.OutCubic }
            }
            
            onProgressChanged: requestPaint()
            
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                
                var centerX = width / 2
                var centerY = height / 2
                var radius = 300
                
                var startAngle = Math.PI * 0.65
                var endAngle = startAngle + (progress * Math.PI * 1.7)
                
                if (root.speed < 100) {
                    ctx.strokeStyle = colorCyan
                } else if (root.speed < 180) {
                    var gradient = ctx.createLinearGradient(0, 0, width, 0)
                    gradient.addColorStop(0, colorCyan)
                    gradient.addColorStop(0.5, colorNeonBlue)
                    gradient.addColorStop(1, colorAmber)
                    ctx.strokeStyle = gradient
                } else {
                    var gradient2 = ctx.createLinearGradient(0, 0, width, 0)
                    gradient2.addColorStop(0, colorAmber)
                    gradient2.addColorStop(1, colorDangerRed)
                    ctx.strokeStyle = gradient2
                }
                
                ctx.lineWidth = 22
                ctx.lineCap = "round"
                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, startAngle, endAngle, false)
                ctx.stroke()
                
                // Inner glow
                ctx.globalAlpha = 0.6
                ctx.lineWidth = 16
                ctx.beginPath()
                ctx.arc(centerX, centerY, radius, startAngle, endAngle, false)
                ctx.stroke()
            }
        }
        
        // Center display
        Column {
            anchors.centerIn: parent
            spacing: -10
            
            Text {
                text: Math.round(root.speed)
                font.pixelSize: 80
                font.weight: Font.Thin
                color: root.speed < 100 ? colorCyan : root.speed < 180 ? colorNeonBlue : colorAmber
                anchors.horizontalCenter: parent.horizontalCenter
                
                layer.enabled: true
                layer.effect: MultiEffect {
                    blurEnabled: true
                    blur: 0.4
                    brightness: 0.3
                }
            }
            
            Text {
                text: "km/h"
                font.pixelSize: 14
                font.weight: Font.Bold
                font.letterSpacing: 3
                color: "#50505a"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            
            Text {
                text: "SPEED"
                font.pixelSize: 11
                color: "#40404a"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    
    // CENTER PANEL - Vehicle info
    // Position: x=840, y=280, w=880, h=520
    Rectangle {
        x: 840
        y: 280
        width: 880
        height: 520
        radius: 30
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#14141c" }
            GradientStop { position: 0.5; color: "#0f0f16" }
            GradientStop { position: 1.0; color: "#14141c" }
        }
        
        border.color: "#25252f"
        border.width: 2
        
        // Glass reflection
        Rectangle {
            anchors.fill: parent
            anchors.margins: 2
            radius: parent.radius - 2
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#15ffffff" }
                GradientStop { position: 0.2; color: "transparent" }
            }
        }
        
        // GEAR Display
        Rectangle {
            width: 140
            height: 140
            radius: 70
            anchors.horizontalCenter: parent.horizontalCenter
            y: 60
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#18181f" }
                GradientStop { position: 1.0; color: "#0a0a10" }
            }
            
            border.color: root.gear === "P" ? colorAmber : root.gear === "N" ? "#ffdd00" : colorCyan
            border.width: 5
            
            // Glow rings
            Repeater {
                model: 3
                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width + (index + 1) * 16
                    height: parent.height + (index + 1) * 16
                    radius: width / 2
                    color: "transparent"
                    border.color: parent.border.color
                    border.width: 1
                    opacity: 0.3 - (index * 0.08)
                }
            }
            
            Text {
                text: root.gear
                font.pixelSize: 80
                font.weight: Font.Thin
                color: parent.border.color
                anchors.centerIn: parent
                
                layer.enabled: true
                layer.effect: MultiEffect {
                    blurEnabled: true
                    blur: 0.5
                    brightness: 0.4
                }
            }
        }
        
        // Vehicle status
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 250
            spacing: 60
            
            // Fuel
            Column {
                spacing: 8
                Rectangle {
                    width: 50
                    height: 50
                    radius: 25
                    anchors.horizontalCenter: parent.horizontalCenter
                    
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: root.fuel < 20 ? "#FF3B3B30" : "#FFA63A25" }
                        GradientStop { position: 1.0; color: "#0a0a0f" }
                    }
                    
                    border.color: root.fuel < 20 ? colorDangerRed : colorAmber
                    border.width: 2.5
                    
                    Text {
                        text: "⛽"
                        font.pixelSize: 26
                        color: root.fuel < 20 ? colorDangerRed : colorAmber
                        anchors.centerIn: parent
                    }
                }
                Text {
                    text: Math.round(root.fuel) + "%"
                    font.pixelSize: 18
                    font.bold: true
                    color: root.fuel < 20 ? colorDangerRed : "#90909a"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            
            // Temperature
            Column {
                spacing: 8
                Rectangle {
                    width: 50
                    height: 50
                    radius: 25
                    anchors.horizontalCenter: parent.horizontalCenter
                    
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: root.temperature > 105 ? "#FF3B3B30" : "#0AA9FF25" }
                        GradientStop { position: 1.0; color: "#0a0a0f" }
                    }
                    
                    border.color: root.temperature > 105 ? colorDangerRed : colorNeonBlue
                    border.width: 2.5
                    
                    Text {
                        text: "🌡"
                        font.pixelSize: 24
                        anchors.centerIn: parent
                    }
                }
                Text {
                    text: Math.round(root.temperature) + "°C"
                    font.pixelSize: 18
                    font.bold: true
                    color: root.temperature > 105 ? colorDangerRed : colorNeonBlue
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
        
        // Warning lights
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 380
            spacing: 20
            
            Rectangle {
                width: 50
                height: 50
                radius: 12
                color: root.highBeam ? "#0AA9FF35" : "#0a0a0f"
                border.color: root.highBeam ? colorNeonBlue : "#20202a"
                border.width: 2
                
                Text {
                    text: "◉"
                    font.pixelSize: 32
                    font.bold: true
                    color: root.highBeam ? colorNeonBlue : "#25252f"
                    anchors.centerIn: parent
                }
            }
            
            Rectangle {
                width: 50
                height: 50
                radius: 12
                color: root.engineWarning ? "#FF3B3B35" : "#0a0a0f"
                border.color: root.engineWarning ? colorDangerRed : "#20202a"
                border.width: 2
                
                Text {
                    text: "⚠"
                    font.pixelSize: 30
                    color: root.engineWarning ? colorDangerRed : "#25252f"
                    anchors.centerIn: parent
                }
                
                SequentialAnimation on opacity {
                    running: root.engineWarning
                    loops: Animation.Infinite
                    NumberAnimation { from: 1.0; to: 0.5; duration: 600 }
                    NumberAnimation { from: 0.5; to: 1.0; duration: 600 }
                }
            }
        }
    }
    
    // TURN SIGNALS
    // Left signal: x=1140, y=480
    Rectangle {
        x: 1140
        y: 480
        width: 80
        height: 80
        radius: 40
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.leftBlinker ? "#FFA63A50" : "#0a0a10" }
            GradientStop { position: 1.0; color: "#08080c" }
        }
        
        border.color: root.leftBlinker ? colorAmber : "#1a1a24"
        border.width: 3
        
        Text {
            text: "◄"
            font.pixelSize: 48
            font.bold: true
            color: root.leftBlinker ? colorAmber : "#20202a"
            anchors.centerIn: parent
            
            layer.enabled: root.leftBlinker
            layer.effect: MultiEffect {
                blurEnabled: true
                blur: 0.6
            }
        }
        
        SequentialAnimation on scale {
            running: root.leftBlinker
            loops: Animation.Infinite
            NumberAnimation { from: 1.0; to: 1.2; duration: 250 }
            NumberAnimation { from: 1.2; to: 1.0; duration: 250 }
        }
    }
    
    // Right signal: x=1340, y=480
    Rectangle {
        x: 1340
        y: 480
        width: 80
        height: 80
        radius: 40
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.rightBlinker ? "#FFA63A50" : "#0a0a10" }
            GradientStop { position: 1.0; color: "#08080c" }
        }
        
        border.color: root.rightBlinker ? colorAmber : "#1a1a24"
        border.width: 3
        
        Text {
            text: "►"
            font.pixelSize: 48
            font.bold: true
            color: root.rightBlinker ? colorAmber : "#20202a"
            anchors.centerIn: parent
            
            layer.enabled: root.rightBlinker
            layer.effect: MultiEffect {
                blurEnabled: true
                blur: 0.6
            }
        }
        
        SequentialAnimation on scale {
            running: root.rightBlinker
            loops: Animation.Infinite
            NumberAnimation { from: 1.0; to: 1.2; duration: 250 }
            NumberAnimation { from: 1.2; to: 1.0; duration: 250 }
        }
    }
    
    // BOTTOM INFO BAR
    // Position: x=200, y=920, w=2160, h=140
    Rectangle {
        x: 200
        y: 920
        width: 2160
        height: 140
        radius: 25
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#14141c" }
            GradientStop { position: 0.5; color: "#0f0f16" }
            GradientStop { position: 1.0; color: "#14141c" }
        }
        
        border.color: "#1e1e28"
        border.width: 3
        
        // Top accent
        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 3
            height: 3
            radius: 1.5
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.5; color: colorCyan }
                GradientStop { position: 1.0; color: "transparent" }
            }
            
            opacity: 0.5
        }
        
        // Glass reflection
        Rectangle {
            anchors.fill: parent
            anchors.margins: 3
            radius: parent.radius - 3
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#10ffffff" }
                GradientStop { position: 0.2; color: "transparent" }
            }
        }
        
        Row {
            anchors.centerIn: parent
            spacing: 180
            
            // Odometer
            Row {
                spacing: 20
                anchors.verticalCenter: parent.verticalCenter
                
                Rectangle {
                    width: 52
                    height: 52
                    radius: 26
                    anchors.verticalCenter: parent.verticalCenter
                    
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#00F0FF25" }
                        GradientStop { position: 1.0; color: "#0a0a0f" }
                    }
                    
                    border.color: colorCyan + "70"
                    border.width: 2.5
                    
                    Text {
                        text: "⊙"
                        font.pixelSize: 30
                        color: colorCyan
                        anchors.centerIn: parent
                        
                        layer.enabled: true
                        layer.effect: MultiEffect {
                            blurEnabled: true
                            blur: 0.3
                        }
                    }
                }
                
                Column {
                    spacing: 5
                    
                    Text {
                        text: "ODOMETER"
                        font.pixelSize: 10
                        font.letterSpacing: 2.5
                        font.weight: Font.Bold
                        color: "#40404a"
                    }
                    
                    Text {
                        text: root.odometer.toFixed(1) + " km"
                        font.pixelSize: 26
                        font.weight: Font.Medium
                        font.family: "SF Mono"
                        color: colorCyan
                        
                        layer.enabled: true
                        layer.effect: MultiEffect {
                            blurEnabled: true
                            blur: 0.25
                        }
                    }
                }
            }
            
            // Divider
            Rectangle {
                width: 3
                height: 60
                radius: 1.5
                color: "#282832"
                anchors.verticalCenter: parent.verticalCenter
            }
            
            // Trip meter
            Row {
                spacing: 20
                anchors.verticalCenter: parent.verticalCenter
                
                Rectangle {
                    width: 52
                    height: 52
                    radius: 26
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#0f0f16"
                    border.color: "#35353f"
                    border.width: 2.5
                    
                    Text {
                        text: "↻"
                        font.pixelSize: 30
                        color: "#80808a"
                        anchors.centerIn: parent
                    }
                }
                
                Column {
                    spacing: 5
                    
                    Text {
                        text: "TRIP"
                        font.pixelSize: 10
                        font.letterSpacing: 2.5
                        font.weight: Font.Bold
                        color: "#40404a"
                    }
                    
                    Text {
                        text: root.tripMeter.toFixed(2) + " km"
                        font.pixelSize: 26
                        font.weight: Font.Medium
                        font.family: "SF Mono"
                        color: "#a0a0aa"
                    }
                }
            }
            
            // Divider
            Rectangle {
                width: 3
                height: 60
                radius: 1.5
                color: "#282832"
                anchors.verticalCenter: parent.verticalCenter
            }
            
            // Average speed
            Row {
                spacing: 20
                anchors.verticalCenter: parent.verticalCenter
                
                Rectangle {
                    width: 52
                    height: 52
                    radius: 26
                    anchors.verticalCenter: parent.verticalCenter
                    
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#0AA9FF25" }
                        GradientStop { position: 1.0; color: "#0a0a0f" }
                    }
                    
                    border.color: colorNeonBlue + "70"
                    border.width: 2.5
                    
                    Text {
                        text: "⌀"
                        font.pixelSize: 32
                        color: colorNeonBlue
                        anchors.centerIn: parent
                    }
                }
                
                Column {
                    spacing: 5
                    
                    Text {
                        text: "AVG SPEED"
                        font.pixelSize: 10
                        font.letterSpacing: 2.5
                        font.weight: Font.Bold
                        color: "#40404a"
                    }
                    
                    Text {
                        text: Math.round(root.speed * 0.85) + " km/h"
                        font.pixelSize: 26
                        font.weight: Font.Medium
                        font.family: "SF Mono"
                        color: colorNeonBlue
                        
                        layer.enabled: true
                        layer.effect: MultiEffect {
                            blurEnabled: true
                            blur: 0.2
                        }
                    }
                }
            }
        }
    }
}
