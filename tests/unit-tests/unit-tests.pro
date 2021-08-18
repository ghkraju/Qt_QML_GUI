QT += testlib

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

HEADERS += \
    ../../sources/cryptoutils.h \

SOURCES +=  tst_test_check_encryption.cpp \
    ../../sources/cryptoutils.cpp \
