import QtQuick 2.6

Rectangle {

    width: 640
    height: 110
    border.width: 2

    property alias key_generation_mouse_area: key_generation_mouse_area
    property alias public_key_text: public_key_text
    property alias private_key_text: private_key_text

    Text {
        id: key_form_label
        x: 5
        y: 5
        text: qsTr("Encryption Keys")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    Rectangle {
        id: key_generation_button
        x: 541
        y: 20
        width: 84
        height: 20
        color: key_generation_mouse_area.pressed ? "#336699" : "#e9dfdf"
        border.width: 1

        MouseArea {
            id: key_generation_mouse_area
            anchors.fill: parent
        }

        Text {
            id: key_generation_label_text
            width: 84
            height: 20
            text: qsTr("Generate Keys")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 12
        }
    }

    TextEdit {
        id: public_key_text
        x: 90
        y: 50
        width: 534
        height: 20
        wrapMode: TextEdit.WordWrap
        text: qsTr("")
        readOnly: true
        rightPadding: 2
        leftPadding: 2
        cursorVisible: false
        font.pixelSize: 14
        selectByMouse: true

        Rectangle {
            id: public_key_text_box
            color: "#00000000"
            anchors.fill: parent
            border.width: 1
        }
    }

    TextEdit {
        id: private_key_text
        x: 90
        y: 80
        width: 534
        height: 20
        wrapMode: TextEdit.WordWrap
        text: qsTr("")
        readOnly: true
        rightPadding: 2
        leftPadding: 2
        cursorVisible: false
        selectionColor: "#000080"
        font.pixelSize: 14
        selectByMouse: true

        Rectangle {
            id: private_key_text_box
            color: "#00000000"
            anchors.fill: parent
            border.width: 1
        }
    }

    Text {
        id: public_key_label
        x: 10
        y: 50
        text: qsTr("Public Key ")
        font.pixelSize: 12
    }

    Text {
        id: private_key_label
        x: 10
        y: 80
        text: qsTr("Private Key ")
        font.pixelSize: 12
    }
}
