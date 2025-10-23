import QtQuick

Item {
    id: root

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

    // Main background with gradient
    Rectangle {
        anchors.fill: parent
        radius: width / 2
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1a1a1a" }
            GradientStop { position: 0.5; color: "#0f0f0f" }
            GradientStop { position: 1.0; color: "#050505" }
        }
        border.color: "#2a2a2a"
        border.width: 3
    }

    // Glow effect layer
    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.92
        height: width
        radius: width / 2
        color: "transparent"
        border.color: "#00d4ff"
        border.width: 2
        opacity: 0.3
    }

    // Speed gauge background
    Rectangle {
        id: speedGaugeBackground
        anchors.centerIn: parent
        width: parent.width * 0.85
        height: width
        radius: width / 2
        color: "#0a0a0a"
        border.color: "#1a3a3a"
        border.width: 2
    }

    // Speed scale
    Canvas {
        id: speedScale
        anchors.fill: speedGaugeBackground
        
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            
            var centerX = width / 2;
            var centerY = height / 2;
            var radius = width / 2 - 30;
            
            var startAngle = 135;
            var endAngle = 45;
            var totalAngle = 360 - startAngle + endAngle;
            
            for (var i = 0; i <= 24; i++) {
                var angle = startAngle + (i / 24) * totalAngle;
                var angleRad = angle * Math.PI / 180;
                
                var isMajor = (i % 2 === 0);
                var tickLength = isMajor ? 25 : 12;
                var tickWidth = isMajor ? 3 : 2;
                
                var x1 = centerX + Math.cos(angleRad) * (radius - tickLength);
                var y1 = centerY + Math.sin(angleRad) * (radius - tickLength);
                var x2 = centerX + Math.cos(angleRad) * radius;
                var y2 = centerY + Math.sin(angleRad) * radius;
                
                var speedValue = i * 10;
                var tickColor;
                if (speedValue < 120) {
                    tickColor = isMajor ? "#00d4ff" : "#4a4a4a";
                } else if (speedValue < 180) {
                    tickColor = isMajor ? "#00ff88" : "#4a6a4a";
                } else {
                    tickColor = isMajor ? "#ff4444" : "#6a4a4a";
                }
                
                ctx.strokeStyle = tickColor;
                ctx.lineWidth = tickWidth;
                ctx.beginPath();
                ctx.moveTo(x1, y1);
                ctx.lineTo(x2, y2);
                ctx.stroke();
                
                if (isMajor) {
                    var speed = i * 10;
                    var textRadius = radius - 50;
                    var textX = centerX + Math.cos(angleRad) * textRadius;
                    var textY = centerY + Math.sin(angleRad) * textRadius;
                    
                    ctx.fillStyle = tickColor;
                    ctx.font = "bold 18px Arial";
                    ctx.textAlign = "center";
                    ctx.textBaseline = "middle";
                    ctx.fillText(speed.toString(), textX, textY);
                }
            }
        }
    }

    // Speed needle with glow
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
                velocity: 120
                duration: 250
            }
        }

        // Glow effect behind needle
        Rectangle {
            width: 10
            height: parent.height / 2 - 35
            radius: 5
            anchors.bottom: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ff0044"
            opacity: 0.3
            anchors.bottomMargin: -2
        }

        // Main needle
        Rectangle {
            id: needle
            width: 8
            height: parent.height / 2 - 35
            radius: 4
            anchors.bottom: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            antialiasing: true
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#ff0055" }
                GradientStop { position: 0.7; color: "#ff0044" }
                GradientStop { position: 1.0; color: "#cc0033" }
            }

            Rectangle {
                width: parent.width + 6
                height: 18
                radius: 3
                color: "#ff0044"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    // Center hub
    Rectangle {
        width: 40
        height: 40
        radius: 20
        anchors.centerIn: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#3a3a3a" }
            GradientStop { position: 1.0; color: "#1a1a1a" }
        }
        border.color: "#00d4ff"
        border.width: 3

        // Inner glow
        Rectangle {
            anchors.centerIn: parent
            width: parent.width - 6
            height: parent.height - 6
            radius: width / 2
            color: "transparent"
            border.color: "#00d4ff"
            border.width: 1
            opacity: 0.5
        }
    }

    // Digital speed display
    Rectangle {
        id: digitalSpeed
        width: 200
        height: 100
        color: "#000000"
        border.color: "#00d4ff"
        border.width: 3
        radius: 12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.verticalCenter
        anchors.topMargin: 90

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0a0a0a" }
            GradientStop { position: 1.0; color: "#000000" }
        }

        // Outer glow
        Rectangle {
            anchors.fill: parent
            anchors.margins: -3
            radius: parent.radius + 3
            color: "transparent"
            border.color: "#00d4ff"
            border.width: 1
            opacity: 0.3
        }

        Column {
            anchors.centerIn: parent
            spacing: 2

            Text {
                text: Math.round(root.speed)
                font.pixelSize: 52
                font.bold: true
                color: "#00d4ff"
                anchors.horizontalCenter: parent.horizontalCenter
                style: Text.Outline
                styleColor: "#00a8cc"

                Behavior on text {
                    SmoothedAnimation { duration: 200 }
                }
            }

            Text {
                text: "km/h"
                font.pixelSize: 14
                color: "#6a6a6a"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    // Gear indicator
    Rectangle {
        width: 90
        height: 90
        radius: 45
        color: "#0a0a0a"
        border.color: gear === "P" ? "#ff8800" : "#00ff88"
        border.width: 4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: digitalSpeed.top
        anchors.bottomMargin: 15

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1a1a1a" }
            GradientStop { position: 1.0; color: "#0a0a0a" }
        }

        // Glow
        Rectangle {
            anchors.fill: parent
            anchors.margins: -4
            radius: parent.radius + 4
            color: "transparent"
            border.color: parent.border.color
            border.width: 2
            opacity: 0.4
        }

        Text {
            text: root.gear
            font.pixelSize: 48
            font.bold: true
            color: gear === "P" ? "#ff8800" : "#00ff88"
            anchors.centerIn: parent
            style: Text.Outline
            styleColor: "#000000"
        }

        Text {
            text: "GEAR"
            font.pixelSize: 10
            color: "#6a6a6a"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
        }

        Behavior on border.color {
            ColorAnimation { duration: 300 }
        }
    }

    // RPM bar
    Rectangle {
        id: rpmBar
        width: parent.width * 0.7
        height: 20
        color: "#0a0a0a"
        border.color: "#3a3a3a"
        border.width: 2
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50

        Rectangle {
            id: rpmFill
            width: Math.min((root.rpm / 8000) * parent.width, parent.width)
            height: parent.height
            radius: parent.radius

            gradient: Gradient {
                GradientStop { position: 0.0; color: root.rpm < 5000 ? "#00ff88" : root.rpm < 6500 ? "#ffaa00" : "#ff0044" }
                GradientStop { position: 1.0; color: root.rpm < 5000 ? "#00cc66" : root.rpm < 6500 ? "#ff8800" : "#cc0033" }
            }

            Behavior on width {
                SmoothedAnimation { velocity: 300; duration: 200 }
            }
        }

        Text {
            text: Math.round(root.rpm) + " RPM"
            font.pixelSize: 12
            font.bold: true
            color: "#ffffff"
            anchors.centerIn: parent
            style: Text.Outline
            styleColor: "#000000"
        }
    }

    // Fuel gauge (left)
    Item {
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 80
        width: 40
        height: 180

        Rectangle {
            width: 35
            height: parent.height
            color: "#0a0a0a"
            border.color: "#3a3a3a"
            border.width: 2
            radius: 8
            anchors.centerIn: parent

            Rectangle {
                width: parent.width
                height: (root.fuel / 100) * parent.height
                radius: parent.radius
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                gradient: Gradient {
                    GradientStop { position: 0.0; color: root.fuel < 20 ? "#ff4444" : "#00ff88" }
                    GradientStop { position: 1.0; color: root.fuel < 20 ? "#cc3333" : "#00cc66" }
                }

                Behavior on height {
                    SmoothedAnimation { duration: 500 }
                }
            }
        }

        Text {
            text: "⛽"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 8
            color: root.fuel < 20 ? "#ff4444" : "#00ff88"
        }

        Text {
            text: Math.round(root.fuel) + "%"
            font.pixelSize: 11
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 38
        }
    }

    // Temperature gauge (right)
    Item {
        anchors.right: parent.right
        anchors.rightMargin: 40
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 80
        width: 40
        height: 180

        Rectangle {
            width: 35
            height: parent.height
            color: "#0a0a0a"
            border.color: "#3a3a3a"
            border.width: 2
            radius: 8
            anchors.centerIn: parent

            Rectangle {
                width: parent.width
                height: ((root.temperature - 70) / 50) * parent.height
                radius: parent.radius
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                gradient: Gradient {
                    GradientStop { position: 0.0; color: root.temperature < 85 ? "#00d4ff" : root.temperature < 100 ? "#00ff88" : "#ff4444" }
                    GradientStop { position: 1.0; color: root.temperature < 85 ? "#0088cc" : root.temperature < 100 ? "#00cc66" : "#cc3333" }
                }

                Behavior on height {
                    SmoothedAnimation { duration: 500 }
                }
            }
        }

        Text {
            text: "🌡"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 8
            color: root.temperature > 110 ? "#ff4444" : "#00d4ff"
        }

        Text {
            text: Math.round(root.temperature) + "°C"
            font.pixelSize: 11
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 38
        }
    }

    // Left blinker
    Rectangle {
        width: 60
        height: 60
        radius: 30
        color: root.leftBlinker ? "#00ff00" : "#0a1a0a"
        border.color: "#00ff00"
        border.width: 3
        anchors.left: parent.left
        anchors.leftMargin: 45
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -100

        Rectangle {
            anchors.fill: parent
            anchors.margins: -5
            radius: parent.radius + 5
            color: "transparent"
            border.color: "#00ff00"
            border.width: 2
            opacity: root.leftBlinker ? 0.6 : 0
            Behavior on opacity { NumberAnimation { duration: 100 } }
        }

        Text {
            text: "◄"
            font.pixelSize: 32
            font.bold: true
            color: root.leftBlinker ? "#000000" : "#00ff00"
            anchors.centerIn: parent
        }

        Behavior on color {
            ColorAnimation { duration: 100 }
        }

        SequentialAnimation on scale {
            running: root.leftBlinker
            loops: Animation.Infinite
            NumberAnimation { from: 1.0; to: 1.15; duration: 250 }
            NumberAnimation { from: 1.15; to: 1.0; duration: 250 }
        }
    }

    // Right blinker
    Rectangle {
        width: 60
        height: 60
        radius: 30
        color: root.rightBlinker ? "#00ff00" : "#0a1a0a"
        border.color: "#00ff00"
        border.width: 3
        anchors.right: parent.right
        anchors.rightMargin: 45
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -100

        Rectangle {
            anchors.fill: parent
            anchors.margins: -5
            radius: parent.radius + 5
            color: "transparent"
            border.color: "#00ff00"
            border.width: 2
            opacity: root.rightBlinker ? 0.6 : 0
            Behavior on opacity { NumberAnimation { duration: 100 } }
        }

        Text {
            text: "►"
            font.pixelSize: 32
            font.bold: true
            color: root.rightBlinker ? "#000000" : "#00ff00"
            anchors.centerIn: parent
        }

        Behavior on color {
            ColorAnimation { duration: 100 }
        }

        SequentialAnimation on scale {
            running: root.rightBlinker
            loops: Animation.Infinite
            NumberAnimation { from: 1.0; to: 1.15; duration: 250 }
            NumberAnimation { from: 1.15; to: 1.0; duration: 250 }
        }
    }

    // High beam
    Rectangle {
        width: 65
        height: 55
        radius: 10
        color: root.highBeam ? "#0088ff" : "#0a0a1a"
        border.color: "#0088ff"
        border.width: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50

        Rectangle {
            anchors.fill: parent
            anchors.margins: -4
            radius: parent.radius + 4
            color: "transparent"
            border.color: "#0088ff"
            border.width: 2
            opacity: root.highBeam ? 0.6 : 0
            Behavior on opacity { NumberAnimation { duration: 100 } }
        }

        Text {
            text: "◉"
            font.pixelSize: 36
            font.bold: true
            color: root.highBeam ? "#ffffff" : "#0088ff"
            anchors.centerIn: parent
        }

        Text {
            text: "HIGH BEAM"
            font.pixelSize: 9
            font.bold: true
            color: root.highBeam ? "#0088ff" : "#3a3a3a"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 5
        }

        Behavior on color {
            ColorAnimation { duration: 100 }
        }
    }

    // Warning lights
    Row {
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 120

        // Engine warning
        Rectangle {
            width: 45
            height: 45
            radius: 8
            color: root.engineWarning ? "#ff4444" : "#1a0a0a"
            border.color: "#ff4444"
            border.width: 2

            Text {
                text: "⚠"
                font.pixelSize: 28
                color: root.engineWarning ? "#ffffff" : "#ff4444"
                anchors.centerIn: parent
            }

            SequentialAnimation on opacity {
                running: root.engineWarning
                loops: Animation.Infinite
                NumberAnimation { from: 1.0; to: 0.3; duration: 500 }
                NumberAnimation { from: 0.3; to: 1.0; duration: 500 }
            }
        }

        // Oil warning
        Rectangle {
            width: 45
            height: 45
            radius: 8
            color: root.oilWarning ? "#ffaa00" : "#1a1a0a"
            border.color: "#ffaa00"
            border.width: 2

            Text {
                text: "🛢"
                font.pixelSize: 24
                color: root.oilWarning ? "#ffffff" : "#ffaa00"
                anchors.centerIn: parent
            }

            SequentialAnimation on opacity {
                running: root.oilWarning
                loops: Animation.Infinite
                NumberAnimation { from: 1.0; to: 0.3; duration: 500 }
                NumberAnimation { from: 0.3; to: 1.0; duration: 500 }
            }
        }

        // Battery warning
        Rectangle {
            width: 45
            height: 45
            radius: 8
            color: root.batteryWarning ? "#ff8800" : "#1a1a1a"
            border.color: "#ff8800"
            border.width: 2

            Text {
                text: "⚡"
                font.pixelSize: 28
                color: root.batteryWarning ? "#ffffff" : "#ff8800"
                anchors.centerIn: parent
            }

            SequentialAnimation on opacity {
                running: root.batteryWarning
                loops: Animation.Infinite
                NumberAnimation { from: 1.0; to: 0.3; duration: 500 }
                NumberAnimation { from: 0.3; to: 1.0; duration: 500 }
            }
        }
    }

    // Odometer
    Rectangle {
        width: 180
        height: 35
        color: "#0a0a0a"
        border.color: "#2a2a2a"
        border.width: 2
        radius: 6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 85

        Row {
            anchors.centerIn: parent
            spacing: 10

            Text {
                text: "ODO:"
                font.pixelSize: 11
                color: "#6a6a6a"
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: root.odometer.toFixed(1) + " km"
                font.pixelSize: 13
                font.bold: true
                font.family: "Courier New"
                color: "#00d4ff"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    // Trip meter
    Rectangle {
        width: 150
        height: 30
        color: "#0a0a0a"
        border.color: "#2a2a2a"
        border.width: 2
        radius: 6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        Row {
            anchors.centerIn: parent
            spacing: 8

            Text {
                text: "TRIP:"
                font.pixelSize: 10
                color: "#6a6a6a"
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: root.tripMeter.toFixed(2) + " km"
                font.pixelSize: 12
                font.family: "Courier New"
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
