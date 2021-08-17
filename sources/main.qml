import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import CryptoUtils 1.0

Window {
    visible: true
    width: 640
    height: 380
    title: qsTr("Encryption Software")

    property alias popup: popup
    property alias popup_message_text: popup_message_text

    CryptoUtils {
        id: c
    }

    Column{
        EncryptForm {
            color: 'lightsteelblue'
            property var emsg

            // Mouse Actions
            encryption_mouse_area.onClicked: {
                // Character check for Input text
                if(encrypt_text_input.text.length > 0 && encrypt_text_input.text.length <=20){
                    emsg = c.encryptMessage(encrypt_text_input.text)
                    encrypted_hex_dump.text = qsTr(emsg)
                } else {
                    popup_message_text.text = qsTr("Please enter 1 - 20 character text to encrypt.")
                    popup.open()
                }
            }

        }
        DecryptForm {
            color: 'lightsteelblue'
            property var dmsg

            // Mouse Actions
            decryption_mouse_area.onClicked: {
                // Check for Hex dump to decrypt the message
                if(decrypt_hex_dump.text.length > 0){
                    dmsg = c.decryptMessage(decrypt_hex_dump.text)
                    decrypt_text_output.text = qsTr(dmsg)
                } else {
                    popup_message_text.text = qsTr("Please enter the hex dump from encryption form.")
                    popup.open()
                }

            }
        }

        KeyGenerationForm {
            color: 'lightsteelblue'
            public_key_text.text: qsTr(c.getPublicKey())
            private_key_text.text: qsTr(c.getPrivateKey())

            // Mouse Actions
            key_generation_mouse_area.onClicked: {
                // Generate new keys and set them in GUI
                c.generateKeys()
                public_key_text.text = qsTr(c.getPublicKey())
                private_key_text.text = qsTr(c.getPrivateKey())

                // Successful generation popup
                popup_message_text.text = qsTr("Encryption Keys are successfully generated...")
                popup.open()
            }
        }
    }

    Popup {
        id: popup
        x: 100
        y: 100
        width: 250
        height: 100
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        visible: false

        Text {
            id: popup_message_text
            anchors.fill: parent
            text: qsTr(" ")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
            wrapMode: Text.Wrap
        }

    }
}
