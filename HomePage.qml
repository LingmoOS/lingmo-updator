import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import CuteUI 1.0 as CuteUI
import Cute.Updator 1.0

Item {
    id: control

    property bool error: false

    Connections {
        target: updator

        function onCheckError(details) {
            control.error = true
            _textArea.text = details
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: CuteUI.Units.largeSpacing * 2

        Item {
            Layout.fillHeight: true
        }

        Image {
            width: 64
            height: 64
            sourceSize: Qt.size(width, height)
            source: "qrc:/images/update.png"
            Layout.alignment: Qt.AlignHCenter
            visible: control.error
        }

        CuteUI.BusyIndicator {
            width: 64
            height: 64
            Layout.alignment: Qt.AlignHCenter
            visible: !control.error
        }

        Label {
            text: qsTr("Checking for updates...")
            Layout.alignment: Qt.AlignHCenter
            visible: !control.error
        }

        Label {
            text: updator.checkProgress + "%"
            Layout.alignment: Qt.AlignHCenter
            color: CuteUI.Theme.disabledTextColor
            visible: !control.error
        }

        // Error

        Label {
            text: qsTr("Check for update failure")
            Layout.alignment: Qt.AlignHCenter
            color: CuteUI.Theme.disabledTextColor
            visible: control.error
        }

        Button {
            text: qsTr("Recheck")
            flat: true
            Layout.alignment: Qt.AlignHCenter
            visible: control.error
            onClicked: {
                Qt.openUrlExternally("https://www.cuteos.cn/update/20/update.html")
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
