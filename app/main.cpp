#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "MockCan.h"

using namespace Qt::StringLiterals; // yeni Qt 6.9 formatı

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    qmlRegisterType<MockCan>("Telem", 1, 0, "MockCan");

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/ui/Main.qml"_s); // "_qs" yerine "_s" kullan
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}
