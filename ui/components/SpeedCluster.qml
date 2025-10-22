import QtQuick

Item {
    id: root

    property real speed: 0
    property real rpm: 0
    property bool leftBlinker: false
    property bool rightBlinker: false
    property bool highBeam: false

    // Main cluster background
    Rectangle {
        anchors.fill: parent
        color: "#0f0f0f"
        radius: width / 2
        border.color: "#2a2a2a"
        border.width: 3
    }

    // Speed gauge background circle
    Rectangle {
        id: speedGaugeBackground
        anchors.centerIn: parent
        width: parent.width * 0.85
        height: width
        radius: width / 2
        color: "#1a1a1a"
        border.color: "#3a3a3a"
        border.width: 2
    }

    // Speed scale marks
    Canvas {
        id: speedScale
        anchors.fill: speedGaugeBackground
        
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            
            var centerX = width / 2;
            var centerY = height / 2;
            var radius = width / 2 - 30;
            
            // Draw scale from 0 to 240 km/h (270 degrees total, from 135° to 45°)
            var startAngle = 135;
            var endAngle = 45;
            var totalAngle = 360 - startAngle + endAngle;
            
            for (var i = 0; i <= 24; i++) {
                var angle = startAngle + (i / 24) * totalAngle;
                var angleRad = angle * Math.PI / 180;
                
                var isMajor = (i % 2 === 0);
                var tickLength = isMajor ? 20 : 10;
                var tickWidth = isMajor ? 3 : 2;
                
                var x1 = centerX + Math.cos(angleRad) * (radius - tickLength);
                var y1 = centerY + Math.sin(angleRad) * (radius - tickLength);
                var x2 = centerX + Math.cos(angleRad) * radius;
                var y2 = centerY + Math.sin(angleRad) * radius;
                
                ctx.strokeStyle = isMajor ? "#00d4ff" : "#4a4a4a";
                ctx.lineWidth = tickWidth;
                ctx.beginPath();
                ctx.moveTo(x1, y1);
                ctx.lineTo(x2, y2);
                ctx.stroke();
                
                // Draw numbers for major ticks
                if (isMajor) {
                    var speed = i * 10;
                    var textRadius = radius - 45;
                    var textX = centerX + Math.cos(angleRad) * textRadius;
                    var textY = centerY + Math.sin(angleRad) * textRadius;
                    
                    ctx.fillStyle = "#00d4ff";
                    ctx.font = "bold 16px sans-serif";
                    ctx.textAlign = "center";
                    ctx.textBaseline = "middle";
                    ctx.fillText(speed.toString(), textX, textY);
                }
            }
        }
    }

    // Speed needle
    Item {
        id: needleContainer
        anchors.centerIn: parent
        width: speedGaugeBackground.width
        height: speedGaugeBackground.height
        rotation: {
            var normalizedSpeed = Math.min(Math.max(root.speed, 0), 240);
            return 135 + (normalizedSpeed / 240) * 270;
        }
        
        Behavior on rotation {
            SmoothedAnimation {
                velocity: 100
                duration: 300
            }
        }

        Rectangle {
            id: needle
            width: 6
            height: parent.height / 2 - 40
            color: "#ff0044"
            radius: 3
            anchors.bottom: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            antialiasing: true

            Rectangle {
                width: parent.width + 4
                height: 15
                color: "#ff0044"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 2
            }
        }
    }

    // Center hub
    Rectangle {
        width: 30
        height: 30
        radius: 15
        color: "#2a2a2a"
        border.color: "#00d4ff"
        border.width: 3
        anchors.centerIn: parent
    }

    // Digital speed display
    Rectangle {
        width: 180
        height: 80
        color: "#0a0a0a"
        border.color: "#00d4ff"
        border.width: 2
        radius: 8
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 80

        Column {
            anchors.centerIn: parent
            spacing: 5

            Text {
                text: Math.round(root.speed)
                font.pixelSize: 42
                font.bold: true
                color: "#00d4ff"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: "km/h"
                font.pixelSize: 14
                color: "#6a6a6a"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    // RPM bar
    Rectangle {
        id: rpmBar
        width: parent.width * 0.6
        height: 15
        color: "#1a1a1a"
        border.color: "#3a3a3a"
        border.width: 2
        radius: 8
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40

        Rectangle {
            width: Math.min((root.rpm / 8000) * parent.width, parent.width)
            height: parent.height
            color: {
                if (root.rpm < 5000) return "#00ff88"
                else if (root.rpm < 6500) return "#ffaa00"
                else return "#ff0044"
            }
            radius: parent.radius

            Behavior on width {
                SmoothedAnimation { velocity: 200 }
            }
            Behavior on color {
                ColorAnimation { duration: 200 }
            }
        }

        Text {
            text: Math.round(root.rpm) + " RPM"
            font.pixelSize: 11
            font.bold: true
            color: "#ffffff"
            anchors.centerIn: parent
        }
    }

    // Left blinker indicator
    Rectangle {
        width: 50
        height: 50
        radius: 25
        color: root.leftBlinker ? "#00ff00" : "#1a3a1a"
        border.color: "#00ff00"
        border.width: 3
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -80

        Text {
            text: "◄"
            font.pixelSize: 28
            font.bold: true
            color: root.leftBlinker ? "#0a0a0a" : "#00ff00"
            anchors.centerIn: parent
        }

        Behavior on color {
            ColorAnimation { duration: 100 }
        }
    }

    // Right blinker indicator
    Rectangle {
        width: 50
        height: 50
        radius: 25
        color: root.rightBlinker ? "#00ff00" : "#1a3a1a"
        border.color: "#00ff00"
        border.width: 3
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -80

        Text {
            text: "►"
            font.pixelSize: 28
            font.bold: true
            color: root.rightBlinker ? "#0a0a0a" : "#00ff00"
            anchors.centerIn: parent
        }

        Behavior on color {
            ColorAnimation { duration: 100 }
        }
    }

    // High beam indicator
    Rectangle {
        width: 50
        height: 50
        radius: 8
        color: root.highBeam ? "#0088ff" : "#1a1a3a"
        border.color: "#0088ff"
        border.width: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 60

        Text {
            text: "◉"
            font.pixelSize: 32
            font.bold: true
            color: root.highBeam ? "#ffffff" : "#0088ff"
            anchors.centerIn: parent
        }

        Behavior on color {
            ColorAnimation { duration: 100 }
        }
    }

    Text {
        text: "HIGH BEAM"
        font.pixelSize: 10
        font.bold: true
        color: root.highBeam ? "#0088ff" : "#3a3a3a"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 120
    }
}

