    import QtQuick 2.0
import QtQuick.Controls 2.4
import "../../CustomComponents" as CustomComponents

Item {

    property double rowHeight
    property int fontPixelSize

    signal clearAllLines(bool click)
    signal sigCreateReviewerAddDialog()

    function clearAlllinesFunct(click){
        if (click){
            row1.clearLine(true)
            row3.clearLine(true)
            row4.clearLine(true)
            row5.clearLine(true)
            row6.clearLine(true)
            row7.clearLine(true)
            row8.clearLine(true)
            row9.clearLine(true)
            row10.clearLine(true)
        }
    }

    Component.onCompleted: {
        clearAllLines.connect(clearAlllinesFunct)
        row15.sigReviewerAddDialog.connect(sigCreateReviewerAddDialog)
    }



    ScrollView {
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        clip: true

        Flickable{
            width: parent.width
            height: parent.height
            contentWidth: width
            contentHeight: height * 1.7

            Rectangle{
                id: formRect
                height: parent.height * 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: parent.width * 0.02
                anchors.rightMargin: parent.width * 0.02

                ReviewAddRow {
                    id: row1
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    labelText: "Gözden Geçirilen İş Ürünü:"
                    fontPixelSize: fontPixelSize
                }

                CustomComponents.TwoButtonRow{
                    id: row2
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row1.bottom
                    button1Text: "SVK Dökümanı Seç"
                    button2Text: "Proje Dökümanı Seç"
                    fontPixelSize: fontPixelSize
                    borderRadius: 20
                    buttonThickness: 3
                    buttonColor: "#0000ff"
                }

                ReviewAddRow {
                    id: row3
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row2.bottom
                    labelText: "Proje Adı:"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddRow {
                    id: row4
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row3.bottom
                    labelText: "Rapor No:"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddRow {
                    id: row5
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row4.bottom
                    labelText: "Gözden Geçirilen Ürün Tanımı:"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddRow {
                    id: row6
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row5.bottom
                    labelText: "Ürünün Büyüklüğü (Sayfa, SLOC vb.):"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddRow {
                    id: row7
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row6.bottom
                    labelText: "Ürünün Hazırlanma Zamanı (Saat):"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddRow {
                    id: row8
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row7.bottom
                    labelText: "Gözden Geçirme Tarih(ler)i:"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddRow {
                    id: row9
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row8.bottom
                    labelText: "Ürünü Oluşturan (İsim/İmza):"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddRow {
                    id: row10
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row9.bottom
                    labelText: "Eşdeğer Gözden Geçirme Sorumlusu:"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddLabelRow{
                    id: row11
                    width: parent.width
                    height: rowHeight * 1.2
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row10.bottom
                    labelText: "Bulguların Derecelendirilmesi: Ö, A, U, Y\n"+
                               "Ö (I): Önemli (Important)\tU (S): Ufak (Small)\tA (C): Anlaşılırlık (Clarity)\tY (T): Yazım Hatası (Typo)"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddLabelRow{
                    id: row12
                    width: parent.width
                    height: rowHeight * 1.6
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row11.bottom
                    labelText: "Bulguların Sınıfları: Sınıf I, Sınıf II, UD\n"+
                               "Sınıf I: Mühendislik Değişikliği Gerektiren Bulgular (Class I: Findings Requiring Engineering Changes)\n"+
                               "Sınıf II: Mühendislik Değişikliği Gerektirmeyen Bulgular (Class II: Findings Not Requiring Engineering Changes)\n"+
                               "UD: Uygun Değil (NA: Not Appropriate) "
                    fontPixelSize: fontPixelSize
                }

                ReviewAddLabelRow {
                    id: row13
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row12.bottom
                    labelText: "Bulguların Durumları (States of Findings):\tA (O): Açık (Open)\tK (C): Kapalı (Closed)"
                    fontPixelSize: fontPixelSize
                }

                ReviewAddLabelRow {
                    id: row14
                    width: parent.width
                    height: rowHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row13.bottom
                    labelText: "Katılımcılar (Participants );"
                    fontPixelSize: fontPixelSize
                }

                Rectangle{
                    width: parent.width
                    height: rowHeight * 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: row14.bottom

                    border.width: 2
                    border.color: "#00aa0a"
                    radius: 6

                    ReviewAddReviewerScrollView{
                        id: row15
                        fontPixelSize: fontPixelSize
                        anchors.fill: parent
                        anchors.topMargin: parent.border.width
                        anchors.bottomMargin: parent.border.width
                    }
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
