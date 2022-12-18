import QtQuick 2.0

Item {
    property string labelText
    property int font_pixel_size

    //label rect
    Rectangle{
        id: labelRect
        anchors.fill: parent

        Text{
            id: text
            anchors.fill: parent
            font.pixelSize: font_pixel_size
            //horizontalAlignment: Text.left
            verticalAlignment: Text.AlignVCenter
            text: labelText
        }
    }
}
