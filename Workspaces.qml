import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
        id: workspaceWidget
        required property var screen

        anchors.margins: 8
        spacing: 8

        Repeater {
                model: Hyprland.workspaces.values.filter(
                        w => w.monitor?.name === workspaceWidget.screen.name
                )

                Text {
                        required property var modelData

                        property bool isActive: Hyprland.focusedWorkspace?.id === modelData.id

                        text: modelData.id
                        color: isActive ? root.colSelect1 : root.colFg

                        font {
                                pixelSize: root.fontSize
                                family: root.fontFamily
                                bold: true
                        }

                        MouseArea {
                                anchors.fill: parent

                                onClicked: Hyprland.dispatch("workspace " + modelData.id)
                        }
                }
        }
}
