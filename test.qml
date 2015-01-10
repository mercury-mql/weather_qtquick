import QtQuick 2.0

Rectangle {
    color: "yellow"
    width: 480; height: 640

    Flickable{
        anchors.fill: parent
        contentHeight: grp.height
        contentWidth: grp.height
        flickableDirection: Flickable.HorizontalAndVerticalFlick
        Item{
            id: grp
            x: 0
            y: 0
            width: 1440
            height: 800

            Rectangle {
                id: rectangle1
                width: 480
                height: 640
                color: "#2ca13f"
            }

            Rectangle {
                id: rectangle2
                x: 480
                width: 480
                height: 640
                color: "#20a5bf"
            }

            Rectangle {
                id: rectangle3
                x: 960
                width: 480
                height: 640
                color: "#e14bc8"
            }

        }
    }
}

