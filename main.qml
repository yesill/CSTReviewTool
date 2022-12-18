import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Window 2.11

import "UI/QualityEngScreen" as QES

ApplicationWindow {
    id: main_window
    width: 1366
    height: 768
    visible: true

    header: ToolBar{
        //outer rectangle
        Rectangle{
            anchors.fill: parent
            color: "#827979"

            // logo rectangle
            Rectangle{
                height: parent.height
                width: parent.width*0.2
                color: "transparent"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                Text{
                    text: "REVIEW TOOL v0.5.3"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 0.1
                }
            }
        }
    }

    QES.QualityEngScreen {
        anchors.fill: parent
    }

    /*StackView{
        id: stackview
        anchors.fill: parent

        Loader{
            id: main_loader
            anchors.fill: parent
            source: "./UI/QualityEngScreen/QualityEngScreen.qml"
        }
    }*/
}
