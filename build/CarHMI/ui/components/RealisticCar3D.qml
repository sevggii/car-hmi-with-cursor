import QtQuick
import QtQuick.Effects

// REALISTIC LUXURY CAR - Premium SVG based visualization

Item {
    id: root
    
    property bool leftDoorOpen: false
    property bool rightDoorOpen: false
    property bool lightsOn: false
    property real rotationY: 0
    
    signal partClicked(string part)
    
    // Ambient glow
    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 1.4
        height: parent.height * 1.4
        radius: width / 2
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.lightsOn ? "#4000F0FF" : "#2000F0FF" }
            GradientStop { position: 0.6; color: "transparent" }
        }
        
        Behavior on opacity {
            NumberAnimation { duration: 400 }
        }
        
        SequentialAnimation on scale {
            running: root.lightsOn
            loops: Animation.Infinite
            NumberAnimation { from: 1.0; to: 1.08; duration: 2000; easing.type: Easing.InOutSine }
            NumberAnimation { from: 1.08; to: 1.0; duration: 2000; easing.type: Easing.InOutSine }
        }
    }
    
    // Main car canvas - Ultra detailed
    Canvas {
        id: carCanvas
        anchors.centerIn: parent
        width: parent.width * 0.85
        height: parent.height * 0.85
        
        property real rotAngle: root.rotationY * Math.PI / 180
        property real perspective: Math.cos(rotAngle) * 0.4 + 0.6
        property real skew: Math.sin(rotAngle) * 80
        
        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            
            var w = width
            var h = height
            var cx = w / 2
            var cy = h / 2
            var sk = skew
            var pr = perspective
            
            ctx.save()
            ctx.translate(cx, cy)
            
            // === SHADOW ===
            ctx.fillStyle = "#000000"
            ctx.globalAlpha = 0.3
            ctx.beginPath()
            ctx.ellipse(-w * 0.28 + sk * 0.3, h * 0.42, w * 0.56 * pr, h * 0.06)
            ctx.fill()
            ctx.globalAlpha = 1.0
            
            // === MAIN BODY - Luxury sedan ===
            var bodyGrad = ctx.createLinearGradient(0, -h * 0.35, 0, h * 0.35)
            bodyGrad.addColorStop(0, "#4a4a58")
            bodyGrad.addColorStop(0.2, "#3a3a45")
            bodyGrad.addColorStop(0.5, "#2a2a35")
            bodyGrad.addColorStop(0.8, "#1a1a25")
            bodyGrad.addColorStop(1, "#0a0a12")
            
            ctx.fillStyle = bodyGrad
            ctx.strokeStyle = "#505060"
            ctx.lineWidth = 3
            
            // Body outline
            ctx.beginPath()
            // Hood
            ctx.moveTo(-w * 0.26 + sk * 0.88, -h * 0.32)
            ctx.lineTo(-w * 0.08 + sk * 0.88, -h * 0.32)
            // Front
            ctx.lineTo(-w * 0.05 + sk * 0.82, -h * 0.2)
            // Roof line
            ctx.lineTo(-w * 0.03 + sk * 0.75, -h * 0.05)
            ctx.lineTo(w * 0.15 + sk * 0.6, -h * 0.05)
            // Rear
            ctx.lineTo(w * 0.2 + sk * 0.55, h * 0.05)
            ctx.lineTo(w * 0.25 + sk * 0.45, h * 0.3)
            ctx.lineTo(w * 0.22 + sk * 0.42, h * 0.35)
            // Bottom
            ctx.lineTo(-w * 0.22 + sk * 0.42, h * 0.35)
            ctx.lineTo(-w * 0.25 + sk * 0.45, h * 0.3)
            ctx.lineTo(-w * 0.28 + sk * 0.65, h * 0.1)
            ctx.lineTo(-w * 0.28 + sk * 0.82, -h * 0.2)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            
            // === ROOF ===
            ctx.fillStyle = "#25252f"
            ctx.strokeStyle = "#404050"
            ctx.lineWidth = 2
            ctx.beginPath()
            ctx.moveTo(-w * 0.15 + sk * 0.78, -h * 0.28)
            ctx.lineTo(w * 0.05 + sk * 0.78, -h * 0.28)
            ctx.lineTo(w * 0.1 + sk * 0.68, -h * 0.08)
            ctx.lineTo(-w * 0.05 + sk * 0.68, -h * 0.08)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            
            // === WINDSHIELD - Front glass ===
            var windGrad = ctx.createLinearGradient(0, -h * 0.25, 0, -h * 0.08)
            windGrad.addColorStop(0, root.lightsOn ? "#5000F0FF" : "#4000F0FF")
            windGrad.addColorStop(0.5, root.lightsOn ? "#3000F0FF" : "#2000F0FF")
            windGrad.addColorStop(1, "#1000F0FF")
            
            ctx.fillStyle = windGrad
            ctx.strokeStyle = root.lightsOn ? "#00F0FF" : "#00A0CC"
            ctx.lineWidth = 2.5
            ctx.beginPath()
            ctx.moveTo(-w * 0.13 + sk * 0.8, -h * 0.26)
            ctx.lineTo(w * 0.02 + sk * 0.8, -h * 0.26)
            ctx.lineTo(w * 0.05 + sk * 0.7, -h * 0.09)
            ctx.lineTo(-w * 0.05 + sk * 0.7, -h * 0.09)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            
            // Glass reflection
            ctx.fillStyle = "#50ffffff"
            ctx.beginPath()
            ctx.moveTo(-w * 0.11 + sk * 0.79, -h * 0.24)
            ctx.lineTo(-w * 0.02 + sk * 0.79, -h * 0.24)
            ctx.lineTo(-w * 0.01 + sk * 0.73, -h * 0.15)
            ctx.lineTo(-w * 0.1 + sk * 0.73, -h * 0.15)
            ctx.closePath()
            ctx.fill()
            
            // === SIDE WINDOWS ===
            ctx.fillStyle = "#3000A0CC"
            ctx.strokeStyle = "#00A0CC"
            ctx.lineWidth = 2
            
            // Front side window
            if (root.rotationY > -25) {
                ctx.save()
                var doorOffset = root.leftDoorOpen ? -w * 0.08 : 0
                ctx.translate(doorOffset * 0.4, doorOffset * 0.1)
                ctx.beginPath()
                ctx.moveTo(-w * 0.12 + sk * 0.73, -h * 0.18)
                ctx.lineTo(-w * 0.05 + sk * 0.73, -h * 0.18)
                ctx.lineTo(-w * 0.04 + sk * 0.67, -h * 0.05)
                ctx.lineTo(-w * 0.12 + sk * 0.67, -h * 0.05)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                ctx.restore()
            }
            
            // Rear side window
            if (root.rotationY < 25) {
                ctx.save()
                var doorOffset2 = root.rightDoorOpen ? w * 0.08 : 0
                ctx.translate(doorOffset2 * 0.4, doorOffset2 * 0.1)
                ctx.beginPath()
                ctx.moveTo(w * 0.0 + sk * 0.73, -h * 0.18)
                ctx.lineTo(w * 0.08 + sk * 0.73, -h * 0.18)
                ctx.lineTo(w * 0.09 + sk * 0.67, -h * 0.05)
                ctx.lineTo(w * 0.02 + sk * 0.67, -h * 0.05)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                ctx.restore()
            }
            
            // === DOORS ===
            ctx.strokeStyle = (root.leftDoorOpen || root.rightDoorOpen) ? "#FFA63A" : "#404050"
            ctx.lineWidth = 2
            
            // Left door
            if (root.rotationY > -20) {
                var ldOffset = root.leftDoorOpen ? -w * 0.1 : 0
                ctx.fillStyle = root.leftDoorOpen ? "#30FFA63A" : "#20303040"
                ctx.save()
                ctx.translate(ldOffset * 0.6, ldOffset * 0.12)
                ctx.beginPath()
                ctx.moveTo(-w * 0.15 + sk * 0.7, -h * 0.15)
                ctx.lineTo(-w * 0.05 + sk * 0.7, -h * 0.15)
                ctx.lineTo(-w * 0.04 + sk * 0.52, h * 0.22)
                ctx.lineTo(-w * 0.18 + sk * 0.52, h * 0.22)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                
                // Door handle
                ctx.fillStyle = root.leftDoorOpen ? "#FFA63A" : "#606070"
                ctx.fillRect(-w * 0.1 + sk * 0.61 + ldOffset * 0.4, h * 0.02, w * 0.04, h * 0.02)
                ctx.restore()
            }
            
            // Right door
            if (root.rotationY < 20) {
                var rdOffset = root.rightDoorOpen ? w * 0.1 : 0
                ctx.fillStyle = root.rightDoorOpen ? "#30FFA63A" : "#20303040"
                ctx.save()
                ctx.translate(rdOffset * 0.6, rdOffset * 0.12)
                ctx.beginPath()
                ctx.moveTo(w * 0.02 + sk * 0.7, -h * 0.15)
                ctx.lineTo(w * 0.12 + sk * 0.7, -h * 0.15)
                ctx.lineTo(w * 0.15 + sk * 0.52, h * 0.22)
                ctx.lineTo(w * 0.04 + sk * 0.52, h * 0.22)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                
                // Door handle
                ctx.fillStyle = root.rightDoorOpen ? "#FFA63A" : "#606070"
                ctx.fillRect(w * 0.07 + sk * 0.61 + rdOffset * 0.4, h * 0.02, w * 0.04, h * 0.02)
                ctx.restore()
            }
            
            // === WHEELS ===
            var wheelGrad = ctx.createRadialGradient(0, 0, w * 0.015, 0, 0, w * 0.06)
            wheelGrad.addColorStop(0, "#606070")
            wheelGrad.addColorStop(0.5, "#404050")
            wheelGrad.addColorStop(1, "#202030")
            
            ctx.strokeStyle = root.lightsOn ? "#0AA9FF" : "#0088CC"
            ctx.lineWidth = 3
            
            var wheelScale = Math.max(0.5, pr)
            
            // Draw 4 wheels
            var wheels = [
                {x: -w * 0.22, y: -h * 0.22, skm: 0.85},  // Front left
                {x: w * 0.22, y: -h * 0.22, skm: 0.85},   // Front right
                {x: -w * 0.22, y: h * 0.22, skm: 0.48},   // Rear left
                {x: w * 0.22, y: h * 0.22, skm: 0.48}     // Rear right
            ]
            
            for (var i = 0; i < wheels.length; i++) {
                var whl = wheels[i]
                ctx.save()
                ctx.translate(whl.x + sk * whl.skm, whl.y)
                ctx.scale(wheelScale, 1)
                
                ctx.fillStyle = wheelGrad
                ctx.beginPath()
                ctx.arc(0, 0, w * 0.055, 0, Math.PI * 2)
                ctx.fill()
                ctx.stroke()
                
                // Rim center
                ctx.fillStyle = "#505060"
                ctx.beginPath()
                ctx.arc(0, 0, w * 0.012, 0, Math.PI * 2)
                ctx.fill()
                
                // Spokes
                ctx.strokeStyle = "#707080"
                ctx.lineWidth = 2
                for (var s = 0; s < 5; s++) {
                    ctx.save()
                    ctx.rotate((s * Math.PI * 2) / 5)
                    ctx.beginPath()
                    ctx.moveTo(0, 0)
                    ctx.lineTo(0, w * 0.04)
                    ctx.stroke()
                    ctx.restore()
                }
                
                ctx.restore()
            }
            
            // === HEADLIGHTS ===
            if (root.lightsOn) {
                var lightGrad = ctx.createRadialGradient(0, 0, 0, 0, 0, w * 0.12)
                lightGrad.addColorStop(0, "#ffffff")
                lightGrad.addColorStop(0.25, "#00F0FF")
                lightGrad.addColorStop(0.6, "#5000F0FF")
                lightGrad.addColorStop(1, "transparent")
                ctx.fillStyle = lightGrad
            } else {
                ctx.fillStyle = "#404050"
            }
            
            // Front lights
            ctx.save()
            ctx.translate(-w * 0.24 + sk * 0.9, -h * 0.24)
            ctx.scale(pr, 1)
            ctx.beginPath()
            ctx.ellipse(0, 0, w * 0.05, h * 0.03)
            ctx.fill()
            if (root.lightsOn) {
                ctx.strokeStyle = "#00F0FF"
                ctx.lineWidth = 2
                ctx.stroke()
                
                // Light beam
                ctx.globalAlpha = 0.25
                ctx.beginPath()
                ctx.moveTo(-w * 0.03, 0)
                ctx.lineTo(-w * 0.25, -h * 0.15)
                ctx.lineTo(-w * 0.25, h * 0.15)
                ctx.closePath()
                ctx.fill()
                ctx.globalAlpha = 1.0
            }
            ctx.restore()
            
            ctx.save()
            ctx.translate(-w * 0.24 + sk * 0.9, -h * 0.29)
            ctx.scale(pr, 1)
            ctx.beginPath()
            ctx.ellipse(0, 0, w * 0.05, h * 0.03)
            ctx.fill()
            if (root.lightsOn) {
                ctx.strokeStyle = "#00F0FF"
                ctx.lineWidth = 2
                ctx.stroke()
            }
            ctx.restore()
            
            // === TAILLIGHTS ===
            ctx.fillStyle = "#40200000"
            ctx.strokeStyle = "#A04050"
            ctx.lineWidth = 2
            
            ctx.save()
            ctx.translate(w * 0.23 + sk * 0.46, h * 0.22)
            ctx.scale(pr, 1)
            ctx.beginPath()
            ctx.ellipse(0, 0, w * 0.035, h * 0.025)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            ctx.save()
            ctx.translate(w * 0.23 + sk * 0.46, h * 0.27)
            ctx.scale(pr, 1)
            ctx.beginPath()
            ctx.ellipse(0, 0, w * 0.035, h * 0.025)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            // === MIRRORS ===
            ctx.fillStyle = "#2a2a35"
            ctx.strokeStyle = "#404050"
            ctx.lineWidth = 2
            
            ctx.save()
            ctx.translate(-w * 0.16 + sk * 0.76, -h * 0.16)
            ctx.scale(pr, 1)
            ctx.beginPath()
            ctx.ellipse(0, 0, w * 0.02, h * 0.015)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            ctx.save()
            ctx.translate(w * 0.14 + sk * 0.76, -h * 0.16)
            ctx.scale(pr, 1)
            ctx.beginPath()
            ctx.ellipse(0, 0, w * 0.02, h * 0.015)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            ctx.restore()
        }
        
        Behavior on rotAngle {
            NumberAnimation { duration: 250; easing.type: Easing.OutCubic }
        }
    }
    
    // === INTERACTIVE ZONES ===
    
    // Left door
    MouseArea {
        x: carCanvas.x + carCanvas.width * 0.2
        y: carCanvas.y + carCanvas.height * 0.35
        width: carCanvas.width * 0.2
        height: carCanvas.height * 0.35
        cursorShape: Qt.PointingHandCursor
        visible: root.rotationY > -20
        
        onClicked: {
            root.leftDoorOpen = !root.leftDoorOpen
            root.partClicked("leftDoor")
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#30FFA63A" : (parent.containsMouse ? "#20FFA63A" : "transparent")
            border.color: parent.containsMouse ? "#FFA63A" : "transparent"
            border.width: 2
            radius: 6
        }
        
        hoverEnabled: true
    }
    
    // Right door
    MouseArea {
        x: carCanvas.x + carCanvas.width * 0.6
        y: carCanvas.y + carCanvas.height * 0.35
        width: carCanvas.width * 0.2
        height: carCanvas.height * 0.35
        cursorShape: Qt.PointingHandCursor
        visible: root.rotationY < 20
        
        onClicked: {
            root.rightDoorOpen = !root.rightDoorOpen
            root.partClicked("rightDoor")
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#30FFA63A" : (parent.containsMouse ? "#20FFA63A" : "transparent")
            border.color: parent.containsMouse ? "#FFA63A" : "transparent"
            border.width: 2
            radius: 6
        }
        
        hoverEnabled: true
    }
    
    // Headlights
    MouseArea {
        x: carCanvas.x + carCanvas.width * 0.08
        y: carCanvas.y + carCanvas.height * 0.3
        width: carCanvas.width * 0.15
        height: carCanvas.height * 0.25
        cursorShape: Qt.PointingHandCursor
        
        onClicked: {
            root.lightsOn = !root.lightsOn
            root.partClicked("lights")
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#3000F0FF" : (parent.containsMouse ? "#2000F0FF" : "transparent")
            border.color: parent.containsMouse ? "#00F0FF" : "transparent"
            border.width: 2
            radius: 6
        }
        
        hoverEnabled: true
    }
    
    // Drag to rotate
    MouseArea {
        anchors.fill: carCanvas
        property real startX: 0
        
        onPressed: function(mouse) {
            startX = mouse.x
        }
        
        onPositionChanged: function(mouse) {
            if (pressed) {
                var delta = mouse.x - startX
                root.rotationY = Math.max(-35, Math.min(35, root.rotationY + delta / 7))
                startX = mouse.x
                carCanvas.requestPaint()
            }
        }
    }
    
    // Status indicators
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        spacing: 12
        
        Rectangle {
            width: 55
            height: 22
            radius: 11
            color: root.leftDoorOpen ? "#35FFA63A" : "#15202030"
            border.color: root.leftDoorOpen ? "#FFA63A" : "#404050"
            border.width: 1.5
            
            Text {
                anchors.centerIn: parent
                text: "◄ Door"
                font.pixelSize: 9
                color: root.leftDoorOpen ? "#FFA63A" : "#606070"
            }
        }
        
        Rectangle {
            width: 55
            height: 22
            radius: 11
            color: root.lightsOn ? "#3500F0FF" : "#15202030"
            border.color: root.lightsOn ? "#00F0FF" : "#404050"
            border.width: 1.5
            
            Text {
                anchors.centerIn: parent
                text: "💡 Light"
                font.pixelSize: 9
                color: root.lightsOn ? "#00F0FF" : "#606070"
            }
        }
        
        Rectangle {
            width: 55
            height: 22
            radius: 11
            color: root.rightDoorOpen ? "#35FFA63A" : "#15202030"
            border.color: root.rightDoorOpen ? "#FFA63A" : "#404050"
            border.width: 1.5
            
            Text {
                anchors.centerIn: parent
                text: "Door ►"
                font.pixelSize: 9
                color: root.rightDoorOpen ? "#FFA63A" : "#606070"
            }
        }
    }
    
    // Instructions
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 28
        text: "🖱 Drag to Rotate  •  Click: Doors & Lights"
        font.pixelSize: 9
        color: "#5000F0FF"
    }
    
    // Auto-repaint on changes
    onLeftDoorOpenChanged: carCanvas.requestPaint()
    onRightDoorOpenChanged: carCanvas.requestPaint()
    onLightsOnChanged: carCanvas.requestPaint()
    onRotationYChanged: carCanvas.requestPaint()
    
    Component.onCompleted: {
        carCanvas.requestPaint()
    }
}
