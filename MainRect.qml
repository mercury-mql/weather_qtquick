import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: mainRoot
    width: 480
    height: 640
    property string citykey : "101120301"

/*
    property var xmlHttp: null
    property string city: ""
    property string wendu: ""
    property string fengli: ""
    property string shidu: ""
    property string sunrise_1: ""
    property string sunset_1: ""



    property var weather: null
    property var weather_high: null
    property var weather_low: null
    property var weather_day_type: null
    property var weather_day_fx: null
    property var weather_day_fl: null
    property var weather_night_type: null
    property var weather_night_fx: null
    property var weather_night_fl: null



    function parseDayAndNight(elem, isDay){
        var childElem = elem.firstChild
        while( childElem ){
            switch(childElem.nodeName){
            case "type_1":
            case "type":
                if(isDay){
                    weather_day_type.push(childElem.childNodes[0].nodeValue)
                }else{
                    weather_night_type.push(childElem.childNodes[0].nodeValue)
                }
                console.log(childElem.nodeName, childElem.childNodes[0].nodeValue)
                break
            case "fx_1":
            case "fengxiang":
                if(isDay){
                    weather_day_fx.push(childElem.childNodes[0].nodeValue)
                }else{
                    weather_night_fx.push(childElem.childNodes[0].nodeValue)
                }
                console.log(childElem.nodeName, childElem.childNodes[0].nodeValue)
                break
            case "fl_1":
            case "fengli":
                if(isDay){
                    weather_day_fl.push(childElem.childNodes[0].nodeValue)
                }else{
                    weather_night_fl.push(childElem.childNodes[0].nodeValue)
                }
                console.log(childElem.nodeName, childElem.childNodes[0].nodeValue)
                break
            }

            childElem = childElem.nextSibling
        }
    }

    function parseWeather(elem){
        var childElem = elem.firstChild
        while( childElem ){
            switch(childElem.nodeName){
            case "date_1":
            case "date":
                weather.push(childElem.childNodes[0].nodeValue)
                console.log(childElem.nodeName, childElem.childNodes[0].nodeValue)
                break
            case "high_1":
            case "high":
                weather_high.push(childElem.childNodes[0].nodeValue)
                console.log(childElem.nodeName, childElem.childNodes[0].nodeValue)
                break
            case "low_1":
            case "low":
                weather_low.push(childElem.childNodes[0].nodeValue)
                console.log(childElem.nodeName, childElem.childNodes[0].nodeValue)
                break
            case "day_1":
            case "day":
                 console.log(childElem.nodeName)
                parseDayAndNight(childElem, true)
                break
            case "night_1":
            case "night":
                console.log(childElem.nodeName)
                parseDayAndNight(childElem, false)
                break
            }

            childElem = childElem.nextSibling

        }
    }

    function parseForecast(elem){
        var weather = elem.firstChild
        var i = 0
        while( weather ){
            if( weather.nodeName == "weather" ){
                parseWeather(weather)
            }
            weather = weather.nextSibling
            i += 1
        }
    }


    function parseDOM(dom){

        weather = new Array
        weather_high = new Array
        weather_low = new Array
        weather_day_type = new Array
        weather_day_fx = new Array
        weather_day_fl = new Array
        weather_night_type = new Array
        weather_night_fx = new Array
        weather_night_fl = new Array

        var docElemnt = dom.documentElement
        var curElem = docElemnt.firstChild
        while( curElem ){
            switch(curElem.nodeName){
            case "city":
                city = curElem.childNodes[0].nodeValue
                break;
            case "wendu":
                wendu = curElem.childNodes[0].nodeValue
                break;
            case "fengli":
                fengli = curElem.childNodes[0].nodeValue
                break;
            case "shidu":
                shidu = curElem.childNodes[0].nodeValue
                break;
            case "sunrise_1":
                sunrise_1 = curElem.childNodes[0].nodeValue
                break;
            case "sunset_1":
                sunset_1 = curElem.childNodes[0].nodeValue
                break;
            case "yesterday":
                parseWeather(curElem)
                break;
            case "forecast":
                parseForecast(curElem)
                break;
            }

            curElem = curElem.nextSibling
        }

    }

    function fillWeatherInfo(){
        console.log(weather_day_type)
        mainStatus.text = weather_day_type[1]
    }

    function onReadyStatusChanged(){
        if(xmlHttp.readyState == 4){
            if( xmlHttp.status == 200 ){
                parseDOM(xmlHttp.responseXML)
                fillWeatherInfo()
            }
        }
    }

    function get(){
        if(xmlHttp == null){
            xmlHttp = new XMLHttpRequest()
            xmlHttp.onreadystatechange = onReadyStatusChanged
        }
        xmlHttp.open("GET", "http://wthrcdn.etouch.cn/WeatherApi?citykey=" + mainRoot.citykey)
        xmlHttp.send(null)
    }
*/


    Component{
        id: xmlListModel
        XmlListModel{
            source: "http://wthrcdn.etouch.cn/WeatherApi?citykey=" + mainRoot.citykey
            query: "/resp"
            XmlRole{
                name: "city"
                query: "city/string()"
            }
            XmlRole{
                name: "wendu"
                query: "wendu/number()"
            }
            XmlRole{
                name: "fengli"
                query: "fengli/string()"
            }
            XmlRole{
                name: "shidu"
                query: "shidu/string()"
            }
            XmlRole{
                name: "fengxiang"
                query: "fengxiang/string()"
            }
            XmlRole{
                name: "sunrise_1"
                query: "sunrise_1/string()"
            }
            XmlRole{
                name: "sunset_1"
                query: "sunset_1/string()"
            }

            XmlRole{
                name: "yesterday_date"
                query: "yesterday/date_1/string()"
            }

            XmlRole{
                name: "yesterday_high"
                query: "yesterday/high_1/string()"
            }

            XmlRole{
                name: "yesterday_low"
                query: "yesterday/low_1/string()"
            }

            XmlRole{
                name: "yesterday_day_type"
                query: "yesterday/day_1/type_1/string()"
            }

            XmlRole{
                name: "yesterday_day_fx"
                query: "yesterday/day_1/fx_1/string()"
            }

            XmlRole{
                name: "yesterday_day_fl"
                query: "yesterday/day_1/fl_1/string()"
            }

            XmlRole{
                name: "yesterday_night_type"
                query: "yesterday/night_1/type_1/string()"
            }

            XmlRole{
                name: "yesterday_night_fx"
                query: "yesterday/night1/fx_1/string()"
            }

            XmlRole{
                name: "yesterday_night_fl"
                query: "yesterday/night_1/fl_1/string()"
            }

            XmlRole{
                name: "forecast1_date"
                query: "forecast/weather[1]/date/string()"
            }

            XmlRole{
                name: "forecast1_high"
                query: "forecast/weather[1]/high/string()"
            }

            XmlRole{
                name: "forecast1_low"
                query: "forecast/weather[1]/low/string()"
            }

            XmlRole{
                name: "forecast1_day_type"
                query: "forecast/weather[1]/day/type/string()"
            }

            XmlRole{
                name: "forecast1_day_fx"
                query: "forecast/weather[1]/day/fengxiang/string()"
            }

            XmlRole{
                name: "forecast1_day_fl"
                query: "forecast/weather[1]/day/fengli/string()"
            }

            XmlRole{
                name: "forecast1_night_type"
                query: "forecast/weather[1]/night/type/string()"
            }

            XmlRole{
                name: "forecast1_night_fx"
                query: "forecast/weather[1]/night/fengxiang/string()"
            }

            XmlRole{
                name: "forecast1_night_fl"
                query: "forecast/weather[1]/night/fengli/string()"
            }

            XmlRole{
                name: "forecast2_date"
                query: "forecast/weather[2]/date/string()"
            }

            XmlRole{
                name: "forecast2_high"
                query: "forecast/weather[2]/high/string()"
            }

            XmlRole{
                name: "forecast2_low"
                query: "forecast/weather[2]/low/string()"
            }

            XmlRole{
                name: "forecast2_day_type"
                query: "forecast/weather[2]/day/type/string()"
            }

            XmlRole{
                name: "forecast2_day_fx"
                query: "forecast/weather[2]/day/fengxiang/string()"
            }

            XmlRole{
                name: "forecast2_day_fl"
                query: "forecast/weather[2]/day/fengli/string()"
            }

            XmlRole{
                name: "forecast2_night_type"
                query: "forecast/weather[2]/night/type/string()"
            }

            XmlRole{
                name: "forecast2_night_fx"
                query: "forecast/weather[2]/night/fengxiang/string()"
            }

            XmlRole{
                name: "forecast2_night_fl"
                query: "forecast/weather[2]/night/fengli/string()"
            }

            XmlRole{
                name: "forecast3_date"
                query: "forecast/weather[3]/date/string()"
            }

            XmlRole{
                name: "forecast3_high"
                query: "forecast/weather[3]/high/string()"
            }

            XmlRole{
                name: "forecast3_low"
                query: "forecast/weather[3]/low/string()"
            }

            XmlRole{
                name: "forecast3_day_type"
                query: "forecast/weather[3]/day/type/string()"
            }

            XmlRole{
                name: "forecast3_day_fx"
                query: "forecast/weather[3]/day/fengxiang/string()"
            }

            XmlRole{
                name: "forecast3_day_fl"
                query: "forecast/weather[3]/day/fengli/string()"
            }

            XmlRole{
                name: "forecast3_night_type"
                query: "forecast/weather[3]/night/type/string()"
            }

            XmlRole{
                name: "forecast3_night_fx"
                query: "forecast/weather[3]/night/fengxiang/string()"
            }

            XmlRole{
                name: "forecast3_night_fl"
                query: "forecast/weather[3]/night/fengli/string()"
            }

            XmlRole{
                name: "forecast4_date"
                query: "forecast/weather[4]/date/string()"
            }

            XmlRole{
                name: "forecast4_high"
                query: "forecast/weather[4]/high/string()"
            }

            XmlRole{
                name: "forecast4_low"
                query: "forecast/weather[4]/low/string()"
            }

            XmlRole{
                name: "forecast4_day_type"
                query: "forecast/weather[4]/day/type/string()"
            }

            XmlRole{
                name: "forecast4_day_fx"
                query: "forecast/weather[4]/day/fengxiang/string()"
            }

            XmlRole{
                name: "forecast4_day_fl"
                query: "forecast/weather[4]/day/fengli/string()"
            }

            XmlRole{
                name: "forecast4_night_type"
                query: "forecast/weather[4]/night/type/string()"
            }

            XmlRole{
                name: "forecast4_night_fx"
                query: "forecast/weather[4]/night/fengxiang/string()"
            }

            XmlRole{
                name: "forecast4_night_fl"
                query: "forecast/weather[4]/night/fengli/string()"
            }

            XmlRole{
                name: "forecast5_date"
                query: "forecast/weather[5]/date/string()"
            }

            XmlRole{
                name: "forecast5_high"
                query: "forecast/weather[5]/high/string()"
            }

            XmlRole{
                name: "forecast5_low"
                query: "forecast/weather[5]/low/string()"
            }

            XmlRole{
                name: "forecast5_day_type"
                query: "forecast/weather[5]/day/type/string()"
            }

            XmlRole{
                name: "forecast5_day_fx"
                query: "forecast/weather[5]/day/fengxiang/string()"
            }

            XmlRole{
                name: "forecast5_day_fl"
                query: "forecast/weather[5]/day/fengli/string()"
            }

            XmlRole{
                name: "forecast5_night_type"
                query: "forecast/weather[5]/night/type/string()"
            }

            XmlRole{
                name: "forecast5_night_fx"
                query: "forecast/weather[5]/night/fengxiang/string()"
            }

            XmlRole{
                name: "forecast5_night_fl"
                query: "forecast/weather[5]/night/fengli/string()"
            }

            XmlRole{
                name: "chenglian"
                query: "zhishus/zhishu[1]/value/string()"
            }

            XmlRole{
                name: "chenglian_detail"
                query: "zhishus/zhishu[1]/dtail/string()"
            }

            XmlRole{
                name: "shushidu"
                query: "zhishus/zhishu[2]/value/string()"
            }

            XmlRole{
                name: "shushidu_detail"
                query: "zhishus/zhishu[2]/dtail/string()"
            }

            XmlRole{
                name: "chuanyi"
                query: "zhishus/zhishu[3]/value/string()"
            }

            XmlRole{
                name: "chuanyi_detail"
                query: "zhishus/zhishu[3]/dtail/string()"
            }

            XmlRole{
                name: "ganmao"
                query: "zhishus/zhishu[4]/value/string()"
            }

            XmlRole{
                name: "ganmao_detail"
                query: "zhishus/zhishu[4]/dtail/string()"
            }

            XmlRole{
                name: "liangshai"
                query: "zhishus/zhishu[5]/value/string()"
            }

            XmlRole{
                name: "liangshai_detail"
                query: "zhishus/zhishu[5]/dtail/string()"
            }

            XmlRole{
                name: "lvyou"
                query: "zhishus/zhishu[6]/value/string()"
            }

            XmlRole{
                name: "lvyou_detail"
                query: "zhishus/zhishu[6]/dtail/string()"
            }

            XmlRole{
                name: "ziwaixian"
                query: "zhishus/zhishu[7]/value/string()"
            }

            XmlRole{
                name: "ziwaixian_detail"
                query: "zhishus/zhishu[7]/dtail/string()"
            }

            XmlRole{
                name: "xiche"
                query: "zhishus/zhishu[8]/value/string()"
            }

            XmlRole{
                name: "xiche_detail"
                query: "zhishus/zhishu[8]/dtail/string()"
            }

            XmlRole{
                name: "yundong"
                query: "zhishus/zhishu[9]/value/string()"
            }

            XmlRole{
                name: "yundong"
                query: "zhishus/zhishu[9]/dtail/string()"
            }


            XmlRole{
                name: "yuehui"
                query: "zhishus/zhishu[10]/value/string()"
            }

            XmlRole{
                name: "yuehui_detail"
                query: "zhishus/zhishu[10]/dtail/string()"
            }

            XmlRole{
                name: "yusan"
                query: "zhishus/zhishu[11]/value/string()"
            }

            XmlRole{
                name: "yusan_detail"
                query: "zhishus/zhishu[11]/dtail/string()"
            }

        }
    }


    Component{
        id: listviewDelegate
        Item{
            id: wrapper
            anchors.left: parent.left
            width: parent.width
            anchors.top: parent.top
            height: columnLayout1.height + 50

            ColumnLayout {
                id: columnLayout1
                anchors.left: parent.left
                width: parent.width
                anchors.top: parent.top

                Text {
                    id: mainStatus
                    text: forecast1_day_type
                    font.pointSize: 75
                    font.bold: true
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.width / 2
                }

                GridLayout {
                    id: gridLayout1
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignHCenter
                    columnSpacing: 20
                    rowSpacing: 20
                    columns: 2
                    InfoRect {
                        id: wenduContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: wendu
                        source: "qrc:/setup.png"
                    }


                    InfoRect {
                        id: rangeContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: new String(forecast1_low).substring(3) + "~" + new String(forecast1_high).substring(3)
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: fengxiangContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: forecast1_day_fx
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: fengliContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: forecast1_day_fl
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: shiduContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: shidu
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: ziwaixianContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: ziwaixian
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: sunriseContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: sunrise_1
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: sunsetContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: sunset_1
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: yundongContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: yundong
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: ganmaoContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: ganmao
                        source: "qrc:/setup.png"
                    }

                    InfoRect {
                        id: liangshaiContent
                        width: 200
                        height: 200
                        color: mainRoot.color
                        infoText: liangshai
                        source: "qrc:/setup.png"
                    }

                }

            }

        }
    }

    Rectangle {
        id: titlebar
        height: parent.width/16
        color: mainRoot.color
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        z:2

        RowLayout {
            id: rowLayout1
            spacing: 5
            anchors.fill: parent

            Button {
                id: mainSetupBtn
                text: qsTr("Set")
                Layout.fillHeight: true
                Layout.preferredWidth: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 5

                onClicked: {
                    console.log("Main setup button clicked")
                }

            }

            Text {
                id: mainDateTime
                text: new Date().toLocaleDateString()
                font.pointSize: 12
                Layout.fillHeight: true
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter
                Layout.fillWidth: true
                color: "white"
            }

            Text {
                id: mainCityName
                text: mainRoot.citykey
                anchors.right: parent.right
                anchors.rightMargin: 5
                font.pointSize: 12
                Layout.fillHeight: true
                verticalAlignment: Qt.AlignVCenter
                Layout.alignment: Qt.AlignRight
                color: "white"
            }
        }
    }


    ListView {
        id: listview
        anchors.top: titlebar.bottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width
        delegate: listviewDelegate
        model: xmlListModel.createObject(listview)
    }




