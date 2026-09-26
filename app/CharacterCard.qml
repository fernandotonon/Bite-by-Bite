// A Horde Deck card: portrait colour + name + ability line, or a locked silhouette.
import QtQuick
import "config/characters.js" as Characters

Rectangle {
    id: card
    property string charId: ""
    property bool unlocked: false
    property bool current: false
    property bool picked: false
    property int order: 0
    readonly property var ch: Characters.get(charId)
    readonly property bool capturable: ch ? ch.capturable !== false : false
    width: 150; height: 190
    radius: 10
    color: current ? Theme.panelLight : Theme.panel
    border.color: picked ? Theme.accent : (current ? Theme.accent2 : Theme.border)
    border.width: picked || current ? 3 : 2

    // portrait: a toon silhouette made of rectangles (PLACEHOLDER art until turntable renders exist)
    Item {
        id: portrait
        width: 90; height: 100; anchors.horizontalCenter: parent.horizontalCenter; y: 12
        readonly property color body: card.unlocked && ch ? ch.color : (ch && ch.silhouette ? ch.silhouette : "#333")
        readonly property color skin: card.unlocked ? "#8fd48a" : "#222"
        Rectangle { width: 34; height: 34; radius: 8; color: portrait.skin; anchors.horizontalCenter: parent.horizontalCenter; y: 0 }
        Rectangle { width: 52; height: 44; radius: 8; color: portrait.body; anchors.horizontalCenter: parent.horizontalCenter; y: 38 }
        Rectangle { width: 18; height: 30; radius: 4; color: portrait.body; x: 22; y: 80 }
        Rectangle { width: 18; height: 30; radius: 4; color: portrait.body; x: 50; y: 80 }
        Rectangle { width: 14; height: 36; radius: 4; color: portrait.skin; x: 6; y: 42 }
        Rectangle { width: 14; height: 36; radius: 4; color: portrait.skin; x: 70; y: 42 }
        Text { visible: !card.unlocked; anchors.centerIn: parent; text: "?"; color: "#666"; font.pixelSize: 44; font.bold: true }
        Rectangle { visible: card.picked; width: 26; height: 26; radius: 13; color: Theme.accent; x: 66; y: -6; Text { anchors.centerIn: parent; text: card.order; color: "#102"; font.bold: true; font.pixelSize: 15 } }
    }
    Text { y: 120; width: parent.width - 12; anchors.horizontalCenter: parent.horizontalCenter; horizontalAlignment: Text.AlignHCenter; text: card.unlocked ? ch.name : (ch ? ch.occupation : "???"); color: card.unlocked ? Theme.text : Theme.muted; font.pixelSize: 15; font.bold: true; font.family: Theme.font; elide: Text.ElideRight }
    Text { y: 142; width: parent.width - 12; anchors.horizontalCenter: parent.horizontalCenter; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; maximumLineCount: 2
           text: card.unlocked ? ch.ability.label : (card.capturable ? "Capture in a mission" : "Not yet in this outbreak"); color: card.unlocked ? Theme.accent : Theme.muted; font.pixelSize: 12; font.family: Theme.font }
}
