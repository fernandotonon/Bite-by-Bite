// Horde Deck: the persistent roster. Unlocked zombies show their ability / passive / weakness,
// undiscovered ones only a silhouette and an occupation.
import QtQuick
import "config/characters.js" as Characters

Item {
    id: screen
    property var game: null
    property int index: 0
    readonly property var roster: Characters.characters
    readonly property int cols: Math.max(2, Math.floor((width - 420) / 165))
    readonly property var current: roster[index]
    readonly property bool currentUnlocked: game ? game.save.isUnlocked(current.id) : false
    signal back()
    function navigate(action) {
        var n = roster.length
        if (action === "menuLeft") { index = (index - 1 + n) % n; game.audio.play("ui_move"); return true }
        if (action === "menuRight") { index = (index + 1) % n; game.audio.play("ui_move"); return true }
        if (action === "menuUp") { index = (index - cols + n) % n; game.audio.play("ui_move"); return true }
        if (action === "menuDown") { index = (index + cols) % n; game.audio.play("ui_move"); return true }
        if (action === "back" || action === "accept") { back(); return true }
        return false
    }

    Rectangle { anchors.fill: parent; color: Theme.bg }
    Text { x: 40; y: 26; text: "HORDE DECK"; color: Theme.accent; font.pixelSize: 36; font.bold: true; font.family: Theme.font }
    Text { x: 40; y: 72; text: (game ? game.save.progress.unlocked.length : 0) + " / " + roster.filter(function (c) { return c.capturable !== false }).length + " capturable zombies collected · " + roster.length + " known occupations"; color: Theme.muted; font.pixelSize: 15; font.family: Theme.font }

    Grid {
        x: 40; y: 110; columns: screen.cols; spacing: 14
        Repeater {
            model: screen.roster.length
            delegate: CharacterCard {
                required property int index
                charId: screen.roster[index].id
                unlocked: game ? game.save.isUnlocked(charId) : false
                current: index === screen.index
                MouseArea { anchors.fill: parent; onClicked: screen.index = index }
            }
        }
    }
    Panel {
        anchors.right: parent.right; anchors.rightMargin: 40; y: 110; width: 340; height: parent.height - 170
        CharacterStage { x: 20; y: 16; width: parent.width - 40; height: 170; assetId: screen.currentUnlocked ? screen.current.asset : ""; visible: screen.currentUnlocked; modelHeight: screen.currentUnlocked && screen.current.id === "brute" ? 2.05 : 1.75 }
        Rectangle { visible: !screen.currentUnlocked; x: 20; y: 16; width: parent.width - 40; height: 170; radius: 10; color: Theme.bg; Text { anchors.centerIn: parent; text: "?"; color: "#444"; font.pixelSize: 90; font.bold: true } }
        Column {
            x: 22; y: 200; width: parent.width - 44; spacing: 8
            Text { text: screen.currentUnlocked ? screen.current.name : "???"; color: Theme.text; font.pixelSize: 24; font.bold: true; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
            Text { text: screen.current.occupation; color: Theme.muted; font.pixelSize: 15; font.family: Theme.font }
            Rectangle { width: parent.width; height: 2; color: Theme.border }
            Repeater {
                model: screen.currentUnlocked ? [
                    { t: "ACTIVE ABILITY", l: screen.current.ability.label, h: screen.current.ability.hint, c: Theme.accent },
                    { t: "PASSIVE", l: screen.current.passive.label, h: screen.current.passive.hint, c: Theme.info },
                    { t: "WEAKNESS", l: screen.current.weakness.label, h: screen.current.weakness.hint, c: Theme.danger }
                ] : [ { t: "STATUS", l: "Locked", h: screen.current.capturable === false ? "Not part of this outbreak yet." : "Infect this human during a mission to add them to the deck.", c: Theme.muted } ]
                delegate: Column {
                    required property var modelData
                    width: parent.width; spacing: 2
                    Text { text: modelData.t; color: modelData.c; font.pixelSize: 12; font.bold: true; font.family: Theme.font }
                    Text { text: modelData.l; color: Theme.text; font.pixelSize: 16; font.bold: true; font.family: Theme.font }
                    Text { text: modelData.h; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font; width: parent.width; wrapMode: Text.WordWrap }
                }
            }
            Text { visible: screen.currentUnlocked; text: screen.currentUnlocked ? "Speed " + screen.current.speed.walk + " m/s · run " + screen.current.speed.run + " · sneak " + screen.current.speed.sneak : ""; color: Theme.muted; font.pixelSize: 12; font.family: Theme.font }
        }
    }
    Text { x: 40; anchors.bottom: parent.bottom; anchors.bottomMargin: 18; text: "←↑↓→ browse · Esc back"; color: Theme.muted; font.pixelSize: 13; font.family: Theme.font }
}
