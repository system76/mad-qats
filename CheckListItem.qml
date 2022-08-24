import QtQuick 2.15
import QtQuick.Controls 2.15

Component {
    id: contactDelegate
    Rectangle {
        radius: 3
        color: (index % 2 == 0) ? "lightgray" : "white"
        width: parent.width; height: theinfo.height + 10
        clip:true
        Row {
            width:parent.width
            height:theinfo.height
            padding: 10
            Column {
                id:theinfo
                anchors.leftMargin: 4
                anchors.verticalCenter: parent.verticalCenter
                spacing:5
                width:parent.width - done.width
                Text { text: '<b>'+taskname+'</b>' }
                Text { text: shortdiscription }
                Text { text: '<b>'+index+'</b>' }
            }
            CheckBox {
                id:done
                width: 80

            }
        }
    }
}


