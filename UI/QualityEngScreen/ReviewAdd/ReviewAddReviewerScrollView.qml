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

                Rectangle{
                    id: addReviewerRow
                    width: parent.width
                    height: containerRect.rowHeight
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right

                    border.width: 2
                    border.color: "#70a0aa"
                    radius: rad

                    Image {
                        id: addImage
                        source: "../../../sources/plus1.png"
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        id: addMA
                        anchors.fill: addImage
                        //on click new dialog
                        onClicked: {
                            sigReviewerAddDialog()
                        }
                    }
                }

                Rectangle{
                    id: row1
                    height: containerRect.rowHeight
                    anchors.top: addReviewerRow.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    border.width: 2
                    border.color: "#70a0aa"
                    radius: rad
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
