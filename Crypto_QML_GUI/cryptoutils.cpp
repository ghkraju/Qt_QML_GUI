#include "cryptoutils.h"

#include "tweetnacl.c"
#include "randombytes.c"

/**
 * @brief Encryption keys both public key and private key are
 * generated using tweetnacl and stored into class variables.
 */
void CryptoUtils::generateKeys(){
    // randomize nonce
    randombytes(nonce, NONCE_LENGTH);
    // generate public and private keys
    crypto_box_keypair(this->pub_key, this->prv_key);
}

/**
 * @brief Create hex dump string for a character array
 * @param data - character array
 * @param len - length of the character array
 * @return returns QString
 */
QString CryptoUtils::hexdumpstr(char* data, int len){
    std::string ss;
    for (int i = 0; i < len; i++) {
        char const byte = data[i];
        ss += hex[ ( byte & 0xF0 ) >> 4 ];
        ss += hex[ ( byte & 0x0F ) >> 0 ];
    }
    return QString::fromStdString(ss);
}

/**
 * @brief Converts hex string to unsigned char
 * @param hexString - string contains hexa decimal values ex:- 'AA'0F'03'
 * @param uChar - reference to the unsigned char where byte values are stored
 */
void CryptoUtils::hexstrToChar(std::string hexString, u8 *uChar){
        std::stringstream ss;
        int offset = 0, i = 0;
        while (offset < hexString.length())
        {
            unsigned int buf;
            ss << std::hex << hexString.substr(offset, 2);
            ss >> std::hex >> buf;
            uChar[i] = static_cast<unsigned char>(buf);
            offset += 2;
            i++;
            ss.str(std::string());
            ss.clear();
        }
}

/**
 * @brief Getter method for public key
 * @return returns hex dump of public key as QString
 */
QString CryptoUtils::getPublicKey(){
    return hexdumpstr((char *)this->pub_key, PUBLIC_KEY_LENGTH);
}

/**
 * @brief Getter method for private key
 * @return returns hex dump of private key as QString
 */
QString CryptoUtils::getPrivateKey(){
    return hexdumpstr((char *)this->prv_key, PRIVATE_KEY_LENGTH);
}

/**
 * @brief Encryption of a message with public key and private key using tweenacl
 * @param msg - message to be encrypted
 * @return return hex dump of encrypted message as QString
 */
QString CryptoUtils::encryptMessage(QString msg){
    char * message = (char *)msg.toStdString().c_str();
    int padded_mlength = strlen(message) + PADDING_LENGTH;
    char * padded_message = (char*) malloc(padded_mlength);
    memset(padded_message, 0, PADDING_LENGTH);
    memcpy(padded_message + PADDING_LENGTH, message, strlen(message));

    u8* encryptedtext = (u8*) malloc(padded_mlength);
    // Encryption of the padded message
    crypto_box(encryptedtext, (u8*)padded_message,  padded_mlength, nonce, pub_key, prv_key);
    // Hex dump for encrypted text
    QString encrypted_hex_string = hexdumpstr((char *)encryptedtext, padded_mlength);
    return encrypted_hex_string;
}

/**
 * @brief Decryption of a hex dump with public key and private key using tweenacl
 * @param hexMsg - hex dump message that needs to be decrypted
 * @return return QString of decrypted message
 */
QString CryptoUtils::decryptMessage(QString hexMsg){
    u8 message[((hexMsg.length())/2)] = {0};
    hexstrToChar(hexMsg.toStdString(), message);
    int padded_mlength = ((hexMsg.length())/2);

    char * decrypted_message = (char*) malloc(padded_mlength+1);
    // Addition of end character to the decrypted message
    decrypted_message[padded_mlength] = '\0';
    // Decryption of the message
    crypto_box_open((u8*)decrypted_message, (u8*)message,  padded_mlength, nonce, pub_key, prv_key);
    // Increment of char ponter to skip the padding length
    return decrypted_message+PADDING_LENGTH;
}

/**
 * @brief Constructor
 */
CryptoUtils::CryptoUtils()
{
}
