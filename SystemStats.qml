import QtQuick
import QtQuick.Layouts

Item {
        implicitWidth: systemStats.implicitWidth
        implicitHeight: systemStats.implicitHeight

        RowLayout {
                id: systemStats

                Cpu {
                        id: cpu
                }

                Mem {
                        id: mem
                }
        }

        Timer {
                interval: 2000
                running: true
                repeat: true
                triggeredOnStart: true

                onTriggered: {
                        cpu.start()
                        mem.start()
                }
        }
}
