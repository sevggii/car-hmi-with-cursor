import QtQuick
import QtQuick.Effects

// INTERACTIVE 3D-STYLE CAR
// Features: Rotatable, clickable doors, clickable lights

Item {
    id: root
    
    // Properties
    property bool leftDoorOpen: false
    property bool rightDoorOpen: false
    property bool lightsOn: false
    property real rotation3D: 0  // -30 to 30 degrees
    
    // Signals for interaction
    signal leftDoorClicked()
    signal rightDoorClicked()
    signal lightsClicked()
    
    // Mouse drag to rotate
    MouseArea {
        anchors.fill: parent
        property real startX: 0
        
        onPressed: {
            startX = mouse.x
        }
        
        onPositionChanged: {
            if (pressed) {
                var delta = mouse.x - startX
                root.rotation3D = Math.max(-30, Math.min(30, root.rotation3D + delta / 10))
                startX = mouse.x
            }
        }
    }
    
    // MAIN CAR CANVAS - 3D-style rendering
    Canvas {
        id: carCanvas
        anchors.centerIn: parent
        width: 400
        height: 500
        
        property real rotAngle: root.rotation3D * Math.PI / 180
        property real perspective: 0.5 + Math.abs(root.rotation3D) / 100
        
        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            
            var centerX = width / 2
            var centerY = height / 2
            
            // Apply perspective transformation
            var scale = 1 - Math.abs(rotAngle) * 0.15
            var skew = rotAngle * 50
            
            ctx.save()
            ctx.translate(centerX, centerY)
            
            // Shadow
            ctx.fillStyle = "#15000000"
            ctx.beginPath()
            ctx.ellipse(-100 + skew, 180, 200 - Math.abs(skew), 40)
            ctx.fill()
            
            // MAIN BODY - 3D effect
            var bodyGradient = ctx.createLinearGradient(-90, -160, 90, 160)
            bodyGradient.addColorStop(0, "#2a2a35")
            bodyGradient.addColorStop(0.4, "#1a1a25")
            bodyGradient.addColorStop(0.7, "#12121a")
            bodyGradient.addColorStop(1, "#0a0a10")
            
            ctx.fillStyle = bodyGradient
            ctx.strokeStyle = root.lightsOn ? "#00F0FF" : "#404050"
            ctx.lineWidth = 5
            
            ctx.beginPath()
            ctx.moveTo(-90 + skew * 0.8, -160)
            ctx.lineTo(90 + skew * 0.8, -160)
            ctx.lineTo(100 + skew * 0.6, 150)
            ctx.lineTo(-100 + skew * 0.6, 150)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            
            // Roof reflection
            var roofGradient = ctx.createLinearGradient(-80, -160, -30, -80)
            roofGradient.addColorStop(0, "#40ffffff")
            roofGradient.addColorStop(1, "transparent")
            ctx.fillStyle = roofGradient
            ctx.beginPath()
            ctx.moveTo(-85 + skew * 0.8, -155)
            ctx.lineTo(30 + skew * 0.8, -155)
            ctx.lineTo(20 + skew * 0.7, -80)
            ctx.lineTo(-70 + skew * 0.7, -80)
            ctx.closePath()
            ctx.fill()
            
            // WINDSHIELD
            var windGradient = ctx.createLinearGradient(0, -140, 0, -50)
            windGradient.addColorStop(0, "#00F0FF90")
            windGradient.addColorStop(0.5, "#00F0FF50")
            windGradient.addColorStop(1, "#00F0FF20")
            
            ctx.fillStyle = windGradient
            ctx.strokeStyle = "#00F0FF"
            ctx.lineWidth = 3
            ctx.beginPath()
            ctx.moveTo(-70 + skew * 0.75, -140)
            ctx.lineTo(70 + skew * 0.75, -140)
            ctx.lineTo(80 + skew * 0.7, -50)
            ctx.lineTo(-80 + skew * 0.7, -50)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            
            // REAR WINDOW
            ctx.fillStyle = "#00F0FF40"
            ctx.beginPath()
            ctx.moveTo(-70 + skew * 0.65, 40)
            ctx.lineTo(70 + skew * 0.65, 40)
            ctx.lineTo(80 + skew * 0.6, 120)
            ctx.lineTo(-80 + skew * 0.6, 120)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
            
            // LEFT DOOR (highlighted if open)
            if (root.rotation3D > -15) {
                ctx.fillStyle = root.leftDoorOpen ? "#FFA63A40" : "#1a1a25"
                ctx.strokeStyle = root.leftDoorOpen ? "#FFA63A" : "#303040"
                ctx.lineWidth = root.leftDoorOpen ? 4 : 2
                
                var doorOffset = root.leftDoorOpen ? -20 : 0
                
                ctx.beginPath()
                ctx.moveTo(-90 + skew * 0.7 + doorOffset, -30)
                ctx.lineTo(-40 + skew * 0.7 + doorOffset * 0.5, -30)
                ctx.lineTo(-35 + skew * 0.65 + doorOffset * 0.5, 80)
                ctx.lineTo(-95 + skew * 0.65 + doorOffset, 80)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                
                // Door handle
                ctx.fillStyle = "#505060"
                ctx.fillRect(-70 + skew * 0.68 + doorOffset * 0.7, 20, 15, 8)
            }
            
            // RIGHT DOOR (highlighted if open)
            if (root.rotation3D < 15) {
                ctx.fillStyle = root.rightDoorOpen ? "#FFA63A40" : "#1a1a25"
                ctx.strokeStyle = root.rightDoorOpen ? "#FFA63A" : "#303040"
                ctx.lineWidth = root.rightDoorOpen ? 4 : 2
                
                var doorOffset2 = root.rightDoorOpen ? 20 : 0
                
                ctx.beginPath()
                ctx.moveTo(40 + skew * 0.7 + doorOffset2 * 0.5, -30)
                ctx.lineTo(90 + skew * 0.7 + doorOffset2, -30)
                ctx.lineTo(95 + skew * 0.65 + doorOffset2, 80)
                ctx.lineTo(35 + skew * 0.65 + doorOffset2 * 0.5, 80)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                
                // Door handle
                ctx.fillStyle = "#505060"
                ctx.fillRect(55 + skew * 0.68 + doorOffset2 * 0.7, 20, 15, 8)
            }
            
            // WHEELS with 3D effect
            var wheelGradient = ctx.createRadialGradient(0, 0, 10, 0, 0, 35)
            wheelGradient.addColorStop(0, "#404050")
            wheelGradient.addColorStop(0.6, "#252530")
            wheelGradient.addColorStop(1, "#151520")
            
            ctx.fillStyle = wheelGradient
            ctx.strokeStyle = "#0AA9FF"
            ctx.lineWidth = 4
            
            // Front wheels
            ctx.save()
            ctx.translate(-110 + skew * 0.75, -100)
            ctx.scale(1 - Math.abs(rotAngle) * 0.5, 1)
            ctx.beginPath()
            ctx.arc(0, 0, 30, 0, Math.PI * 2)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            ctx.save()
            ctx.translate(110 + skew * 0.75, -100)
            ctx.scale(1 - Math.abs(rotAngle) * 0.5, 1)
            ctx.beginPath()
            ctx.arc(0, 0, 30, 0, Math.PI * 2)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            // Rear wheels
            ctx.save()
            ctx.translate(-110 + skew * 0.6, 100)
            ctx.scale(1 - Math.abs(rotAngle) * 0.5, 1)
            ctx.beginPath()
            ctx.arc(0, 0, 30, 0, Math.PI * 2)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            ctx.save()
            ctx.translate(110 + skew * 0.6, 100)
            ctx.scale(1 - Math.abs(rotAngle) * 0.5, 1)
            ctx.beginPath()
            ctx.arc(0, 0, 30, 0, Math.PI * 2)
            ctx.fill()
            ctx.stroke()
            ctx.restore()
            
            // HEADLIGHTS - glowing when on
            if (root.lightsOn) {
                var lightGradient = ctx.createRadialGradient(0, 0, 5, 0, 0, 25)
                lightGradient.addColorStop(0, "#ffffff")
                lightGradient.addColorStop(0.3, "#00F0FF")
                lightGradient.addColorStop(0.6, "#00F0FFaa")
                lightGradient.addColorStop(1, "#00F0FF30")
                ctx.fillStyle = lightGradient
            } else {
                ctx.fillStyle = "#303040"
            }
            
            // Front lights
            ctx.save()
            ctx.translate(-70 + skew * 0.8, -165)
            ctx.scale(1 - Math.abs(rotAngle) * 0.3, 1)
            ctx.beginPath()
            ctx.ellipse(-10, -5, 25, 12)
            ctx.fill()
            ctx.restore()
            
            ctx.save()
            ctx.translate(70 + skew * 0.8, -165)
            ctx.scale(1 - Math.abs(rotAngle) * 0.3, 1)
            ctx.beginPath()
            ctx.ellipse(-10, -5, 25, 12)
            ctx.fill()
            ctx.restore()
            
            ctx.restore()
        }
        
        Behavior on rotAngle {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
    }
    
    // CLICKABLE ZONES
    // Left door
    MouseArea {
        x: carCanvas.x + carCanvas.width / 2 - 140
        y: carCanvas.y + carCanvas.height / 2 - 30
        width: 50
        height: 110
        visible: root.rotation3D > -15
        
        onClicked: {
            root.leftDoorOpen = !root.leftDoorOpen
            root.leftDoorClicked()
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#FFA63A40" : "transparent"
            border.color: "#FFA63A"
            border.width: parent.containsMouse ? 2 : 0
            radius: 5
        }
        
        hoverEnabled: true
    }
    
    // Right door
    MouseArea {
        x: carCanvas.x + carCanvas.width / 2 + 40
        y: carCanvas.y + carCanvas.height / 2 - 30
        width: 50
        height: 110
        visible: root.rotation3D < 15
        
        onClicked: {
            root.rightDoorOpen = !root.rightDoorOpen
            root.rightDoorClicked()
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#FFA63A40" : "transparent"
            border.color: "#FFA63A"
            border.width: parent.containsMouse ? 2 : 0
            radius: 5
        }
        
        hoverEnabled: true
    }
    
    // Headlights clickable
    MouseArea {
        x: carCanvas.x + carCanvas.width / 2 - 80
        y: carCanvas.y + carCanvas.height / 2 - 180
        width: 160
        height: 30
        
        onClicked: {
            root.lightsOn = !root.lightsOn
            root.lightsClicked()
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#00F0FF40" : "transparent"
            border.color: "#00F0FF"
            border.width: parent.containsMouse ? 2 : 0
            radius: 5
        }
        
        hoverEnabled: true
    }
    
    // Redraw on property changes
    onLeftDoorOpenChanged: carCanvas.requestPaint()
    onRightDoorOpenChanged: carCanvas.requestPaint()
    onLightsOnChanged: carCanvas.requestPaint()
    onRotation3DChanged: carCanvas.requestPaint()
    
    // Instructions text
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: carCanvas.y + carCanvas.height + 10
        text: "🖱 Drag to rotate • 🚪 Click doors • 💡 Click lights"
        font.pixelSize: 12
        color: "#00F0FF"
        opacity: 0.7
    }
}

