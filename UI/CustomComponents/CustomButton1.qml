import QtQuick 2.0

Item {

    property string buttonText
    property int fontPixelSize
    property int borderRadius
    property int buttonThickness
    property string buttonColor
    //property bool buttonClicked: false

    signal buttonClicked (bool click)

    Rectangle{
        id: buttonContainerRect
        anchors.fill: parent
        radius: borderRadius
        border.width: buttonThickness
        border.color: buttonColor

        Text{
            id: text1
            text: qsTr(buttonText)
            anchors.fill: parent
            font.pixelSize: fontPixelSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea{
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                text1.font.bold = true
            }

            onExited: {
                text1.font.bold = false
            }

            onClicked: {
                //buttonClicked = true
                buttonClicked(true)
            }
        }
    }

}
