// UI palette and type for every screen (singleton).
// DejaVu Sans covers the languages the game ships (Latin, Cyrillic, Turkish). Main.qml loads the
// regular and bold faces of that family; font.bold then picks the bold file. Helvetica Neue is
// only the fallback before those files load.
pragma Singleton
import QtQuick

QtObject {
    // Set from Main.qml once both DejaVu faces have loaded. Empty until then.
    property string loadedFont: ""
    readonly property string font: loadedFont !== "" ? loadedFont : "Helvetica Neue"
    readonly property color bg: "#141a22"
    readonly property color panel: "#1f2733"
    readonly property color panelLight: "#2a3542"
    readonly property color border: "#3d4b5c"
    readonly property color text: "#eef2f5"
    readonly property color muted: "#9aa8b8"
    readonly property color accent: "#7fe07a"       // zombie green
    readonly property color accent2: "#ffc531"      // warning yellow
    readonly property color danger: "#ff3b3b"
    readonly property color info: "#5aa8ff"
    readonly property int radius: 12
}
