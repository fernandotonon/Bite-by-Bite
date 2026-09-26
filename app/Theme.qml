// UI palette and type for every screen (singleton).
pragma Singleton
import QtQuick

QtObject {
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
    readonly property string font: "Helvetica Neue"
    readonly property int radius: 12
}
