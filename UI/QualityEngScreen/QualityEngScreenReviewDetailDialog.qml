import QtQuick 2.0

Rectangle {
    id: review_detail_dialog
    signal destroyMe()
    anchors.fill: parent
    property int rad: 10

    //outer rectangle
    Rectangle{
        id: outer_rectangle
        radius: rad
        border{
            width: 5
            color: "#AFD045"
        }
    }
}
