import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id:main
    width: 1024
    height: 768
    visible: true
    title: qsTr("Mad-Qats")
    header:ToolBar {
        id:topBar
        width:parent.width
        // list tasks, PRs, tickets, etc
        ComboBox {
            id:taskList
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 4
            width:parent.width * 0.4
            model: ["Select","Kernel","GnomeShell","Certification"]
        }
        ToolButton {
            id:login
            text:"Login"
            anchors.right:parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            onClicked: visible = false

        }
        TextField {
            id:currentUser
            anchors.right:parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 4
            width: parent.width * 0.2
            placeholderText: "User Name"
            visible: login.visible == false ? true : false
        }

    }

    Row {
        visible: taskList.currentIndex == 0 ? false : true
        anchors.fill: parent
        spacing:4
        ScrollView {
            id:list
            width:parent.width * 0.6
            height:parent.height
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.interactive: true
            clip:true
            ListView {
                spacing:1
                width:parent.width * 0.98
                height:parent.height * 0.98
                model: ListModel {
                        id:checklist
                            ListElement {
                                taskname:"thing"
                                shortdiscription:"stuff"
                            }
                            ListElement {
                                taskname:"thing"
                                shortdiscription:"stuff"
                            }
                            ListElement {
                                taskname:"thing"
                                shortdiscription:"stuff"
                            }
                        }
                 delegate: CheckListItem{}
                }
        }
        ScrollView {
            id:info
            horizontalPadding: 10
            verticalPadding: 10
            width:parent.width * 0.4
            height:parent.height
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            Column {

                width: main.width * 0.45
                spacing:5
                Text {
                    text: "<b>Instructions</b>"
                }

                TextArea {
                     width:parent.width * 0.9
                     id: instructions
                     readOnly: true
                     text: switch(taskList.currentIndex) {
                        case 0: "do stuff";break;
                        case 1: "do things asdfasdfa sdfas dfasdf asdf asdfasdf asdf asfs asdfasdf asdfasd fasdfa sdfas dfasdfa sdfasdf asdfa sfasf";break;
                        case 2: "do lots of things";break;
                        case 3: "do all the things";break;
                        }
                     wrapMode:TextEdit.WordWrap
                    }
               Text {
                   text: "<b>Notes:</b>"
               }
                TextArea {
                    id:notes
                    width:parent.width * 0.85
                    wrapMode: TextEdit.WordWrap
                    height:400
                    background: Rectangle {
                        radius:4
                        border.color: "lightgray"
                    }
                }
            }
       }
    }

    Label {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Please select task from droplist above.")
        visible: taskList.currentIndex == 0 ? true : false
    }
}
