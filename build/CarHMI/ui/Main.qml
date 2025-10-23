import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Window {
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("Car HMI Cluster")
    color: "#0a0a0a"

    Rectangle {
        anchors.fill: parent
        color: "#0a0a0a"
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 20

            // Main Cluster Display
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                SpeedCluster {
                    anchors.centerIn: parent
                    width: Math.min(parent.width, parent.height) * 0.9
                    height: width
                    
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

            // Control Panel
            Rectangle {
                Layout.preferredWidth: 350
                Layout.fillHeight: true
                color: "#1a1a1a"
                radius: 10
                border.color: "#2a2a2a"
                border.width: 2

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

                    // Left Blinker
                    Row {
                        Layout.fillWidth: true
                        spacing: 15

                        CheckBox {
                            id: leftBlinkerCheckBox
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

                    // Right Blinker
                    Row {
                        Layout.fillWidth: true
                        spacing: 15

                        CheckBox {
                            id: rightBlinkerCheckBox
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

                    // High Beam
                    Row {
                        Layout.fillWidth: true
                        spacing: 15

                        CheckBox {
                            id: highBeamCheckBox
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

                    // Additional Vehicle Status
                    Text {
                        text: "Vehicle Status"
                        font.pixelSize: 20
                        font.bold: true
                        color: "#00d4ff"
                        Layout.topMargin: 10
                    }

                    // Gear display
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

                    // Fuel and Temperature
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

                    // Odometer and Trip
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

                    // Warning indicators
                    Row {
                        Layout.fillWidth: true
                        spacing: 10

                        Rectangle {
                            width: 35
                            height: 35
                            radius: 6
                            color: mockCan.engineWarning ? "#ff4444" : "#1a1a1a"
                            border.color: "#ff4444"
                            border.width: 2

                            Text {
                                text: "⚠"
                                font.pixelSize: 20
                                color: mockCan.engineWarning ? "#ffffff" : "#ff4444"
                                anchors.centerIn: parent
                            }
                        }

                        Rectangle {
                            width: 35
                            height: 35
                            radius: 6
                            color: mockCan.oilWarning ? "#ffaa00" : "#1a1a1a"
                            border.color: "#ffaa00"
                            border.width: 2

                            Text {
                                text: "🛢"
                                font.pixelSize: 18
                                color: mockCan.oilWarning ? "#ffffff" : "#ffaa00"
                                anchors.centerIn: parent
                            }
                        }

                        Rectangle {
                            width: 35
                            height: 35
                            radius: 6
                            color: mockCan.batteryWarning ? "#ff8800" : "#1a1a1a"
                            border.color: "#ff8800"
                            border.width: 2

                            Text {
                                text: "⚡"
                                font.pixelSize: 20
                                color: mockCan.batteryWarning ? "#ffffff" : "#ff8800"
                                anchors.centerIn: parent
                            }
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}

