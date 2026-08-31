import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
        Variants {
                model: Quickshell.screens
                
                PanelWindow {
                        id: root

                        property color colBg: "#333144"
                        property color colFg: "white"
                        property color colSelect1: "#EE82EE"
                        property color colYellow: "#e0af68"
                        property color colCyan: "#0db9d7"

                        property string fontFamily: "JetBrainsMono Nerd Font"
                        property int fontSize: 14

                        required property var modelData
                        screen: modelData

                        color: colBg

                        anchors {
                                top: true
                                left: true
                                right: true
                        }

                        implicitHeight: 40 

                        Workspaces {
                                screen: root.modelData
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                        }

                        RowLayout {
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.margins: 0
                                spacing: 10

                                Item { Layout.fillWidth: true }

                                Rectangle {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: systemStats.implicitHeight
                                        Layout.preferredWidth: systemStats.implicitWidth
                                        color: "transparent"

                                        SystemStats {
                                                id: systemStats
                                        }
                                }

                                Rectangle {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: clock.implicitHeight
                                        Layout.preferredWidth: clock.implicitWidth
                                        color: "transparent"

                                        ClockWidget {
                                                id: clock
                                        }
                                }
                        }
                }
        }
}
