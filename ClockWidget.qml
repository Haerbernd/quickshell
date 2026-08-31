import QtQuick
import QtQuick.Layouts

Item {
        implicitHeight: row.implicitHeight
        implicitWidth: row.implicitWidth

        RowLayout {
                id: row
                spacing: 0

                Text {
                        color: root.colFg
                        style: Text.Outline
                        styleColor: "black"
                        font.pixelSize: root.fontSize
                        font.family: root.fontFamily
                        text: Time.time
                }

                Item {
                        Layout.fillWidth: true
                }

                Rectangle {
                        Layout.preferredWidth: 1
                        Layout.preferredHeight: 40
                        Layout.leftMargin: 5
                        Layout.rightMargin: 5
                        color: root.colFg
                }
 
                Text {
                        color: root.colFg
                        style: Text.Outline
                        styleColor: "black"
                        font.pixelSize: root.fontSize
                        font.family: root.fontFamily

                        text: Time.date
                }
        }
}
