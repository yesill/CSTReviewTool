import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Window 2.11

ApplicationWindow {
    id: main_window
    width: 640
    height: 480
    visible: true

    header: ToolBar{
        //outer rectangle
        Rectangle{
            anchors.fill: parent
            color: "#827979"
            //Logo rectangle
            Rectangle{
                height: parent.height
                width: parent.width*0.2
                color: "transparent"
                anchors{
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
                Text{
                    text: "CS-TECH REVIEW TOOL"
                    anchors{
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: parent.width*0.1
                    }
                }
            }//logo rectangle ends
        }
    }

    StackView{
        id: stackview
        anchors.fill: parent

        Loader{
            id: main_loader
            anchors.fill: parent
            source: "./UI/QualityEngScreen/QualityEngScreen.qml"
        }
    }
}