/*
      Flickable {
          id: flickable1
          anchors.top: titlebar.bottom
          anchors.topMargin: 5
          anchors.left: parent.left
          width: parent.width
          height: parent.height - titlebar.height
          contentHeight: contentRectangle.height
          contentWidth: contentRectangle.width

          Rectangle {
              id: contentRectangle
              color: "black"
              anchors.left: parent.left
              width: parent.width
              height: columnLayout1.height

              ColumnLayout {
                  id: columnLayout1
                  anchors.fill: parent

                  Text {
                      id: mainStatus
                      text: mainRoot.wendu
                      font.pointSize: 75
                      font.bold: true
                      color: "white"
                      horizontalAlignment: Text.AlignHCenter
                      verticalAlignment: Text.AlignVCenter
                      Layout.fillWidth: true
                      Layout.preferredHeight: parent.width / 2
                  }

                  GridLayout {
                      id: gridLayout1
                      Layout.fillWidth: true
                      Layout.fillHeight: true
                      Layout.alignment: Qt.AlignHCenter
                      columns: 2
                      InfoRect {
                          id: typeContent
                          width: 200
                          height: 200
                          color: mainRoot.color
                          infoText: ""
                          source: "qrc:/setup.png"
                      }

                      InfoRect {
                          id: rangeContent
                          width: 200
                          height: 200
                          color: mainRoot.color
                          infoText: mainRoot.wendu
                          source: "qrc:/setup.png"
                      }

                      InfoRect {
                          id: infoRect1
                      }

                      InfoRect {
                          id: infoRect2
                      }

                      InfoRect {
                          id: infoRect3
                      }

                      InfoRect {
                          id: infoRect4
                      }

                      InfoRect {
                          id: infoRect5
                      }

                      InfoRect {
                          id: infoRect6
                      }

                      InfoRect {
                          id: infoRect7
                      }

                      InfoRect {
                          id: infoRect8
                      }

                      InfoRect {
                          id: infoRect9
                      }

                  }

              }

          }
      }

      Component.onCompleted: {
          get()
      }
*/
}

