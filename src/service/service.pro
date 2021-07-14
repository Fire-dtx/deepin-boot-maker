include($$PWD/vendor.pri)
QMAKE_CXX += -g -fsanitize=address -O2
QMAKE_CXXFLAGS += -g -fsanitize=address -O2
QMAKE_LFLAGS += -g -fsanitize=address -O2
QT += core dbus
QT -= gui

CONFIG += c++11

TARGET = deepin-boot-maker-service
CONFIG += console link_pkgconfig
CONFIG -= app_bundle

TEMPLATE = app

RESOURCES +=  \
    ../translate.qrc \

SOURCES += main.cpp \
    bootmakerservice.cpp \
    LogManager.cpp

HEADERS += \
    bootmakerservice.h \
    LogManager.h

unix{
binary.path = $${PREFIX}/lib/deepin-daemon/
binary.files = $${OUT_PWD}/deepin-boot-maker-service

service.path = $${PREFIX}/share/dbus-1/system-services/
service.files = $$PWD/data/com.deepin.bootmaker.service

dbus.path = $${PREFIX}/share/dbus-1/system.d/
dbus.files = $$PWD/data/com.deepin.bootmaker.conf

INSTALLS += service dbus binary
}
