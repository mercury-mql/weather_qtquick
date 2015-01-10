import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: rectRoot
    implicitHeight: 200
    implicitWidth: 200

    property alias source: img.source
    property alias infoText: info.text
    property int msk: 0

    signal iconLoadDone(int msk)

    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log("info clicked")
        }
    }

    ColumnLayout {
        id: columnLayout1
        anchors.fill: parent

        Image {
            id: img
            fillMode: Image.PreserveAspectFit
            Layout.fillWidth: true
            Layout.preferredHeight: rectRoot * 2/3
            onStatusChanged: {
                if( status == Image.Ready ){
                    rectRoot.iconLoadDone(msk)
                }
            }
        }

        Text {
            id: info
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pointSize: 25
            font.bold: true
            color: "white"
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignTop
        }
    }
}

