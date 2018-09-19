import QtQuick 2.6

Rectangle {

    width: 640
    height: 135
    border.width: 2

    // Encryption Properties
    property alias encrypt_text_input: encrypt_text_input
    property alias encrypted_hex_dump: encrypted_hex_dump
    property alias encryption_mouse_area: encryption_mouse_area

    Text {
        id: encrypt_form_label
        x: 5
        y: 5
        text: qsTr("Encryption")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    Rectangle {
        id: encryption_button
        x: 541
        y: 35
        width: 84
        height: 20
        color: encryption_mouse_area.pressed ? "#336699" : "#e9dfdf"
        border.width: 1

        MouseArea {
            id: encryption_mouse_area
            anchors.fill: parent

            Text {
                id: encryption_label_text
                x: 0
                y: 0
                width: 84
                height: 20
                text: qsTr("Encrypt")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
        }
    }

    TextInput {
        id: encrypt_text_input
        x: 90
        y: 35
        width: 440
        height: 20
        wrapMode: TextInput.Wrap
        text: qsTr("")
        rightPadding: 2
        leftPadding: 2
        cursorVisible: true
        font.pixelSize: 14
        selectByMouse: true

        Rectangle {
            id: encrypt_text_input_box
            color: "#00000000"
            anchors.fill: parent
            border.width: 1
        }
    }

    Text {
        id: encrypt_input_label
        x: 10
        y: 35
        text: qsTr("Input Text")
        font.bold: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    TextEdit {
        id: encrypted_hex_dump
        x: 90
        y: 65
        width: 534
        height: 60
        wrapMode: TextEdit.Wrap
        text: qsTr("")
        rightPadding: 2
        leftPadding: 2
        cursorVisible: false
        selectionColor: "#000080"
        readOnly: true
        font.pixelSize: 14
        selectByMouse: true

        Rectangle {
            id: encrypted_hex_dump_box
            color: "#00000000"
            anchors.fill: parent
            border.width: 1
        }
    }

    Text {
        id: encrypt_hex_label
        x: 10
        y: 65
        text: qsTr("Hex Dump")
        font.bold: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }
}
