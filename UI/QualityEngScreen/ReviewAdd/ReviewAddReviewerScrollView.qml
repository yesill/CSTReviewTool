import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    //property double rowHeight
    property int fontPixelSize
    property int numberOfReviewers: 3
    property int rad: 6

    signal sigReviewerAddDialog()

    ScrollView {
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        clip: true

        Flickable {
            id: flickable1
            width: parent.width
            height: parent.height
            contentWidth: width
            contentHeight: height * 2

            Rectangle{
                id: containerRect
                height: parent.height
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: parent.width * 0.02
                anchors.rightMargin: parent.width * 0.02
                color: "transparent"

                property double rowHeight: flickable1.height / 5

                TextEdit {
                    anchors.fill: parent
                    font.pixelSize: 24
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/
