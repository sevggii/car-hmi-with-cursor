import QtQuick
import QtQuick.Effects

// LUXURY 3D CAR VISUALIZATION
// Inspired by Audi Virtual Cockpit, Mercedes MBUX, Kanzi Rightware

Item {
    id: root
    
    // Properties
    property bool leftDoorOpen: false
    property bool rightDoorOpen: false
    property bool hoodOpen: false
    property bool trunkOpen: false
    property bool lightsOn: false
    property real rotationY: 0  // -45 to 45 degrees
    
    // Signals
    signal partClicked(string part)
    
    // MAIN 3D CAR VISUALIZATION
    Item {
        id: carContainer
        anchors.centerIn: parent
        width: parent.width * 0.85
        height: parent.height * 0.85
        
        // Ambient glow background
        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 1.4
            height: parent.height * 1.4
            radius: width / 2
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: root.lightsOn ? "#30 00F0FF" : "#1500F0FF" }
                GradientStop { position: 0.7; color: "transparent" }
                GradientStop { position: 1.0; color: "transparent" }
            }
            
            Behavior on opacity {
                NumberAnimation { duration: 400; easing.type: Easing.OutCubic }
            }
        }
        
        // LUXURY CAR BODY - Realistic 3D representation
        Canvas {
            id: carCanvas
            anchors.fill: parent
            
            property real perspective: Math.cos(root.rotationY * Math.PI / 180) * 0.3 + 0.7
            property real skewX: Math.sin(root.rotationY * Math.PI / 180) * 100
            
            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                
                var cw = width
                var ch = height
                var cx = cw / 2
                var cy = ch / 2
                
                var skew = skewX
                var persp = perspective
                
                ctx.save()
                ctx.translate(cx, cy)
                
                // Shadow - realistic ground shadow
                ctx.save()
                ctx.globalAlpha = 0.4
                ctx.fillStyle = "#000000"
                ctx.beginPath()
                ctx.ellipse(-cw * 0.35 + skew * 0.3, ch * 0.38, cw * 0.7 * persp, ch * 0.08)
                ctx.fill()
                ctx.restore()
                
                // === CAR BODY - Luxury sedan style ===
                
                // Main body gradient - metallic look
                var bodyGrad = ctx.createLinearGradient(0, -ch * 0.4, 0, ch * 0.4)
                bodyGrad.addColorStop(0, "#3a3a48")
                bodyGrad.addColorStop(0.15, "#2a2a35")
                bodyGrad.addColorStop(0.5, "#1a1a25")
                bodyGrad.addColorStop(0.85, "#12121a")
                bodyGrad.addColorStop(1, "#0a0a12")
                
                ctx.fillStyle = bodyGrad
                ctx.strokeStyle = "#404050"
                ctx.lineWidth = 3
                
                // Car body outline - luxury sedan shape
                ctx.beginPath()
                // Hood
                ctx.moveTo(-cw * 0.3 + skew * 0.85, -ch * 0.35)
                ctx.lineTo(cw * 0.3 + skew * 0.85, -ch * 0.35)
                // Right side
                ctx.lineTo(cw * 0.35 + skew * 0.7, -ch * 0.2)
                ctx.lineTo(cw * 0.38 + skew * 0.5, ch * 0.1)
                ctx.lineTo(cw * 0.35 + skew * 0.4, ch * 0.35)
                // Trunk
                ctx.lineTo(cw * 0.25 + skew * 0.4, ch * 0.35)
                ctx.lineTo(-cw * 0.25 + skew * 0.4, ch * 0.35)
                // Left side  
                ctx.lineTo(-cw * 0.35 + skew * 0.4, ch * 0.35)
                ctx.lineTo(-cw * 0.38 + skew * 0.5, ch * 0.1)
                ctx.lineTo(-cw * 0.35 + skew * 0.7, -ch * 0.2)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                
                // === WINDSHIELD - Glossy glass effect ===
                var windGrad = ctx.createLinearGradient(0, -ch * 0.3, 0, -ch * 0.05)
                windGrad.addColorStop(0, root.lightsOn ? "#4000F0FF" : "#3000F0FF")
                windGrad.addColorStop(0.5, root.lightsOn ? "#2000F0FF" : "#1500F0FF")
                windGrad.addColorStop(1, "transparent")
                
                ctx.fillStyle = windGrad
                ctx.strokeStyle = root.lightsOn ? "#00F0FF" : "#00A0CC"
                ctx.lineWidth = 2.5
                
                ctx.beginPath()
                ctx.moveTo(-cw * 0.25 + skew * 0.82, -ch * 0.32)
                ctx.lineTo(cw * 0.25 + skew * 0.82, -ch * 0.32)
                ctx.lineTo(cw * 0.28 + skew * 0.7, -ch * 0.08)
                ctx.lineTo(-cw * 0.28 + skew * 0.7, -ch * 0.08)
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
                
                // Glass highlights - realistic reflections
                ctx.fillStyle = "#40ffffff"
                ctx.beginPath()
                ctx.moveTo(-cw * 0.22 + skew * 0.82, -ch * 0.3)
                ctx.lineTo(cw * 0.1 + skew * 0.82, -ch * 0.3)
                ctx.lineTo(cw * 0.08 + skew * 0.75, -ch * 0.15)
                ctx.lineTo(-cw * 0.24 + skew * 0.75, -ch * 0.15)
                ctx.closePath()
                ctx.fill()
                
                // === ROOF - Subtle gradient ===
                ctx.fillStyle = "#25252f"
                ctx.beginPath()
                ctx.moveTo(-cw * 0.28 + skew * 0.78, -ch * 0.25)
                ctx.lineTo(cw * 0.28 + skew * 0.78, -ch * 0.25)
                ctx.lineTo(cw * 0.3 + skew * 0.68, -ch * 0.05)
                ctx.lineTo(-cw * 0.3 + skew * 0.68, -ch * 0.05)
                ctx.closePath()
                ctx.fill()
                
                // === SIDE WINDOWS ===
                ctx.fillStyle = "#20303540"
                ctx.strokeStyle = "#00A0CC"
                ctx.lineWidth = 2
                
                // Left window (if visible)
                if (root.rotationY > -30) {
                    var doorOffsetL = root.leftDoorOpen ? -cw * 0.08 : 0
                    ctx.save()
                    ctx.translate(doorOffsetL * 0.5, 0)
                    ctx.beginPath()
                    ctx.moveTo(-cw * 0.32 + skew * 0.73, -ch * 0.15)
                    ctx.lineTo(-cw * 0.3 + skew * 0.73, -ch * 0.08)
                    ctx.lineTo(-cw * 0.3 + skew * 0.6, 0.05)
                    ctx.lineTo(-cw * 0.33 + skew * 0.6, -ch * 0.02)
                    ctx.closePath()
                    ctx.fill()
                    ctx.stroke()
                    ctx.restore()
                }
                
                // Right window (if visible)
                if (root.rotationY < 30) {
                    var doorOffsetR = root.rightDoorOpen ? cw * 0.08 : 0
                    ctx.save()
                    ctx.translate(doorOffsetR * 0.5, 0)
                    ctx.beginPath()
                    ctx.moveTo(cw * 0.32 + skew * 0.73, -ch * 0.15)
                    ctx.lineTo(cw * 0.3 + skew * 0.73, -ch * 0.08)
                    ctx.lineTo(cw * 0.3 + skew * 0.6, 0.05)
                    ctx.lineTo(cw * 0.33 + skew * 0.6, -ch * 0.02)
                    ctx.closePath()
                    ctx.fill()
                    ctx.stroke()
                    ctx.restore()
                }
                
                // === DOORS (with open/close animation) ===
                ctx.strokeStyle = root.leftDoorOpen || root.rightDoorOpen ? "#FFA63A" : "#303040"
                ctx.lineWidth = 2.5
                
                // Left door
                if (root.rotationY > -20) {
                    var ldOffset = root.leftDoorOpen ? -cw * 0.12 : 0
                    ctx.fillStyle = root.leftDoorOpen ? "#25FFA63A" : "#15202030"
                    
                    ctx.save()
                    ctx.translate(ldOffset * 0.7, ldOffset * 0.15)
                    ctx.beginPath()
                    ctx.moveTo(-cw * 0.33 + skew * 0.68, -ch * 0.12)
                    ctx.lineTo(-cw * 0.15 + skew * 0.68, -ch * 0.12)
                    ctx.lineTo(-cw * 0.13 + skew * 0.52, ch * 0.22)
                    ctx.lineTo(-cw * 0.35 + skew * 0.52, ch * 0.22)
                    ctx.closePath()
                    ctx.fill()
                    ctx.stroke()
                    
                    // Door handle
                    ctx.fillStyle = root.leftDoorOpen ? "#FFA63A" : "#505060"
                    ctx.fillRect(-cw * 0.24 + skew * 0.6 + ldOffset * 0.5, ch * 0.02, cw * 0.05, ch * 0.025)
                    ctx.restore()
                }
                
                // Right door
                if (root.rotationY < 20) {
                    var rdOffset = root.rightDoorOpen ? cw * 0.12 : 0
                    ctx.fillStyle = root.rightDoorOpen ? "#25FFA63A" : "#15202030"
                    
                    ctx.save()
                    ctx.translate(rdOffset * 0.7, rdOffset * 0.15)
                    ctx.beginPath()
                    ctx.moveTo(cw * 0.15 + skew * 0.68, -ch * 0.12)
                    ctx.lineTo(cw * 0.33 + skew * 0.68, -ch * 0.12)
                    ctx.lineTo(cw * 0.35 + skew * 0.52, ch * 0.22)
                    ctx.lineTo(cw * 0.13 + skew * 0.52, ch * 0.22)
                    ctx.closePath()
                    ctx.fill()
                    ctx.stroke()
                    
                    // Door handle
                    ctx.fillStyle = root.rightDoorOpen ? "#FFA63A" : "#505060"
                    ctx.fillRect(cw * 0.19 + skew * 0.6 + rdOffset * 0.5, ch * 0.02, cw * 0.05, ch * 0.025)
                    ctx.restore()
                }
                
                // === WHEELS - 3D effect ===
                var wheelGrad = ctx.createRadialGradient(0, 0, cw * 0.02, 0, 0, cw * 0.075)
                wheelGrad.addColorStop(0, "#505060")
                wheelGrad.addColorStop(0.5, "#303040")
                wheelGrad.addColorStop(1, "#151520")
                
                ctx.fillStyle = wheelGrad
                ctx.strokeStyle = root.lightsOn ? "#0AA9FF" : "#0088CC"
                ctx.lineWidth = 3
                
                var wheelScale = Math.max(0.4, persp)
                
                // Front left wheel
                ctx.save()
                ctx.translate(-cw * 0.28 + skew * 0.82, -ch * 0.25)
                ctx.scale(wheelScale, 1)
                ctx.beginPath()
                ctx.arc(0, 0, cw * 0.065, 0, Math.PI * 2)
                ctx.fill()
                ctx.stroke()
                // Rim details
                for (var i = 0; i < 5; i++) {
                    ctx.save()
                    ctx.rotate((i * Math.PI * 2) / 5)
                    ctx.strokeStyle = "#707080"
                    ctx.lineWidth = 2
                    ctx.beginPath()
                    ctx.moveTo(0, 0)
                    ctx.lineTo(0, cw * 0.05)
                    ctx.stroke()
                    ctx.restore()
                }
                ctx.restore()
                
                // Front right wheel
                ctx.save()
                ctx.translate(cw * 0.28 + skew * 0.82, -ch * 0.25)
                ctx.scale(wheelScale, 1)
                ctx.beginPath()
                ctx.arc(0, 0, cw * 0.065, 0, Math.PI * 2)
                ctx.fill()
                ctx.stroke()
                for (var i = 0; i < 5; i++) {
                    ctx.save()
                    ctx.rotate((i * Math.PI * 2) / 5)
                    ctx.strokeStyle = "#707080"
                    ctx.lineWidth = 2
                    ctx.beginPath()
                    ctx.moveTo(0, 0)
                    ctx.lineTo(0, cw * 0.05)
                    ctx.stroke()
                    ctx.restore()
                }
                ctx.restore()
                
                // Rear left wheel
                ctx.save()
                ctx.translate(-cw * 0.28 + skew * 0.48, ch * 0.25)
                ctx.scale(wheelScale, 1)
                ctx.beginPath()
                ctx.arc(0, 0, cw * 0.065, 0, Math.PI * 2)
                ctx.fill()
                ctx.stroke()
                for (var i = 0; i < 5; i++) {
                    ctx.save()
                    ctx.rotate((i * Math.PI * 2) / 5)
                    ctx.strokeStyle = "#707080"
                    ctx.lineWidth = 2
                    ctx.beginPath()
                    ctx.moveTo(0, 0)
                    ctx.lineTo(0, cw * 0.05)
                    ctx.stroke()
                    ctx.restore()
                }
                ctx.restore()
                
                // Rear right wheel
                ctx.save()
                ctx.translate(cw * 0.28 + skew * 0.48, ch * 0.25)
                ctx.scale(wheelScale, 1)
                ctx.beginPath()
                ctx.arc(0, 0, cw * 0.065, 0, Math.PI * 2)
                ctx.fill()
                ctx.stroke()
                for (var i = 0; i < 5; i++) {
                    ctx.save()
                    ctx.rotate((i * Math.PI * 2) / 5)
                    ctx.strokeStyle = "#707080"
                    ctx.lineWidth = 2
                    ctx.beginPath()
                    ctx.moveTo(0, 0)
                    ctx.lineTo(0, cw * 0.05)
                    ctx.stroke()
                    ctx.restore()
                }
                ctx.restore()
                
                // === HEADLIGHTS - Premium LED style ===
                if (root.lightsOn) {
                    var lightGrad = ctx.createRadialGradient(0, 0, 0, 0, 0, cw * 0.15)
                    lightGrad.addColorStop(0, "#ffffff")
                    lightGrad.addColorStop(0.2, "#00F0FF")
                    lightGrad.addColorStop(0.5, "#4000F0FF")
                    lightGrad.addColorStop(1, "transparent")
                    ctx.fillStyle = lightGrad
                } else {
                    ctx.fillStyle = "#404050"
                }
                
                // Left headlight
                ctx.save()
                ctx.translate(-cw * 0.22 + skew * 0.87, -ch * 0.36)
                ctx.scale(persp, 1)
                ctx.beginPath()
                ctx.ellipse(0, 0, cw * 0.07, ch * 0.025)
                ctx.fill()
                if (root.lightsOn) {
                    ctx.strokeStyle = "#00F0FF"
                    ctx.lineWidth = 2
                    ctx.stroke()
                }
                ctx.restore()
                
                // Right headlight
                ctx.save()
                ctx.translate(cw * 0.22 + skew * 0.87, -ch * 0.36)
                ctx.scale(persp, 1)
                ctx.beginPath()
                ctx.ellipse(0, 0, cw * 0.07, ch * 0.025)
                ctx.fill()
                if (root.lightsOn) {
                    ctx.strokeStyle = "#00F0FF"
                    ctx.lineWidth = 2
                    ctx.stroke()
                }
                ctx.restore()
                
                // === TAILLIGHTS - Red LEDs ===
                ctx.fillStyle = "#80202030"
                ctx.strokeStyle = "#A04050"
                ctx.lineWidth = 2
                
                // Left taillight
                ctx.save()
                ctx.translate(-cw * 0.22 + skew * 0.42, ch * 0.36)
                ctx.scale(persp, 1)
                ctx.beginPath()
                ctx.ellipse(0, 0, cw * 0.05, ch * 0.02)
                ctx.fill()
                ctx.stroke()
                ctx.restore()
                
                // Right taillight
                ctx.save()
                ctx.translate(cw * 0.22 + skew * 0.42, ch * 0.36)
                ctx.scale(persp, 1)
                ctx.beginPath()
                ctx.ellipse(0, 0, cw * 0.05, ch * 0.02)
                ctx.fill()
                ctx.stroke()
                ctx.restore()
                
                ctx.restore()
            }
            
            Behavior on perspective {
                NumberAnimation { duration: 300; easing.type: Easing.OutCubic }
            }
            
            Behavior on skewX {
                NumberAnimation { duration: 300; easing.type: Easing.OutCubic }
            }
        }
        
        // Glass overlay effect
        Rectangle {
            anchors.fill: carCanvas
            color: "transparent"
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#08ffffff" }
                GradientStop { position: 0.3; color: "transparent" }
            }
        }
    }
    
    // === INTERACTIVE ZONES ===
    
    // Left door clickable
    MouseArea {
        x: carContainer.x + carContainer.width * 0.15
        y: carContainer.y + carContainer.height * 0.35
        width: carContainer.width * 0.18
        height: carContainer.height * 0.35
        visible: root.rotationY > -20
        cursorShape: Qt.PointingHandCursor
        
        onClicked: {
            root.leftDoorOpen = !root.leftDoorOpen
            root.partClicked("leftDoor")
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#30FFA63A" : "transparent"
            border.color: parent.containsMouse ? "#FFA63A" : "transparent"
            border.width: 2
            radius: 8
        }
        
        hoverEnabled: true
    }
    
    // Right door clickable
    MouseArea {
        x: carContainer.x + carContainer.width * 0.67
        y: carContainer.y + carContainer.height * 0.35
        width: carContainer.width * 0.18
        height: carContainer.height * 0.35
        visible: root.rotationY < 20
        cursorShape: Qt.PointingHandCursor
        
        onClicked: {
            root.rightDoorOpen = !root.rightDoorOpen
            root.partClicked("rightDoor")
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#30FFA63A" : "transparent"
            border.color: parent.containsMouse ? "#FFA63A" : "transparent"
            border.width: 2
            radius: 8
        }
        
        hoverEnabled: true
    }
    
    // Headlights clickable
    MouseArea {
        x: carContainer.x + carContainer.width * 0.25
        y: carContainer.y + carContainer.height * 0.08
        width: carContainer.width * 0.5
        height: carContainer.height * 0.1
        cursorShape: Qt.PointingHandCursor
        
        onClicked: {
            root.lightsOn = !root.lightsOn
            root.partClicked("lights")
            carCanvas.requestPaint()
        }
        
        Rectangle {
            anchors.fill: parent
            color: parent.pressed ? "#3000F0FF" : "transparent"
            border.color: parent.containsMouse ? "#00F0FF" : "transparent"
            border.width: 2
            radius: 8
        }
        
        hoverEnabled: true
    }
    
    // Drag to rotate
    MouseArea {
        anchors.fill: carContainer
        property real startX: 0
        
        onPressed: function(mouse) {
            startX = mouse.x
        }
        
        onPositionChanged: function(mouse) {
            if (pressed) {
                var delta = mouse.x - startX
                root.rotationY = Math.max(-45, Math.min(45, root.rotationY + delta / 8))
                startX = mouse.x
                carCanvas.requestPaint()
            }
        }
    }
    
    // Auto-repaint on property changes
    onLeftDoorOpenChanged: carCanvas.requestPaint()
    onRightDoorOpenChanged: carCanvas.requestPaint()
    onLightsOnChanged: carCanvas.requestPaint()
    onRotationYChanged: carCanvas.requestPaint()
    
    // Instructions
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        text: "🖱 Drag to Rotate  •  🚪 Click Doors  •  💡 Click Lights"
        font.pixelSize: 11
        font.family: "SF Pro Display"
        color: "#4000F0FF"
        
        layer.enabled: true
        layer.effect: MultiEffect {
            blurEnabled: true
            blur: 0.3
            brightness: 0.2
        }
    }
}

