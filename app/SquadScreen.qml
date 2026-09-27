// Pre-mission squad selection: pick up to the mission's squad limit from the unlocked deck.
// Non-optimal squads are allowed; the first pick is the zombie controlled at the start.
import QtQuick
import "config/characters.js" as Characters

Item {
    id: screen
    property var game: null
    property var mission: null
    property var picked: []
    property int index: 0
    readonly property var roster: Characters.characters.filter(function (c) { return game && game.save.isUnlocked(c.id) })
    readonly property int limit: mission ? mission.squadLimit : 2
    readonly property bool atStartRow: index === roster.length
    signal start(var squad)
    signal back()
    function navigate(action) {
        var n = roster.length + 1
        if (action === "menuLeft" || action === "menuUp") { index = (index - 1 + n) % n; game.audio.play("ui_move"); return true }
        if (action === "menuRight" || action === "menuDown") { index = (index + 1) % n; game.audio.play("ui_move"); return true }
        if (action === "accept") {
            if (atStartRow) { if (picked.length) { game.audio.play("ui_select"); start(picked.slice()) } else game.audio.play("locked"); return true }
            toggle(roster[index].id); return true
        }
        if (action === "back") { back(); return true }
        return false
    }
    function toggle(id) {
        var p = picked.slice(), i = p.indexOf(id)
        if (i >= 0) { p.splice(i, 1); game.audio.play("ui_back") }
        else if (p.length < limit) { p.push(id); game.audio.play("ui_select") }
        else { game.audio.play("locked"); return }
        picked = p
    }
    function reset() { picked = []; index = 0 }

    Rectangle { anchors.fill: parent; color: Theme.bg }
    Text { x: 40; y: 26; text: "ASSEMBLE THE HORDE"; color: Theme.accent; font.pixelSize: 36; font.bold: true; font.family: Theme.font }
    Text { x: 40; y: 72; text: "Pick up to " + screen.limit + " zombies for " + (mission ? mission.title : "") + ". The first pick starts in control."; color: Theme.muted; font.pixelSize: 15; font.family: Theme.font }
    Row {
        x: 40; y: 120; spacing: 14
        Repeater {
            model: screen.roster.length
            delegate: CharacterCard {
                required property int index
                charId: screen.roster[index].id
                unlocked: true
                current: index === screen.index
                picked: screen.picked.indexOf(charId) >= 0
                order: screen.picked.indexOf(charId) + 1
                MouseArea { anchors.fill: parent; onClicked: { screen.index = index; screen.toggle(charId) } }
            }
        }
    }
    Panel {
        id: info
        x: 40; y: 330; width: parent.width - 80; height: 120
        CharacterStage { anchors.right: parent.right; anchors.rightMargin: 10; y: -60; width: 200; height: 175; reducedFx: game && game.reducedFx; visible: !!info.ch; assetId: info.ch ? info.ch.asset : ""; modelHeight: info.ch && info.ch.id === "brute" ? 2.05 : 1.75 }
        readonly property var ch: screen.atStartRow ? null : screen.roster[screen.index]
        Column {
            x: 22; y: 16; width: parent.width - 260; spacing: 4
            Text { text: info.ch ? info.ch.name + " · " + info.ch.occupation : "Start the mission"; color: Theme.text; font.pixelSize: 20; font.bold: true; font.family: Theme.font }
            Text { text: info.ch ? "Ability: " + info.ch.ability.label + " - " + info.ch.ability.hint : (screen.picked.length ? "Squad: " + screen.picked.map(function (id) { return Characters.get(id).name }).join(", ") : "Pick at least one zombie."); color: Theme.accent; font.pixelSize: 14; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
            Text { text: info.ch ? "Passive: " + info.ch.passive.hint + "   Weakness: " + info.ch.weakness.hint : ""; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
        }
    }
    Rectangle {
        x: 40; y: 470; width: 320; height: 52; radius: 10
        color: screen.atStartRow ? Qt.rgba(Theme.accent.r, Theme.accent.g, Theme.accent.b, 0.25) : Theme.panel
        border.color: screen.atStartRow ? Theme.accent : Theme.border; border.width: 2
        Text { anchors.centerIn: parent; text: (screen.atStartRow ? "▶ " : "") + "START MISSION (" + screen.picked.length + "/" + screen.limit + ")"; color: screen.picked.length ? Theme.text : Theme.muted; font.pixelSize: 18; font.bold: true; font.family: Theme.font }
        MouseArea { anchors.fill: parent; onClicked: { screen.index = screen.roster.length; screen.navigate("accept") } }
    }
    Text { x: 40; anchors.bottom: parent.bottom; anchors.bottomMargin: 18; text: "←→ browse · Enter pick / start · Esc back"; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font }
}
