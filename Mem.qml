import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Item {
        id: memItem
        property int memUsage: 0

        implicitWidth: memTxt.implicitWidth
        implicitHeight: memTxt.implicitHeight

        Text {
                id: memTxt
                anchors.verticalCenter: parent.verticalCenter
                text: "Mem: " + memItem.memUsage + "%"
                color: root.colCyan
                font {
                        family: root.fontFamily
                        pixelSize: root.fontSize
                        bold: true
                }
        }

        Process {
                id: memProc
                command: ["sh", "-c", "free | grep Mem"]
                stdout: SplitParser {
                        onRead: data => {
                                if (!data) return
                                var parts = data.trim().split(/\s+/)
                                var total = parseInt(parts[1]) || 1
                                var used = parseInt(parts[2]) || 0
                                memItem.memUsage = Math.round(100 * used / total)
                        }
                }
        }

        function start() {
                memProc.running = true
        }
}
