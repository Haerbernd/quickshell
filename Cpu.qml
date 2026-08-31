import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Item {
        id: cpuItem
        property int cpuUsage: 0
        property var lastCpuIdle: 0
        property var lastCpuTotal: 0

        implicitWidth: cpuTxt.implicitWidth
        implicitHeight: cpuTxt.implicitHeight

        Text {
                id: cpuTxt
                anchors.verticalCenter: parent.verticalCenter
                text: "CPU: " + cpuItem.cpuUsage + "%"
                color: root.colYellow
                font {
                        family: root.fontFamily
                        pixelSize: root.fontSize
                        bold: true
                }
        }

        Process {
                id: cpuProc
                command: ["sh", "-c", "head -1 /proc/stat"]
                stdout: SplitParser {
                        onRead: data => {
                                if (!data) return
                                var p = data.trim().split(/\s+/)
                                var idle = parseInt(p[4]) + parseInt(p[5])
                                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 8)
                                if (cpuItem.lastCpuTotal > 0) {
                                        cpuItem.cpuUsage = Math.round(100 * (1 - (idle - cpuItem.lastCpuIdle) / (total - cpuItem.lastCpuTotal))) 
                                }
                                cpuItem.lastCpuTotal = total
                                cpuItem.lastCpuIdle = idle
                        }
                }
        }

        function start() {
                cpuProc.running = true
        }
}
