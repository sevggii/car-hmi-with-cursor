#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "MockCan.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Create and register MockCan instance
    MockCan mockCan;
    engine.rootContext()->setContextProperty("mockCan", &mockCan);

    const QUrl url(QStringLiteral("qrc:/CarHMI/ui/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
