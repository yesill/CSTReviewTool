import QtQuick 2.0

Item {

    property int fontPixelSize

    Rectangle{
        id: outerRect
        width: parent.width
        height: parent.height

        // ad soyad
        Rectangle{
            width: parent.width * 0.5
            height: parent.height
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Text{
                id: textName
                anchors.fill: parent
                font.pixelSize: fontPixelSize
                horizontalAlignment: Text.left
                verticalAlignment: Text.AlignVCenter
                text: "Ad Soyad"
            }
        }

        //pozisyon
        Rectangle{
            width: parent.width * 0.5
            height: parent.height
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Text{
                id: textPosition
                anchors.fill: parent
                font.pixelSize: fontPixelSize
                horizontalAlignment: Text.left
                verticalAlignment: Text.AlignVCenter
                text: "pozisyon"
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/
