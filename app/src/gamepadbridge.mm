// Bite by Bite - MIT License, see LICENSE
#include "gamepadbridge.h"

#ifdef Q_OS_MACOS
#import <GameController/GameController.h>
#endif

GamepadBridge::GamepadBridge(QObject *parent) : QObject(parent)
{
    connect(&m_timer, &QTimer::timeout, this, &GamepadBridge::poll);
    m_timer.start(16);
}

GamepadBridge::~GamepadBridge() = default;

void GamepadBridge::poll()
{
    bool connected = false;
    QString name;
    double ax = 0, ay = 0;
    bool run = false, sneak = false;
    QVariantMap b;
#ifdef Q_OS_MACOS
    @autoreleasepool {
        NSArray<GCController *> *pads = [GCController controllers];
        GCController *pad = nil;
        for (GCController *c in pads) { if (c.extendedGamepad) { pad = c; break; } }
        if (pad) {
            GCExtendedGamepad *g = pad.extendedGamepad;
            connected = true;
            name = QString::fromNSString(pad.vendorName ?: @"Gamepad");
            ax = g.leftThumbstick.xAxis.value;
            ay = -g.leftThumbstick.yAxis.value;              // +y = down on screen (south)
            if (g.dpad.left.pressed) ax = -1; if (g.dpad.right.pressed) ax = 1;
            if (g.dpad.up.pressed) ay = -1; if (g.dpad.down.pressed) ay = 1;
            run = g.rightTrigger.pressed || g.rightTrigger.value > 0.4;
            sneak = g.leftTrigger.pressed || g.leftTrigger.value > 0.4;
            b["interact"] = g.buttonA.pressed;
            b["bite"] = g.buttonX.pressed;
            b["ability"] = g.buttonY.pressed;
            b["command"] = g.buttonB.pressed;
            b["switchNext"] = g.rightShoulder.pressed;
            b["switchPrev"] = g.leftShoulder.pressed;
            b["pause"] = g.buttonMenu.pressed;
            b["restart"] = g.buttonOptions ? g.buttonOptions.pressed : false;
            b["menuUp"] = g.dpad.up.pressed || g.leftThumbstick.up.pressed;
            b["menuDown"] = g.dpad.down.pressed || g.leftThumbstick.down.pressed;
            b["menuLeft"] = g.dpad.left.pressed || g.leftThumbstick.left.pressed;
            b["menuRight"] = g.dpad.right.pressed || g.leftThumbstick.right.pressed;
            b["accept"] = g.buttonA.pressed;
            b["back"] = g.buttonB.pressed;
        }
    }
#endif
    const bool same = connected == m_connected && name == m_name && qFuzzyCompare(ax + 1, m_axisX + 1) && qFuzzyCompare(ay + 1, m_axisY + 1)
                      && run == m_run && sneak == m_sneak && b == m_buttons;
    if (same) return;
    m_connected = connected; m_name = name; m_axisX = ax; m_axisY = ay; m_run = run; m_sneak = sneak; m_buttons = b;
    emit changed();
}
