import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import CuteUI 1.0 as CuteUI
import Cute.Updator 1.0

Item {
    id: control

    ColumnLayout {
        anchors.fill: parent

        CuteUI.BusyIndicator {
            width: 32
            height: 32
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            height: CuteUI.Units.smallSpacing
        }

        Label {
            text: qsTr("Updating, please wait")
            Layout.alignment: Qt.AlignHCenter
        }

        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true

            TextArea {
                id: _textArea
                text: updator.statusDetails
                enabled: false

                background: Item {
                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: CuteUI.Units.largeSpacing
                        radius: CuteUI.Theme.smallRadius
                        color: CuteUI.Theme.secondBackgroundColor
                    }
                }

                leftPadding: CuteUI.Units.largeSpacing * 2
                rightPadding: CuteUI.Units.largeSpacing * 2
                topPadding: CuteUI.Units.largeSpacing * 2
                bottomPadding: CuteUI.Units.largeSpacing * 2

                // Auto scroll to bottom.
                onTextChanged: {
                    _textArea.cursorPosition = _textArea.text.length - 1
                }
            }
        }
    }
}
