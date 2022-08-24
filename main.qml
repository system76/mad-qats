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

    SplitView {
        anchors.fill: parent
        spacing:4
        ScrollView {
            id:list
            SplitView.minimumWidth: main.width * 0.10
            SplitView.preferredWidth: main.width * 0.33
            SplitView.maximumWidth: main.width * 0.40

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

            SplitView.minimumWidth: main.width * 0.20
            SplitView.preferredWidth: main.width * 0.66
            SplitView.maximumWidth: main.width * 0.70
            Text {
                 id: instructions
                 text:"do stuff"
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
