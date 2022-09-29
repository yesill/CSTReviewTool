import QtQuick 2.0
import QtGraphicalEffects 1.12

Item {

    signal destroyMe()

    anchors.fill: parent

    Rectangle{
        id: containerRect
        anchors.fill: parent
        color: "transparent"

        MouseArea{
            id: ma1
            anchors.fill: parent
            onClicked: {
                destroyMe()
            }
        }

        /*MultiPointTouchArea{
            id: clickCatcher
            anchors.fill: parent
            mouseEnabled: true
            minimumTouchPoints: 1
            maximumTouchPoints: 1
        }*/

        /*FastBlur {
            anchors.fill: containerRect
            source: containerRect
            radius: 32
        }*/

        Rectangle{
            id: windowRect
            width: parent.width * 0.6
            height: parent.height * 0.6
            anchors.centerIn: parent
            radius: 6
            border.width: 3
            border.color: "#eeeeee"

            MouseArea{
                id: denemeMA
                anchors.fill: parent
            }

        }

        DropShadow {
            id: rectShadow
            anchors.fill: source
            cached: true
            horizontalOffset: 10
            verticalOffset: 10
            radius: 8
            samples: 16
            color: "#80000000"
            smooth: true
            source: windowRect
        }

    }
}
