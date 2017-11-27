#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "cryptoutils.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    // Registering Cryptoutils object with qt
    qmlRegisterType<CryptoUtils>("CryptoUtils", 1, 0, "CryptoUtils");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
