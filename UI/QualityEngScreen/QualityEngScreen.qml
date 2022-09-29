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
        border.color: "#AA00FF"
        border.width: 5
        radius: rad

        //reviews list rectangle
        Rectangle{
            id: reviews_list_rectangle
            width: parent.width*0.8
            height: parent.height*0.8
            radius: rad
            border{
                color: "#000000"
                width: 5
            }
            anchors{
                centerIn: parent
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }


            ScrollView{
                id: reviews_scroll_view
                anchors.fill: parent

                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn

                ListView{
                    id: quality_engine_screen_listView
                    anchors.fill: parent
                    anchors.topMargin: 6
                    anchors.bottomMargin: 6
                    clip: true
                    snapMode: ListView.SnapToItem
                    headerPositioning: ListView.OverlayHeader
                    header: Rectangle{
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-8
                        //height: reviews_list_rectangle.height*0.2
                        z: 2

                        color: "#aa0045"
                    }
                    /* //default highlighter ! not useful
                    highlight: highlight_bar
                    Component{
                        id: highlight_bar
                        Rectangle{
                            width: parent.width - 12
                            height: 20
                            radius: rad
                            anchors{
                                horizontalCenter: parent.horizontalCenter
                            }

                            border{
                                color: "#14a6db"
                                width: 3
                            }
                            color: "transparent"
                        }
                    }*/

                    model: QualityEngScreenReviewListModel{}
                    delegate: QualityEngScreenReviewListRectangle{}
                }//list view ends

            }

        }//reviews list rectangle ends

        //review add button
        Rectangle{
            id: review_add_rectangle
            width: parent.width*0.12
            height: parent.height*0.05
            radius: rad
            anchors{
                bottom: parent.bottom
                right: parent.right
                bottomMargin: 20
                rightMargin: 20
            }
            border{
                width: 2
                color: "#AAAA00"
            }
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
