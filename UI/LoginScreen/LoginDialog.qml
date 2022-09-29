import QtQuick 2.0

Rectangle{
    id: login_dialog
    signal destoryMe()

    anchors.fill: parent

    property int rad: 20

    //outer Rectangle
    Rectangle{
        id: outer_rectangle
        width: parent.width * 0.4
        height: parent.height * 0.5
        border.color: "#000000"
        border.width: 4
        radius: rad
        anchors.centerIn: parent

        //user id outer layout
        Rectangle{
            id: user_id_outer
            width: parent.width * 0.9
            height: parent.height * 0.25
            border.color: "#8a3838"
            border.width: 4
            radius: rad
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: outer_rectangle.top
                topMargin: parent.height * 0.075
            }
        }

        //password outer layout
        Rectangle{
            id: password_outer
            width: parent.width * 0.9
            height: parent.height * 0.25
            border.color: "#d4b320"
            border.width: 4
            radius: rad
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: user_id_outer.bottom
                topMargin: parent.height * 0.05
            }
        }

        //password outer layout
        Rectangle{
            id: login_button_outer
            width: parent.width * 0.9
            height: parent.height * 0.25
            border.color: "#3d8519"
            border.width: 4
            radius: rad
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: password_outer.bottom
                topMargin: parent.height * 0.05
            }
        }
    }

}
