import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Window {
    id: root
    width: 1600
    height: 900
    minimumWidth: 1280
    minimumHeight: 720
    visible: true
    title: qsTr("Professional Car HMI Cluster")
    color: "#000000"
    
    // PROFESSIONAL FIXED ARTBOARD - Perfect scaling
    Item {
        id: artboard
        anchors.fill: parent
        anchors.rightMargin: controlPanel.width // Reserve space for control panel
        
        clip: true
        
        // Scale content to fit available space
        Item {
            id: scaledContent
            anchors.centerIn: parent
            
            width: 2560
            height: 1080
            scale: Math.min((artboard.width - 40) / width, (artboard.height - 40) / height)
            transformOrigin: Item.Center
            
            // Pure black background
            Rectangle {
                anchors.fill: parent
                color: "#000000"
            }
            
            // MAIN CLUSTER DISPLAY
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
    }
    
    // CONTROL PANEL - Fixed on right, always visible
    Rectangle {
        id: controlPanel
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 350
        color: "#1a1a1a"
        border.color: "#2a2a2a"
        border.width: 2
        
        opacity: 0.95
        
        Flickable {
            anchors.fill: parent
            anchors.margins: 15
            contentHeight: controlContent.height
            clip: true
            
            Column {
                id: controlContent
                width: parent.width
                spacing: 15
                
                Text {
                    text: "Control Panel"
                    font.pixelSize: 22
                    font.bold: true
                    color: "#00d4ff"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#2a2a2a"
                }
                
                // Speed Control
                Column {
                    width: parent.width
                    spacing: 6
                    
                    Text {
                        text: "Speed: " + Math.round(mockCan.targetSpeed) + " km/h"
                        font.pixelSize: 16
                        color: "#ffffff"
                    }
                    
                    Slider {
                        width: parent.width
                        from: 0
                        to: 240
                        value: mockCan.targetSpeed
                        onValueChanged: mockCan.setTargetSpeed(value)
                        
                        background: Rectangle {
                            x: parent.leftPadding
                            y: parent.topPadding + parent.availableHeight / 2 - height / 2
                            width: parent.availableWidth
                            height: 5
                            radius: 2.5
                            color: "#2a2a2a"
                            
                            Rectangle {
                                width: parent.parent.visualPosition * parent.width
                                height: parent.height
                                color: "#00d4ff"
                                radius: 2.5
                            }
                        }
                        
                        handle: Rectangle {
                            x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                            y: parent.topPadding + parent.availableHeight / 2 - height / 2
                            width: 18
                            height: 18
                            radius: 9
                            color: parent.pressed ? "#00a8cc" : "#00d4ff"
                            border.color: "#ffffff"
                            border.width: 2
                        }
                    }
                }
                
                // RPM Control
                Column {
                    width: parent.width
                    spacing: 6
                    
                    Text {
                        text: "RPM: " + Math.round(mockCan.targetRpm)
                        font.pixelSize: 16
                        color: "#ffffff"
                    }
                    
                    Slider {
                        width: parent.width
                        from: 0
                        to: 8000
                        value: mockCan.targetRpm
                        onValueChanged: mockCan.setTargetRpm(value)
                        
                        background: Rectangle {
                            x: parent.leftPadding
                            y: parent.topPadding + parent.availableHeight / 2 - height / 2
                            width: parent.availableWidth
                            height: 5
                            radius: 2.5
                            color: "#2a2a2a"
                            
                            Rectangle {
                                width: parent.parent.visualPosition * parent.width
                                height: parent.height
                                color: "#ff4444"
                                radius: 2.5
                            }
                        }
                        
                        handle: Rectangle {
                            x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                            y: parent.topPadding + parent.availableHeight / 2 - height / 2
                            width: 18
                            height: 18
                            radius: 9
                            color: parent.pressed ? "#cc3333" : "#ff4444"
                            border.color: "#ffffff"
                            border.width: 2
                        }
                    }
                }
                
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#2a2a2a"
                }
                
                // Indicators
                Text {
                    text: "Indicators"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#00d4ff"
                }
                
                Row {
                    width: parent.width
                    spacing: 10
                    
                    CheckBox {
                        checked: false
                        onCheckedChanged: mockCan.setLeftBlinker(checked)
                        
                        indicator: Rectangle {
                            width: 20
                            height: 20
                            radius: 3
                            border.color: "#00d4ff"
                            border.width: 2
                            color: parent.checked ? "#00d4ff" : "transparent"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "✓"
                                color: "#0a0a0a"
                                font.pixelSize: 14
                                font.bold: true
                                visible: parent.parent.checked
                            }
                        }
                    }
                    
                    Text {
                        text: "← Left Blinker"
                        font.pixelSize: 14
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                
                Row {
                    width: parent.width
                    spacing: 10
                    
                    CheckBox {
                        checked: false
                        onCheckedChanged: mockCan.setRightBlinker(checked)
                        
                        indicator: Rectangle {
                            width: 20
                            height: 20
                            radius: 3
                            border.color: "#00d4ff"
                            border.width: 2
                            color: parent.checked ? "#00d4ff" : "transparent"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "✓"
                                color: "#0a0a0a"
                                font.pixelSize: 14
                                font.bold: true
                                visible: parent.parent.checked
                            }
                        }
                    }
                    
                    Text {
                        text: "Right Blinker →"
                        font.pixelSize: 14
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                
                Row {
                    width: parent.width
                    spacing: 10
                    
                    CheckBox {
                        checked: false
                        onCheckedChanged: mockCan.setHighBeam(checked)
                        
                        indicator: Rectangle {
                            width: 20
                            height: 20
                            radius: 3
                            border.color: "#00d4ff"
                            border.width: 2
                            color: parent.checked ? "#00d4ff" : "transparent"
                            
                            Text {
                                anchors.centerIn: parent
                                text: "✓"
                                color: "#0a0a0a"
                                font.pixelSize: 14
                                font.bold: true
                                visible: parent.parent.checked
                            }
                        }
                    }
                    
                    Text {
                        text: "High Beam"
                        font.pixelSize: 14
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#2a2a2a"
                }
                
                // Vehicle Status
                Text {
                    text: "Vehicle Status"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#00d4ff"
                }
                
                Row {
                    width: parent.width
                    spacing: 8
                    
                    Text {
                        text: "Gear:"
                        font.pixelSize: 14
                        color: "#ffffff"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    
                    Rectangle {
                        width: 45
                        height: 45
                        radius: 22.5
                        color: mockCan.gear === "P" ? "#ff8800" : "#00ff88"
                        border.color: "#ffffff"
                        border.width: 2
                        
                        Text {
                            text: mockCan.gear
                            font.pixelSize: 24
                            font.bold: true
                            color: "#000000"
                            anchors.centerIn: parent
                        }
                    }
                }
                
                Row {
                    width: parent.width
                    spacing: 15
                    
                    Column {
                        spacing: 4
                        Text {
                            text: "⛽ Fuel"
                            font.pixelSize: 12
                            color: "#ffffff"
                        }
                        Text {
                            text: Math.round(mockCan.fuel) + "%"
                            font.pixelSize: 18
                            font.bold: true
                            color: mockCan.fuel < 20 ? "#ff4444" : "#00ff88"
                        }
                    }
                    
                    Column {
                        spacing: 4
                        Text {
                            text: "🌡 Temp"
                            font.pixelSize: 12
                            color: "#ffffff"
                        }
                        Text {
                            text: Math.round(mockCan.temperature) + "°C"
                            font.pixelSize: 18
                            font.bold: true
                            color: mockCan.temperature > 110 ? "#ff4444" : "#00d4ff"
                        }
                    }
                }
                
                Column {
                    width: parent.width
                    spacing: 6
                    
                    Row {
                        spacing: 8
                        Text {
                            text: "ODO:"
                            font.pixelSize: 12
                            color: "#6a6a6a"
                        }
                        Text {
                            text: mockCan.odometer.toFixed(1) + " km"
                            font.pixelSize: 12
                            font.bold: true
                            color: "#00d4ff"
                        }
                    }
                    
                    Row {
                        spacing: 8
                        Text {
                            text: "TRIP:"
                            font.pixelSize: 12
                            color: "#6a6a6a"
                        }
                        Text {
                            text: mockCan.tripMeter.toFixed(2) + " km"
                            font.pixelSize: 12
                            font.bold: true
                            color: "#ffffff"
                        }
                    }
                }
            }
        }
    }
}
