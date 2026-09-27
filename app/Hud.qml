// In-mission overlay: squad strip, objective + clock, contextual prompt, detection markers projected
// over guards and cameras, messages, tutorial toasts and the caught / checkpoint flashes.
import QtQuick

Item {
    id: hud
    property var game: null
    property var level: null
    property var sim: null
    property int stateVersion: 0
    readonly property var st: { stateVersion; return sim ? sim.state : null }
    property var prompt: null
    property string toast: ""
    property real toastUntil: 0
    property string flash: ""            // "caught" | "checkpoint" | ""
    property real flashUntil: 0
    property bool compact: height < 560
    property real uiScale: 1                 // the HUD lives in the scaled UI layer: 3D projections are divided by it
    property bool touch: false               // touch controls shown: hide the keyboard hints
    function pos(x, z, y) { var p = level ? level.screenPos(x, z, y) : Qt.point(0, 0); return Qt.point(p.x / uiScale, p.y / uiScale) }

    function fmtTime(s) { s = Math.max(0, Math.floor(s)); return Math.floor(s / 60) + ":" + (s % 60 < 10 ? "0" : "") + (s % 60) }

    // ---- squad strip (tap a zombie to control it, the pill toggles stay / follow) ----
    function squadTap(x, y) {
        for (var i = 0; i < squadRow.children.length; i++) {
            var c = squadRow.children[i]; if (!c.width || c.tapAction === undefined) continue
            var p = c.mapFromItem(hud, x, y)
            if (p.x >= 0 && p.y >= 0 && p.x <= c.width && p.y <= c.height) { c.tapAction(); return true }
        }
        return false
    }
    Row {
        id: squadRow
        x: 16; y: 14; spacing: 10
        Repeater {
            model: { hud.stateVersion; return hud.st ? hud.st.squad.length : 0 }
            delegate: Rectangle {
                required property int index
                readonly property var zb: { hud.stateVersion; return hud.st.squad[index] }
                readonly property var ch: zb ? hud.sim.character(zb) : null
                readonly property bool active: { hud.stateVersion; return index === hud.st.active }
                readonly property string status: { hud.stateVersion; return zb.hidden ? "Hidden" : (zb.mode === "follow" ? "Following" : "Staying") }
                width: hud.compact ? 150 : 190; height: hud.compact ? 46 : 56; radius: 10
                function tapAction() { if (!active) { hud.sim.selectZombie(index); hud.game.refresh(); hud.game.audio.play("switch") } }
                MouseArea { anchors.fill: parent; onClicked: parent.tapAction() }
                color: active ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.25) : Qt.rgba(0, 0, 0, 0.45)
                border.color: active ? Theme.accent : Theme.border; border.width: 2
                Rectangle { x: 8; anchors.verticalCenter: parent.verticalCenter; width: 32; height: 32; radius: 16; color: ch ? ch.color : "#888"; border.color: "#111"; border.width: 2
                            Text { anchors.centerIn: parent; text: index + 1; color: "#fff"; font.bold: true; font.pixelSize: 15 } }
                Column {
                    x: 48; anchors.verticalCenter: parent.verticalCenter; spacing: 1
                    Text { text: ch ? ch.name : ""; color: Theme.text; font.pixelSize: hud.compact ? 13 : 15; font.bold: true; font.family: Theme.font }
                    Text { text: active ? (ch ? ch.ability.label + " [" + hud.game.input.labels.ability + "]" : "") : status; color: active ? Theme.accent : Theme.muted; font.pixelSize: 12; font.family: Theme.font }
                }
            }
        }
        Rectangle {   // stay / follow pill
            id: followPill
            visible: hud.st && hud.st.squad.length > 1
            readonly property string mode: { hud.stateVersion; if (!hud.st) return "follow"; for (var i = 0; i < hud.st.squad.length; i++) if (i !== hud.st.active) return hud.st.squad[i].mode; return "follow" }
            function tapAction() { hud.sim.toggleCommand(); hud.game.refresh() }
            anchors.verticalCenter: parent.verticalCenter
            width: pillText.implicitWidth + 28; height: hud.compact ? 40 : 46; radius: 10
            color: Qt.rgba(0, 0, 0, 0.45); border.color: Theme.border; border.width: 2
            Text { id: pillText; anchors.centerIn: parent; text: (followPill.mode === "follow" ? "\u25B6 Following" : "\u25A0 Staying") + (hud.touch ? "" : "  [H]") + (hud.touch ? "" : "   Tab / 1-9: switch"); color: Theme.text; font.pixelSize: 13; font.family: Theme.font }
            MouseArea { anchors.fill: parent; onClicked: parent.tapAction() }
        }
    }

    // ---- objective + clock ----
    Rectangle { anchors.fill: objectives; anchors.margins: -10; radius: 10; color: Qt.rgba(0, 0, 0, 0.45) }
    Column {
        id: objectives
        anchors.right: parent.right; anchors.rightMargin: 26; y: 24; spacing: 4
        Text { anchors.right: parent.right; text: hud.fmtTime(hud.st ? hud.st.elapsed : 0); color: Theme.text; font.pixelSize: 26; font.bold: true; font.family: Theme.font }
        Text { anchors.right: parent.right; text: hud.game.mission ? hud.game.mission.objectives.main.label : ""; color: Theme.text; font.pixelSize: 14; font.family: Theme.font }
        Repeater {
            model: hud.game.mission ? hud.game.mission.objectives.optional : []
            delegate: Text {
                required property var modelData
                readonly property var st: hud.st ? hud.st.objectives[modelData.id] : null
                anchors.right: parent.right
                text: (st && st.done ? "✓ " : (st && st.failed ? "✗ " : "○ ")) + modelData.label
                color: st && st.done ? Theme.accent : (st && st.failed ? Theme.danger : Theme.muted)
                font.pixelSize: 12; font.family: Theme.font
            }
        }
        Text { visible: hud.st && hud.st.alarm; anchors.right: parent.right; text: "⚠ ALARM"; color: Theme.danger; font.pixelSize: 16; font.bold: true; font.family: Theme.font
               SequentialAnimation on opacity { loops: Animation.Infinite; running: hud.st && hud.st.alarm; NumberAnimation { to: 0.3; duration: 300 } NumberAnimation { to: 1; duration: 300 } } }
    }

    // ---- detection markers over guards / witnesses / cameras ----
    Repeater {
        model: { hud.stateVersion; return hud.st ? hud.st.humans.length : 0 }
        delegate: Item {
            required property int index
            // the sim mutates its objects in place: every binding below also reads stateVersion to refresh
            readonly property var h: { hud.stateVersion; return hud.st.humans[index] }
            readonly property real meter: { hud.stateVersion; return h ? h.meter : 0 }
            readonly property string hstate: { hud.stateVersion; return h ? h.state : "" }
            readonly property point p: { hud.stateVersion; return hud.level && h ? hud.pos(h.x, h.z, 2.2) : Qt.point(0, 0) }
            readonly property bool show: h && !h.bitten && (meter > 0.02 || hstate === "alert" || hstate === "investigate" || hstate === "search" || hstate === "suspicious")
            visible: show
            x: p.x - 22; y: p.y - 24
            Rectangle { width: 44; height: 8; radius: 4; color: "#00000088"; border.color: "#ffffff66"
                        Rectangle { width: parent.width * Math.min(1, meter); height: parent.height; radius: 4; color: meter > 0.66 ? Theme.danger : (meter > 0.33 ? Theme.accent2 : Theme.accent) } }
            Text { anchors.horizontalCenter: parent.horizontalCenter; y: -30; font.pixelSize: 26; font.bold: true; style: Text.Outline; styleColor: "#000"
                   text: hstate === "alert" ? "!" : (hstate === "suspicious" || hstate === "investigate" || hstate === "search" ? "?" : "")
                   color: hstate === "alert" ? Theme.danger : Theme.accent2 }
        }
    }
    Repeater {
        model: { hud.stateVersion; return hud.st ? hud.st.cameras.length : 0 }
        delegate: Item {
            required property int index
            readonly property var c: hud.st.cameras[index]
            readonly property real meter: { hud.stateVersion; return c ? c.meter : 0 }
            readonly property point p: { hud.stateVersion; return hud.level && c ? hud.pos(c.x, c.z, c.mountHeight + 0.3) : Qt.point(0, 0) }
            visible: meter > 0.02
            x: p.x - 22; y: p.y - 12
            Rectangle { width: 44; height: 8; radius: 4; color: "#00000088"; border.color: "#ffffff66"
                        Rectangle { width: parent.width * Math.min(1, meter); height: parent.height; radius: 4; color: Theme.info } }
        }
    }
    // bite progress over the biting zombie
    Repeater {
        model: { hud.stateVersion; return hud.st ? hud.st.squad.length : 0 }
        delegate: Item {
            required property int index
            readonly property var zb: { hud.stateVersion; return hud.st.squad[index] }
            readonly property real progress: { hud.stateVersion; return zb && zb.bite ? 1 - zb.bite.left / zb.bite.total : -1 }
            readonly property point p: { hud.stateVersion; return hud.level && zb ? hud.pos(zb.x, zb.z, 2.0) : Qt.point(0, 0) }
            visible: progress >= 0
            x: p.x - 30; y: p.y - 10
            Rectangle { width: 60; height: 10; radius: 5; color: "#00000088"; border.color: Theme.accent
                        Rectangle { width: parent.width * Math.max(0, progress); height: parent.height; radius: 5; color: Theme.accent } }
        }
    }

    // ---- contextual prompt ----
    Rectangle {
        visible: hud.prompt !== null && !hud.touch          // on touch the action button carries the label
        anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom; anchors.bottomMargin: hud.compact ? 44 : 64
        width: promptText.width + 40; height: 40; radius: 20
        color: Qt.rgba(0, 0, 0, 0.6); border.color: hud.prompt && hud.prompt.needs && hud.prompt.kind !== "unlock" && hud.prompt.kind !== "sabotage" && hud.prompt.kind !== "break" ? Theme.muted : Theme.accent; border.width: 2
        Row {
            id: promptText; anchors.centerIn: parent; spacing: 10
            Rectangle { width: 28; height: 28; radius: 6; color: Theme.accent; anchors.verticalCenter: parent.verticalCenter
                        Text { anchors.centerIn: parent; text: hud.touch ? "\u261D" : (hud.prompt && hud.prompt.kind === "bite" ? hud.game.input.labels.bite : (hud.prompt && hud.prompt.needs ? hud.game.input.labels.ability : hud.game.input.labels.interact)); color: "#102"; font.bold: true; font.pixelSize: 15 } }
            Text { text: hud.prompt ? hud.prompt.text : ""; color: Theme.text; font.pixelSize: 17; font.family: Theme.font; anchors.verticalCenter: parent.verticalCenter }
        }
    }
    // ---- bottom-left: controls reminder ----
    Text {
        x: 16; anchors.bottom: parent.bottom; anchors.bottomMargin: 12
        visible: !hud.touch
        text: "WASD move · Shift run · Ctrl sneak · E interact · F bite · Q ability · R checkpoint · Esc pause"
        color: Theme.muted; font.pixelSize: 12; font.family: Theme.font
    }
    // ---- message / tutorial toast ----
    Rectangle {
        visible: (hud.st && hud.st.message) || (hud.toast !== "" && hud.st && hud.st.elapsed < hud.toastUntil)
        anchors.horizontalCenter: parent.horizontalCenter; y: hud.compact ? 70 : 120
        width: Math.min(parent.width - 80, toastText.implicitWidth + 40); height: toastText.implicitHeight + 22; radius: 10
        color: Qt.rgba(0.1, 0.12, 0.16, 0.9); border.color: hud.st && hud.st.message ? Theme.accent2 : Theme.info; border.width: 2
        Text { id: toastText; anchors.centerIn: parent; width: parent.width - 30; wrapMode: Text.WordWrap; horizontalAlignment: Text.AlignHCenter
               text: hud.st && hud.st.message ? hud.st.message.text : hud.toast; color: Theme.text; font.pixelSize: 15; font.family: Theme.font }
    }
    // ---- flashes ----
    Rectangle {
        anchors.fill: parent
        visible: hud.flash !== "" && hud.st && hud.st.elapsed < hud.flashUntil
        color: hud.flash === "caught" ? Qt.rgba(0.8, 0.1, 0.1, 0.35) : Qt.rgba(0.3, 0.7, 1, 0.12)
        Text { anchors.centerIn: parent; text: hud.flash === "caught" ? "CAUGHT!" : "CHECKPOINT"; color: "#fff"; font.pixelSize: hud.flash === "caught" ? 64 : 34; font.bold: true; font.family: Theme.font; style: Text.Outline; styleColor: "#000" }
        Text { anchors.centerIn: parent; anchors.verticalCenterOffset: 50; visible: hud.flash === "caught"; text: "Back to the last checkpoint..."; color: "#fff"; font.pixelSize: 18; font.family: Theme.font }
    }
}
