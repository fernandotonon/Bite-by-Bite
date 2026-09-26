// Bite by Bite - MIT License, see LICENSE
// GamepadBridge for every platform except macOS (gamepadbridge.mm): WebAssembly polls the browser
// Gamepad API (W3C "standard" mapping); other desktops report nothing connected for now.
#include "gamepadbridge.h"

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#include <cstdlib>

// returns "name|ax|ay|b0,b1,...,b16" for the first connected standard-mapping pad, or "" - as a malloc'd string
EM_JS(char *, bite_gamepad_poll, (), {
    try {
        const pads = navigator.getGamepads ? navigator.getGamepads() : [];
        let pad = null;
        for (const p of pads) { if (p && p.connected && p.buttons && p.buttons.length >= 16) { pad = p; break; } }
        let out = "";
        if (pad) {
            const b = pad.buttons.map(x => (x.pressed || x.value > 0.5) ? 1 : 0).join(",");
            out = (pad.id || "Gamepad").slice(0, 40) + "|" + (pad.axes[0] || 0).toFixed(3) + "|" + (pad.axes[1] || 0).toFixed(3) + "|" + b;
        }
        const n = lengthBytesUTF8(out) + 1; const p = _malloc(n); stringToUTF8(out, p, n); return p;
    } catch (e) { const p = _malloc(1); HEAPU8[p] = 0; return p; }
});
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
#ifdef __EMSCRIPTEN__
    char *raw = bite_gamepad_poll();
    const QString s = QString::fromUtf8(raw);
    std::free(raw);
    const QStringList parts = s.split(QLatin1Char('|'));
    if (parts.size() == 4) {
        connected = true;
        name = parts[0];
        ax = parts[1].toDouble(); ay = parts[2].toDouble();
        const QStringList bs = parts[3].split(QLatin1Char(','));
        auto btn = [&](int i) { return i < bs.size() && bs[i] == QLatin1String("1"); };
        // W3C standard mapping: 0 south 1 east 2 west 3 north 4 LB 5 RB 6 LT 7 RT 8 select 9 start 12-15 dpad
        if (btn(14)) ax = -1; if (btn(15)) ax = 1;
        if (btn(12)) ay = -1; if (btn(13)) ay = 1;
        if (std::abs(ax) < 0.2) ax = 0; if (std::abs(ay) < 0.2) ay = 0;
        run = btn(7); sneak = btn(6);
        b["interact"] = btn(0); b["bite"] = btn(2); b["ability"] = btn(3); b["command"] = btn(1);
        b["switchNext"] = btn(5); b["switchPrev"] = btn(4); b["pause"] = btn(9); b["restart"] = btn(8);
        b["menuUp"] = btn(12) || ay < -0.6; b["menuDown"] = btn(13) || ay > 0.6;
        b["menuLeft"] = btn(14) || ax < -0.6; b["menuRight"] = btn(15) || ax > 0.6;
        b["accept"] = btn(0); b["back"] = btn(1);
    }
#endif
    const bool same = connected == m_connected && name == m_name && qFuzzyCompare(ax + 1, m_axisX + 1) && qFuzzyCompare(ay + 1, m_axisY + 1)
                      && run == m_run && sneak == m_sneak && b == m_buttons;
    if (same) return;
    m_connected = connected; m_name = name; m_axisX = ax; m_axisY = ay; m_run = run; m_sneak = sneak; m_buttons = b;
    emit changed();
}
