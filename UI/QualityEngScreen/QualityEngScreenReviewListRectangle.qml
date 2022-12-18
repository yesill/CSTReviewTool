import QtQuick 2.0

Rectangle {
    id: outer_rectangle
    //width: parent.width
    height: 100
    color: "transparent"

    radius: 10
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.leftMargin: parent.width * 0.007
    anchors.rightMargin: parent.width * 0.016

    property string title
    property string start_date
    property string end_date
    property string status

    default property int font_pixel_size: 22

    //click event
    //list object mouse -basic- animation
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
        //width: parent.width * 0.6
        height: parent.height
        color: "transparent"
        anchors.top: outer_rectangle.top
        anchors.bottom: outer_rectangle.bottom
        anchors.left: outer_rectangle.left
        anchors.right: start_date.left
        anchors.leftMargin: parent.width * 0.01

        Text{
            id: text_title
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.5

            font.pixelSize: font_pixel_size
            text: title     // @@@@@@@@@@@@@@@@@@@@@@@@@
        }
    }
    //start date rectangle
    Rectangle{
        id: start_date_rectangle
        width: parent.width * 0.1
        height: parent.height
        color: "transparent"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: end_date_rectangle.left
        Text{
            anchors.centerIn: parent
            font.pixelSize: font_pixel_size
            text: start_date    // @@@@@@@@@@@@@@@@@@@@@@@@@
        }
    }
    //end date rectangle
    Rectangle{
        id: end_date_rectangle
        width: parent.width * 0.16
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: status_rectangle.left
        color: "transparent"
        Text{
            anchors.centerIn: parent
            font.pixelSize: font_pixel_size
            text: end_date  // @@@@@@@@@@@@@@@@@@@@@@@@@
        }
    }
    //status rectangle
    Rectangle{
        id: status_rectangle
        width: parent.width * 0.1
        height: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: outer_rectangle.right
        color: "transparent"
        Text{
            anchors.centerIn: parent
            font.pixelSize: font_pixel_size
            text: status    // @@@@@@@@@@@@@@@@@@@@@@@@@
        }
    }
}//delegate ends
