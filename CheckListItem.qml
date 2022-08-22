import QtQuick 2.15
import QtQuick.Controls 2.15

Component {
    id: contactDelegate
    Item {
        width: parent.width; height: 40
        Row {
            width:parent.width
            Column {
                spacing:5
                width:parent.width - done.width
                Text { text: '<b>'+taskname+'</b>' }
                Text { text: shortdiscription }
            }
            CheckBox {
                id:done
                width: 80

            }
        }
    }
}


