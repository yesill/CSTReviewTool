import QtQuick 2.0

Item {
    id: containerItem

    property string button1Text
    property string button2Text
    property int fontPixelSize
    property int borderRadius
    property int buttonThickness
    property string buttonColor

    signal button1Click(bool click)
    signal button2Click(bool click)

    Component.onCompleted: {
        button1.buttonClicked.connect(button1Click)
        button2.buttonClicked.connect(button2Click)
    }

    Rectangle{
        id: row
        anchors.fill: parent

        property double column_width: width * 0.2
        property double column_height: height * 0.5

        Rectangle{
            id: column1
            width: parent.column_width
            height: parent.column_height
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: parent.column_height * 0.5
            anchors.leftMargin: parent.column_width

            CustomButton1{
                id: button1
                anchors.fill: parent
                buttonText: button1Text
                fontPixelSize: containerItem.fontPixelSize
                borderRadius: containerItem.borderRadius
                buttonThickness: containerItem.buttonThickness
                buttonColor: containerItem.buttonColor
            }
        }

        Rectangle{
            id: column2
            width: parent.column_width
            height: parent.column_height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: parent.column_height * 0.5
            anchors.rightMargin: parent.column_width

            CustomButton1{
                id: button2
                anchors.fill: parent
                buttonText: button2Text
                fontPixelSize: containerItem.fontPixelSize
                borderRadius: containerItem.borderRadius
                buttonThickness: containerItem.buttonThickness
                buttonColor: containerItem.buttonColor
            }
        }
    }

}
