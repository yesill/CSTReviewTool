import QtQuick 2.0

Item {
    property string labelText
    property int fontPixelSize

    //label rect
    Rectangle{
        id: labelRect
        anchors.fill: parent

        Text{
            id: text
            anchors.fill: parent
            font.pixelSize: fontPixelSize
            horizontalAlignment: Text.left
            verticalAlignment: Text.AlignVCenter
            text: labelText
        }
    }
}
