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

    Instantiator {
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
        var s = sounds[name]
        if (s) s.play()
    }
}
