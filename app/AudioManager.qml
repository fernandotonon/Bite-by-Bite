// Sound cues through Clayground.Sound. Every cue is a synthesized PLACEHOLDER WAV (scripts/gen-audio.py);
// game code calls audio.play("bite") and never names a file. Master volume + mute come from the settings.
import QtQuick
import QtQml
import Clayground.Sound

Item {
    id: audio
    property real volume: 0.8
    property bool muted: false
    readonly property real gain: muted ? 0 : volume
    readonly property var names: ["ui_move", "ui_select", "ui_back", "door", "locked", "unlock", "pickup", "throw", "land", "radio", "bite", "recruit",
                                  "suspicious", "alert", "alarm", "scream", "laser", "zap", "sabotage", "smash", "crash", "hide", "checkpoint", "collect",
                                  "caught", "switch", "command", "win", "step"]
    readonly property var levels: ({ ui_move: 0.5, ui_select: 0.6, ui_back: 0.5, door: 0.7, step: 0.35, radio: 0.5, alarm: 0.7, win: 0.9, caught: 0.9 })
    property var sounds: ({})
    property real lastStep: 0
    property var web: null           // WebAudio bridge when it exists (wasm builds of the app)

    // WebAssembly: Qt audio sinks stall the page, so the cues go through the browser AudioContext instead and
    // no Sound objects are created there.
    Loader { id: bridges; active: Qt.platform.os === "wasm" && Qt.application.arguments.indexOf("--no-bridges") < 0; source: "AppBridges.qml" }
    function ensureWeb() {
        if (web || bridges.status !== Loader.Ready || !bridges.item) return
        var w = bridges.item.web
        if (w && w.available) { web = w; names.forEach(function (n) { w.load(n, Qt.resolvedUrl("../assets/audio/" + n + ".wav")) }) }
    }
    Component.onCompleted: ensureWeb()

    Instantiator {
        active: Qt.platform.os !== "wasm"
        model: audio.names
        delegate: Sound {
            required property string modelData
            source: Qt.resolvedUrl("../assets/audio/" + modelData + ".wav")
            volume: audio.gain * (audio.levels[modelData] || 0.6)
        }
        onObjectAdded: function (index, object) { var s = audio.sounds; s[audio.names[index]] = object; audio.sounds = s }
    }
    function play(name) {
        if (gain <= 0) return
        if (!web && bridges.active) ensureWeb()
        if (web) { web.play(name, gain * (levels[name] || 0.6)); return }
        var s = sounds[name]
        if (s) s.play()
    }
}
