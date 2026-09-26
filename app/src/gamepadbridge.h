// Bite by Bite - MIT License, see LICENSE
#pragma once

#include <QObject>
#include <QTimer>
#include <QVariantMap>
#include <QtQml/qqmlregistration.h>

/// Physical gamepad state for InputManager.qml. Qt 6 ships no gamepad module and Clayground's
/// GameController has its physical-gamepad path disabled, so this small bridge polls the platform API:
///  * macOS: Apple's GameController framework (any MFi / Xbox / PlayStation / Switch pad the OS pairs)
///  * elsewhere: reports nothing connected (a Windows/Linux backend slots in behind the same properties)
/// Layout follows the W3C "standard" mapping: south = interact, west = bite, north = ability,
/// east = stay/follow, shoulders switch zombies, right trigger runs, left trigger sneaks, start pauses,
/// select restarts from the checkpoint, d-pad + south/east navigate menus.
class GamepadBridge : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(bool connected READ connected NOTIFY changed)
    Q_PROPERTY(QString name READ name NOTIFY changed)
    Q_PROPERTY(double axisX READ axisX NOTIFY changed)
    Q_PROPERTY(double axisY READ axisY NOTIFY changed)
    Q_PROPERTY(bool run READ run NOTIFY changed)
    Q_PROPERTY(bool sneak READ sneak NOTIFY changed)
    Q_PROPERTY(QVariantMap buttons READ buttons NOTIFY changed)
public:
    explicit GamepadBridge(QObject *parent = nullptr);
    ~GamepadBridge() override;

    bool connected() const { return m_connected; }
    QString name() const { return m_name; }
    double axisX() const { return m_axisX; }
    double axisY() const { return m_axisY; }
    bool run() const { return m_run; }
    bool sneak() const { return m_sneak; }
    QVariantMap buttons() const { return m_buttons; }

signals:
    void changed();

private:
    void poll();
    QTimer m_timer;
    bool m_connected = false;
    QString m_name;
    double m_axisX = 0, m_axisY = 0;
    bool m_run = false, m_sneak = false;
    QVariantMap m_buttons;
    void *m_impl = nullptr;
};
