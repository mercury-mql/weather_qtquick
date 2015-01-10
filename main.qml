import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle {
    id: root
    width: 480
    height: 640

    property int orgX
    property int orgY
    property bool leftVisible: false
    property bool rightVisible: false

    function computeMousePressed(x, y){
        root.orgX = x
        root.orgY = y
        console.log("main pressed")
    }

    function computeMouseReleased(x,y){
        var curX = x
        var curY = y
        var deltaX = Math.abs(curX - root.orgX)
        var deltaY = Math.abs(curY - root.orgY)
        if( deltaX > deltaY ){
            if( curX > root.orgX){
                if( root.rightVisible ){
                    rightRect.reset()
                    root.rightVisible = false
                }else{
                    leftRect.activate()
                    root.leftVisible = true
                }
            }else{
                if( root.leftVisible ){
                    leftRect.reset()
                    root.leftVisible = false
                }else{
                    rightRect.activate()
                    root.rightVisible = true
                }
            }
        }
        console.log("main released")
    }

    MouseArea{
        id: mainMouseArea
        anchors.fill: parent
        onPressed: {
            console.log("in")
            computeMousePressed(mouse.x, mouse.y)
        }

        onReleased: {
            console.log("in too")
            computeMouseReleased(mouse.x, mouse.y)
        }
    }

    MainRect {
        id: mainRect
        x: 0
        y: 0
        z: 1
        width: 480
        height: 640
        color: "orange"
    }

    Rectangle {
        id: leftRect
        x: -parent.width * 0.75
        y: 0
        z: 2
        width: parent.width * 0.75
        height: parent.height
        color: "#1aa586"

        Behavior on x{
            NumberAnimation{
                duration: 700
            }
        }

        function reset(){
            x = -parent.width * 0.75
        }

        function activate(){
            x = 0
        }
    }

    Rectangle{
        id: rightRect
        x: parent.width
        y: 0
        z: 2
        width: parent.width * 0.75
        height: parent.height
        color: "blue"

        Behavior on x{
            NumberAnimation{
                duration: 700
            }
        }

        function reset(){
            x = parent.width
        }

        function activate(){
            x = parent.width * 0.25
        }

    }

}
