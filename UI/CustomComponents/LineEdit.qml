import QtQuick 2.0

Item {

    property int fontPixelSize

    signal clearSignal(bool cs)

    function clearSignalFunct(cs){
        if (cs){
            textInput1.text = ""
        }
    }

    Component.onCompleted: {
        clearSignal.connect(clearSignalFunct)
    }

    Rectangle{
        id: textInputCoverRect
        width: parent.width
        height: parent.height * 0.5
        radius: 5
        border.width: 1
        border.color: "#000000"
        anchors.centerIn: parent

        Rectangle{
            id: clearLine
            width: parent.width * 0.03
            height: width
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.01
            anchors.verticalCenter: parent.verticalCenter

            color: "transparent"
            visible: false

            Image {
                id: clearLineImg
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
                source: "../../sources/x1.png"
                anchors.fill: parent

                MouseArea{
                    id: clearLineMA
                    anchors.fill: parent
                    onClicked: {
                        clearSignal(true)
                    }
                }
            }

        }

        TextInput{
            id: textInput1
            anchors.fill: parent
            anchors.topMargin: parent.height * 0.1
            anchors.leftMargin: parent.width * 0.02
            anchors.rightMargin: parent.width * 0.05
            font.pixelSize: fontPixelSize
            clip: true
            maximumLength: 200
            //inputMethodHints: Qt.ImhFormattedNumbersOnly
            onLengthChanged: {
                if (length == maximumLength){
                    textInputCoverRect.border.color = "#ff0000"
                }else{
                    textInputCoverRect.border.color = "#000000"
                }
                if (length >= 1){
                    clearLine.visible = true
                }else{
                    clearLine.visible = false
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.25;height:480;width:640}
}
##^##*/
