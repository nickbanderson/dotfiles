import QtQuick 2.14
import QtQuick.Controls 2.14 as QTwo
import QtQuick.Layouts 1.14
import SddmComponents 2.0

Rectangle {
    id: container
    color: "black"

    ColumnLayout {
        visible: primaryScreen
        QTwo.Label {text: "F1 shutdown"; color: "white"; font.family: "Roboto Mono"; font.pixelSize: 15}
        QTwo.Label {text: "F2 reboot"; color: "white"; font.family: "Roboto Mono"; font.pixelSize: 15}
    }

    Rectangle {
        visible: primaryScreen
        color: "black"
        border.width: 1
        border.color: "white"
        anchors.centerIn: parent
        width: 250
        height: 150

        ColumnLayout{
            anchors.centerIn: parent
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                QTwo.Label {
                    text: sddm.hostName; 
                    color: "white"; font.family: "Roboto Mono"; font.pixelSize: 15
                }
            }
            Row {height:5}
            Row {
                topPadding:0; leftPadding: 0
                QTwo.Label {text: "usr : "; color: "white"; font.family: "Roboto Mono"; font.pixelSize: 15; topPadding: 0; anchors.verticalCenter: parent.verticalCenter}
                QTwo.TextField {
                    id: name
                    width: 150; height: 30
                    text: userModel.lastUser
                    echoMode: TextInput.Normal
                    font.pixelSize: 15
                    font.family: "Roboto Mono"
                    color: "white"
                    background: Rectangle {color: "black"; width: parent.width; height: parent.height}

                    KeyNavigation.backtab: session; KeyNavigation.tab: password
                }
            }
            
            Row {
                topPadding:0; leftPadding: 0
                QTwo.Label {text: "pwd : "; color: "white"; font.family: "Roboto Mono"; font.pixelSize: 15; topPadding: 0; anchors.verticalCenter: parent.verticalCenter}
                QTwo.TextField {
                    id: password
                    width: 150; height: 30
                    echoMode: TextInput.Password
                    font.pixelSize: 15
                    font.family: "Roboto Mono"
                    color: "white"
                    background: Rectangle {color: "black"; width: parent.width; height: parent.height}

                    KeyNavigation.backtab: name; KeyNavigation.tab: session
                }
            }
        }
    }

    Connections {
        target: sddm
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            sddm.login(name.text, password.text, sessionModel.lastIndex)
            event.accepted = true
        } else if (event.key === Qt.Key_F1) {
            sddm.powerOff()
            event.accepted = true
        } else if (event.key === Qt.Key_F2) {
            sddm.reboot()
            event.accepted = true
        }
    }

    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}
