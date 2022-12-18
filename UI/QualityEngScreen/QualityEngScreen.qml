import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Window 2.11

Item {
    id: quality_engine_screen
    property int rad: 10
    property var review_add_dialog_holder: null

    //functions for review add
    function createReviewAddDialog(){
        var component = Qt.createComponent("ReviewAdd/ReviewAddDialog.qml")
        review_add_dialog_holder = component.createObject(quality_engine_screen,{"x":0,"y":0})
        if(review_add_dialog_holder){
            review_add_dialog_holder.anchors.fill = quality_engine_screen
            review_add_dialog_holder.destroyMe.connect(destroyDialog)
        }
    }

    function destroyDialog(){
        if(review_add_dialog_holder !== null){
            review_add_dialog_holder.destroy()
            review_add_dialog_holder = null
        }
    }

    //outer rectangle
    Rectangle{
        id: quality_engine_screen_background
        anchors.fill: parent
        radius: rad

        //reviews list rectangle
        Rectangle{
            id: reviews_list_rectangle
            width: parent.width*0.8
            height: parent.height*0.8
            radius: rad
            border.color: "#000000"
            border.width: 3
            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            ListView{
                id: quality_engine_screen_listView
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.012
                clip: true

                model: _DBListModel
                delegate: QualityEngScreenReviewListRectangle {
                    title: model.title
                    start_date: model.start_date
                    end_date: model.end_date
                    status: model.status
                }
            }

        }//reviews list rectangle ends

        //review add button
        Rectangle{
            id: review_add_rectangle
            width: parent.width*0.12
            height: parent.height*0.05
            radius: rad
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.rightMargin: 20
            border.width: 2
            border.color: "#AAAA00"
            Text{
                anchors.centerIn: parent
                font.pixelSize: 20
                color: "#000000"
                text: "CREATE REVIEW"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: createReviewAddDialog()
            }
        }
    }
}
