import QtQuick 2.0
import "../../CustomComponents" as CustomComponents

Item {
    property string labelText
    property int fontPixelSize

    signal clearLine(bool click)

    Component.onCompleted: {
        clearLine.connect(lineEdit.clearSignal)
    }

    Rectangle{
        id: outerRect
        width: parent.width
        height: parent.height

        property double column_width_relative: outerRect.width * 0.48

        //label rect
        Rectangle{
            id: labelRect
            width: outerRect.column_width_relative
            height: parent.height
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left

            Text{
                id: text
                anchors.fill: parent
                font.pixelSize: fontPixelSize
                horizontalAlignment: Text.left
                verticalAlignment: Text.AlignVCenter
                text: labelText
            }
        }

        //text input rect
        Rectangle{
            id: textInputRect
            width: outerRect.column_width_relative
            height: parent.height
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            CustomComponents.LineEdit{
                id: lineEdit
                anchors.fill: parent
                fontPixelSize: fontPixelSize
            }
        }

    }

}
