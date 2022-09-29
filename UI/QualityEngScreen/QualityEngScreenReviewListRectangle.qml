import QtQuick 2.0

Rectangle {
    id: outer_rectangle
    width: parent.width - 12
    height: parent.height / 25
    color: "transparent"
    radius: 10
    anchors.horizontalCenter: parent.horizontalCenter

    //click event
    //list object mouse -basic- animations
    MouseArea{
        property bool isClicked: false
        id: outer_rectangle_mouse_area
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            quality_engine_screen_listView.currentIndex = index
            if(!isClicked){
                parent.border.width = 3
                parent.border.color = "#ff0000"
                isClicked = true
            }else{
                parent.border.width = 0
                isClicked = false
            }

        }
        onEntered: {
            if(!isClicked){
                parent.border.width = 3
                parent.border.color = "#00aaaa"
            }
        }
        onExited: {
            if(!isClicked){
                parent.border.width = 0
            }
        }
    }

    //review title rectangle
    Rectangle{
        id: review_title_rectangle
        width: parent.width * 0.6
        height: parent.height
        color: "transparent"
        anchors{
            horizontalCenter: outer_rectangle.verticalCenter
            left: outer_rectangle.left
        }
        Text{
            id: text_title
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: parent.width*0.05
            }

            font.pixelSize: 30
            text: review_title
        }
    }
    //start date rectangle
    Rectangle{
        id: start_date_rectangle
        width: parent.width * 0.1
        height: parent.height
        color: "transparent"
        anchors{
            horizontalCenter: outer_rectangle.verticalCenter
            right: end_date_rectangle.left
        }
        Text{
            anchors.centerIn: parent
            font.pixelSize: 30
            text: review_start_date
        }
    }
    //end date rectangle
    Rectangle{
        id: end_date_rectangle
        width: parent.width * 0.1
        height: parent.height
        anchors{
            horizontalCenter: outer_rectangle.verticalCenter
            right: notifications_rectangle.left
        }
        color: "transparent"
        Text{
            anchors.centerIn: parent
            font.pixelSize: 30
            text: review_end_date
        }
    }
    //notifications rectangle
    Rectangle{
        id: notifications_rectangle
        width: parent.width * 0.1
        height: parent.height
        anchors{
            horizontalCenter: outer_rectangle.verticalCenter
            right: status_rectangle.left
        }
        color: "transparent"
        Text{
            anchors.centerIn: parent
            font.pixelSize: 30
            text: review_notifications
        }
    }
    //status rectangle
    Rectangle{
        id: status_rectangle
        width: parent.width * 0.1
        height: parent.height
        anchors{
            horizontalCenter: outer_rectangle.verticalCenter
            right: outer_rectangle.right
        }
        color: "transparent"
        Text{
            anchors.centerIn: parent
            font.pixelSize: 30
            text: review_status
        }
    }
}//delegate ends
