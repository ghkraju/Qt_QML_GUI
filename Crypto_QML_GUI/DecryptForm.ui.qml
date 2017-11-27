import QtQuick 2.6

Rectangle {

    width: 640
    height: 135
    border.width: 2

    // Decryption Properties
    property alias decrypt_text_output: decrypt_text_output
    property alias decrypt_hex_dump: decrypt_hex_dump
    property alias decryption_mouse_area: decryption_mouse_area

    Text {
        id: decrypt_form_label
        x: 5
        y: 5
        text: qsTr("Decryption")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    TextEdit {
        id: decrypt_hex_dump
        x: 90
        y: 35
        width: 534
        height: 60
        wrapMode: TextEdit.Wrap
        text: qsTr("")
        rightPadding: 2
        leftPadding: 2
        cursorVisible: false
        selectionColor: "#000080"
        readOnly: false
        font.pixelSize: 14
        selectByMouse: true

        Rectangle {
            id: decrypt_hex_dump_box
            color: "#00000000"
            anchors.fill: parent
            border.width: 1
        }
    }

    Text {
        id: decrypt_hex_label
        x: 10
        y: 35
        text: qsTr("Hex Dump")
        font.bold: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    TextInput {
        id: decrypt_text_output
        x: 90
        y: 105
        width: 440
        height: 20
        wrapMode: TextInput.Wrap
        text: qsTr("")
        rightPadding: 2
        leftPadding: 2
        readOnly: false
        cursorVisible: false
        font.pixelSize: 14
        selectByMouse: true

        Rectangle {
            id: decrypt_text_output_box
            color: "#00000000"
            anchors.fill: parent
            border.width: 1
        }
    }

    Text {
        id: decrypt_output_label
        x: 10
        y: 105
        text: qsTr("Output Text")
        font.bold: false
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    Rectangle {
        id: decryption_button
        x: 541
        y: 105
        width: 84
        height: 20
        color: decryption_mouse_area.pressed ? "#336699" : "#e9dfdf";
        border.width: 1

        MouseArea {
            id: decryption_mouse_area
            anchors.fill: parent

            Text {
                id: decryption_label_text
                x: 0
                y: 0
                width: 84
                height: 20
                text: qsTr("Decrypt")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
        }
    }
}
