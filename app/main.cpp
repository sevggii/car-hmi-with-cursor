#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "MockCan.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Create MockCan instance
    MockCan mockCan;
    
    QQmlApplicationEngine engine;
    
    // Register MockCan BEFORE loading QML
    engine.rootContext()->setContextProperty("mockCan", &mockCan);

    const QUrl url(QStringLiteral("qrc:/CarHMI/ui/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
