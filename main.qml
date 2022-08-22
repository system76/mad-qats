import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id:main
    width: 1024
    height: 768
    visible: true
    title: qsTr("Mad-Qats")
    Column {
        spacing:4
        width:parent.width
        height:parent.height
    Rectangle {
        id:topBar
        width:parent.width
        height:parent.height * 0.05
        color:"#33302F"
        Row {
            width:parent.width
            ComboBox {
                id:taskList
                width:parent.width * 0.4
                model: ["Kernel","GnomeShell","Certification"]
            }
        }

    }

    Row {
            spacing: 2
            Column {
                id:list
                width: main.width * 0.6
                height: main.height
                ListView {
                    spacing:10
                    width:parent.width * 0.98
                    height:parent.height * 0.98
                    model: ListModel {
                        ListElement {
                            taskname: "Test this"
                            shortdiscription: "Do stuff"
                        }

                    }
                    delegate: CheckListItem{}
                }
            }
            Column {
                id:info
                width:main.width * 0.4
                height: main.height
                Text {
                    id: name
                    text: qsTr("text")
                }
            }
        }
    }
}

