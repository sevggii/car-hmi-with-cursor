import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Window {
    id: root
    width: 1920
    height: 720
    visible: true
    title: qsTr("Professional Car HMI Cluster")
    color: "#000000"
    
    // PROFESSIONAL FIXED ARTBOARD - scales to window
    Item {
        id: artboard
        anchors.centerIn: parent
        
        // Scale to fit window while maintaining aspect ratio
        width: 2560
        height: 1080
        scale: Math.min(root.width / width, root.height / height)
        transformOrigin: Item.Center
        
        // Pure black background
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
        
        // MAIN CLUSTER DISPLAY - Professional Layout
        SpeedCluster {
            anchors.fill: parent
            
            speed: mockCan.speed
            rpm: mockCan.rpm
            leftBlinker: mockCan.leftBlinker
            rightBlinker: mockCan.rightBlinker
            highBeam: mockCan.highBeam
            fuel: mockCan.fuel
            temperature: mockCan.temperature
            gear: mockCan.gear
            odometer: mockCan.odometer
            tripMeter: mockCan.tripMeter
            engineWarning: mockCan.engineWarning
            oilWarning: mockCan.oilWarning
            batteryWarning: mockCan.batteryWarning
        }
    }
    
    // CONTROL PANEL - Outside artboard, on the right
    Rectangle {
        id: controlPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 380
        color: "#1a1a1a"
        border.color: "#2a2a2a"
        border.width: 2
        
        // Semi-transparent overlay
        opacity: 0.95
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 20
            
            Text {
                text: "Control Panel"
                font.pixelSize: 24
                font.bold: true
                color: "#00d4ff"
                Layout.alignment: Qt.AlignHCenter
            }
            
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "#2a2a2a"
            }
            
            // Speed Control
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8
                
                Text {
                    text: "Speed: " + Math.round(mockCan.targetSpeed) + " km/h"
                    font.pixelSize: 18
                    color: "#ffffff"
                }
                
                Slider {
                    Layout.fillWidth: true
                    from: 0
                    to: 240
                    value: mockCan.targetSpeed
                    onValueChanged: mockCan.setTargetSpeed(value)
                    
                    background: Rectangle {
                        x: parent.leftPadding
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: parent.availableWidth
                        height: 6
                        radius: 3
                        color: "#2a2a2a"
                        
                        Rectangle {
                            width: parent.parent.visualPosition * parent.width
                            height: parent.height
                            color: "#00d4ff"
                            radius: 3
                        }
                    }
                    
                    handle: Rectangle {
                        x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: 20
                        height: 20
                        radius: 10
                        color: parent.pressed ? "#00a8cc" : "#00d4ff"
                        border.color: "#ffffff"
                        border.width: 2
                    }
                }
            }
            
            // RPM Control
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8
                
                Text {
                    text: "RPM: " + Math.round(mockCan.targetRpm)
                    font.pixelSize: 18
                    color: "#ffffff"
                }
                
                Slider {
                    Layout.fillWidth: true
                    from: 0
                    to: 8000
                    value: mockCan.targetRpm
                    onValueChanged: mockCan.setTargetRpm(value)
                    
                    background: Rectangle {
                        x: parent.leftPadding
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: parent.availableWidth
                        height: 6
                        radius: 3
                        color: "#2a2a2a"
                        
                        Rectangle {
                            width: parent.parent.visualPosition * parent.width
                            height: parent.height
                            color: "#ff4444"
                            radius: 3
                        }
                    }
                    
                    handle: Rectangle {
                        x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                        y: parent.topPadding + parent.availableHeight / 2 - height / 2
                        width: 20
                        height: 20
                        radius: 10
                        color: parent.pressed ? "#cc3333" : "#ff4444"
                        border.color: "#ffffff"
                        border.width: 2
                    }
                }
            }
            
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "#2a2a2a"
            }
            
            // Indicator Controls
            Text {
                text: "Indicators"
                font.pixelSize: 20
                font.bold: true
                color: "#00d4ff"
                Layout.topMargin: 10
            }
            
            Row {
                Layout.fillWidth: true
                spacing: 15
                
                CheckBox {
                    checked: false
                    onCheckedChanged: mockCan.setLeftBlinker(checked)
                    
                    indicator: Rectangle {
                        width: 24
                        height: 24
                        radius: 4
                        border.color: "#00d4ff"
                        border.width: 2
                        color: parent.checked ? "#00d4ff" : "transparent"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "✓"
                            color: "#0a0a0a"
                            font.pixelSize: 16
                            font.bold: true
                            visible: parent.parent.checked
                        }
                    }
                }
                
                Text {
                    text: "← Left Blinker"
                    font.pixelSize: 16
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Row {
                Layout.fillWidth: true
                spacing: 15
                
                CheckBox {
                    checked: false
                    onCheckedChanged: mockCan.setRightBlinker(checked)
                    
                    indicator: Rectangle {
                        width: 24
                        height: 24
                        radius: 4
                        border.color: "#00d4ff"
                        border.width: 2
                        color: parent.checked ? "#00d4ff" : "transparent"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "✓"
                            color: "#0a0a0a"
                            font.pixelSize: 16
                            font.bold: true
                            visible: parent.parent.checked
                        }
                    }
                }
                
                Text {
                    text: "Right Blinker →"
                    font.pixelSize: 16
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Row {
                Layout.fillWidth: true
                spacing: 15
                
                CheckBox {
                    checked: false
                    onCheckedChanged: mockCan.setHighBeam(checked)
                    
                    indicator: Rectangle {
                        width: 24
                        height: 24
                        radius: 4
                        border.color: "#00d4ff"
                        border.width: 2
                        color: parent.checked ? "#00d4ff" : "transparent"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "✓"
                            color: "#0a0a0a"
                            font.pixelSize: 16
                            font.bold: true
                            visible: parent.parent.checked
                        }
                    }
                }
                
                Text {
                    text: "High Beam"
                    font.pixelSize: 16
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "#2a2a2a"
            }
            
            // Vehicle Status
            Text {
                text: "Vehicle Status"
                font.pixelSize: 20
                font.bold: true
                color: "#00d4ff"
                Layout.topMargin: 10
            }
            
            Row {
                Layout.fillWidth: true
                spacing: 10
                
                Text {
                    text: "Gear:"
                    font.pixelSize: 16
                    color: "#ffffff"
                    anchors.verticalCenter: parent.verticalCenter
                }
                
                Rectangle {
                    width: 50
                    height: 50
                    radius: 25
                    color: mockCan.gear === "P" ? "#ff8800" : "#00ff88"
                    border.color: "#ffffff"
                    border.width: 2
                    
                    Text {
                        text: mockCan.gear
                        font.pixelSize: 28
                        font.bold: true
                        color: "#000000"
                        anchors.centerIn: parent
                    }
                }
            }
            
            Row {
                Layout.fillWidth: true
                spacing: 20
                
                Column {
                    spacing: 5
                    Text {
                        text: "⛽ Fuel"
                        font.pixelSize: 14
                        color: "#ffffff"
                    }
                    Text {
                        text: Math.round(mockCan.fuel) + "%"
                        font.pixelSize: 20
                        font.bold: true
                        color: mockCan.fuel < 20 ? "#ff4444" : "#00ff88"
                    }
                }
                
                Column {
                    spacing: 5
                    Text {
                        text: "🌡 Temp"
                        font.pixelSize: 14
                        color: "#ffffff"
                    }
                    Text {
                        text: Math.round(mockCan.temperature) + "°C"
                        font.pixelSize: 20
                        font.bold: true
                        color: mockCan.temperature > 110 ? "#ff4444" : "#00d4ff"
                    }
                }
            }
            
            Column {
                Layout.fillWidth: true
                spacing: 8
                
                Row {
                    spacing: 10
                    Text {
                        text: "ODO:"
                        font.pixelSize: 14
                        color: "#6a6a6a"
                    }
                    Text {
                        text: mockCan.odometer.toFixed(1) + " km"
                        font.pixelSize: 14
                        font.bold: true
                        font.family: "Courier New"
                        color: "#00d4ff"
                    }
                }
                
                Row {
                    spacing: 10
                    Text {
                        text: "TRIP:"
                        font.pixelSize: 14
                        color: "#6a6a6a"
                    }
                    Text {
                        text: mockCan.tripMeter.toFixed(2) + " km"
                        font.pixelSize: 14
                        font.bold: true
                        font.family: "Courier New"
                        color: "#ffffff"
                    }
                }
            }
            
            Item {
                Layout.fillHeight: true
            }
        }
    }
}
