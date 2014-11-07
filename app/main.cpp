#include "qtquickcontrolsapplication.h"
#include <QtQml/QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QtQuickControlsApplication app(argc, argv);
    QQmlApplicationEngine engine(QUrl("qrc:/mainwindow.qml"));
    return app.exec();
}
