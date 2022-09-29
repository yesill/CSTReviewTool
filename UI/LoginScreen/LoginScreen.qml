import QtQuick 2.0

Item {
    id: login_screen
    property var login_screen_holder: null

    function createLoginScreenDialog(){
        var component = Qt.createComponent("LoginDialog.qml")
        login_screen_holder = component.createObject(login_screen,{"x":0, "y":0})
        if(login_screen_holder){
            login_screen_holder.anchors.fill = login_screen
            login_screen_holder.destroyMe.connect(destroyDialog)
        }
    }

    function destroyDialog(){
        if(login_screen_holder !== null){
            login_screen_holder.destroy()
            login_screen_holder = null
        }
    }

    Rectangle{
        id: login_screen_background
        anchors.fill: parent
        color: "#2c2a6b"
        Text{
            id: welcome_text
            anchors.centerIn: parent
            font.pixelSize: 50
            color: "#FFFFFF"
            text: qsTr("CS-TECH REVIEW TOOL")
        }

        MouseArea{
            anchors.fill: parent
            onClicked: createLoginScreenDialog()
        }
    }

}
