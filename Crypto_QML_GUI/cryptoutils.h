#ifndef CRYPTOUTILS_H
#define CRYPTOUTILS_H
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <sstream>
#include <QObject>
#include <QString>

typedef unsigned char u8;

#define PUBLIC_KEY_LENGTH 32
#define PRIVATE_KEY_LENGTH 32
#define NONCE_LENGTH 24
#define PADDING_LENGTH 32

class CryptoUtils : public QObject
{
    Q_OBJECT
public:
    CryptoUtils();
    Q_INVOKABLE void generateKeys();
    Q_INVOKABLE QString encryptMessage(QString msg);
    Q_INVOKABLE QString decryptMessage(QString hexMsg);
    Q_INVOKABLE QString getPublicKey();
    Q_INVOKABLE QString getPrivateKey();
    QString hexdumpstr(char* data, int len);
    void hexstrToChar(std::string hexString, u8* uChar);

private:
    char const hex[16] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B','C','D','E','F'};
    u8 prv_key[PRIVATE_KEY_LENGTH] = {0};
    u8 pub_key[PUBLIC_KEY_LENGTH] = {0};
    u8 nonce[NONCE_LENGTH] = {0};

};

#endif // CRYPTOUTILS_H
