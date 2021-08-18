#include <QtTest>

#include "../../sources/cryptoutils.h"
// add necessary includes here

class test_check_encryption : public QObject
{
    Q_OBJECT

public:
    test_check_encryption();
    ~test_check_encryption();

private slots:
    void test_key_generation();
    void test_hex_conversion();

};

test_check_encryption::test_check_encryption()
{
}

test_check_encryption::~test_check_encryption()
{

}

void test_check_encryption::test_key_generation()
{
    CryptoUtils c;
    QString old_pub_key = c.getPublicKey();
    QString old_prv_key = c.getPrivateKey();
    c.generateKeys();
    bool flag = (old_pub_key == c.getPublicKey());
    QVERIFY2(!flag, "Failed to generate new Keys....!");
}

void test_check_encryption::test_hex_conversion()
{
    CryptoUtils c;
    unsigned char value[2];
    c.hexstrToChar("0x0A", &value[0]);
    bool flag = (value[0] == 10);
    QVERIFY2(!flag, "Hex to String conversion failed....!");
}

QTEST_APPLESS_MAIN(test_check_encryption)

#include "tst_test_check_encryption.moc"
