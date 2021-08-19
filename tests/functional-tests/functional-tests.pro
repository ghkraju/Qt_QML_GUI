CONFIG += warn_on qmltestcase

TEMPLATE = app

DISTFILES += \
    tst_check_main_window.qml

SOURCES += \
    main.cpp

QT += qml qmltest
qml.files = ../../sources/KeyGenerationForm.ui.qml
qml.path = ../../sources
