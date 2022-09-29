import QtQuick 2.0
import QtQuick.Controls 2.4
import "../../CustomComponents" as CustomComponents

Page {
    id: review_add_dialog
    anchors.fill: parent

    //properties
    property int rad: 20
    property double left_right_margin_relative: 0.15
    property double row_height: height / 14
    property var reviewer_add_dialog_holder: null

    signal destroyMe()

    function reviewAdd(click){
        destroyMe()
    }

    function clearAll(click){
        reviewAddScrollView1.clearAllLines(true)
    }

    function createReviewerAddDialog(){
        var comp = Qt.createComponent("ReviewAddReviewerAddDialog.qml")
        reviewer_add_dialog_holder = comp.createObject(rectangle_general,{"x": 0,"y": 0})

        if (reviewer_add_dialog_holder){
            //reviewer_add_dialog_holder.width = review_add_dialog.width * 0.6
            //reviewer_add_dialog_holder.height = review_add_dialog.height * 0.6
            reviewer_add_dialog_holder.destroyMe.connect(destroyDialog)
        }
    }

    function destroyDialog(){
        if(reviewer_add_dialog_holder !== null){
            reviewer_add_dialog_holder.destroy()
            reviewer_add_dialog_holder = null
        }
    }

    Component.onCompleted: {
        twoButtonRow.button1Click.connect(reviewAdd)
        twoButtonRow.button2Click.connect(clearAll)
        reviewAddScrollView1.sigCreateReviewerAddDialog.connect(createReviewerAddDialog)
    }

    Rectangle {
        id: rectangle_general
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: rectangle_general_column
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: parent.width * left_right_margin_relative
            anchors.leftMargin: parent.width * left_right_margin_relative

            ReviewAddScrollView {
                id: reviewAddScrollView1
                rowHeight: row_height
                anchors{
                    top: parent.top
                    bottom: rowLast.top
                    left: parent.left
                    right: parent.right
                    topMargin: 10
                    bottomMargin: 10
                }
                fontPixelSize: 20

            }

            Rectangle{
                id: rowLast
                height: row_height
                color: "transparent"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height * 0.03

                CustomComponents.TwoButtonRow{
                    id: twoButtonRow
                    anchors.fill: parent
                    button1Text: "Review Başlat"
                    button2Text: "Temizle"
                    fontPixelSize: 20
                    borderRadius: 20
                    buttonThickness: 3
                    buttonColor: "#0000ff"
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
