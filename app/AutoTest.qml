// Headless wiring check of the QML side (no GPU needed), loaded by Main.qml with --autotest:
//   QT_QPA_PLATFORM=minimal QT_QUICK_BACKEND=software bite_by_bite --autotest
// Instantiates the whole game, walks the first zombie to the room door with synthetic input, opens it,
// visits every screen and prints "AUTOTEST OK" when no binding threw. Any QML TypeError / ReferenceError
// in the output is a failure.
import QtQuick

Item {
    id: root
    BiteGame { id: game; anchors.fill: parent; focus: true }
    property int step: 0
    function key(k) { game.input.keyPressed({ key: k, isAutoRepeat: false, accepted: false }); game.input.keyReleased({ key: k, isAutoRepeat: false, accepted: false }) }
    function hold(k, down) { if (down) game.input.keyPressed({ key: k, isAutoRepeat: false, accepted: false }); else game.input.keyReleased({ key: k, isAutoRepeat: false, accepted: false }) }
    Timer {
        interval: 16; repeat: true; running: true
        onTriggered: {
            step++
            if (step === 1) { console.log("autotest: title -> deck"); key(Qt.Key_Down); key(Qt.Key_Return) }
            else if (step === 3) { console.log("autotest: deck screen", game.screen); key(Qt.Key_Right); key(Qt.Key_Down); key(Qt.Key_Escape) }
            else if (step === 5) { console.log("autotest: title -> missions", game.screen); key(Qt.Key_Up); key(Qt.Key_Return) }
            else if (step === 7) { console.log("autotest: missions -> briefing", game.screen); key(Qt.Key_Return) }
            else if (step === 9) { console.log("autotest: briefing -> squad", game.screen); key(Qt.Key_Return) }
            else if (step === 11) {
                var mArg = Qt.application.arguments.filter(function (a) { return a.indexOf("--mission=") === 0 })[0]
                if (mArg) { console.log("autotest: starting", mArg.substring(10), "directly"); game.debugStart(mArg.substring(10), ["standard", "janitor"]) }
                else { console.log("autotest: squad pick 2 + start", game.screen, "roster", game.screenItem().roster.length, "index", game.screenItem().index, "picked", JSON.stringify(game.screenItem().picked)); key(Qt.Key_Return); key(Qt.Key_Right); key(Qt.Key_Return); key(Qt.Key_Right); key(Qt.Key_Right); key(Qt.Key_Return) }
            }
            else if (step === 13) { console.log("autotest: playing", game.screen, JSON.stringify(game.debugInfo())); hold(Qt.Key_D, true) }
            else if (step > 13 && step < 260 && game.screen === "playing") {
                game.tick(1 / 60)
                if (step === 100) { hold(Qt.Key_D, false); hold(Qt.Key_S, true) }
                if (step === 130) { hold(Qt.Key_S, false); hold(Qt.Key_D, true) }
            }
            else if (step === 260) {
                hold(Qt.Key_D, false)
                var info = game.debugInfo(); console.log("autotest: after walking", JSON.stringify(info))
                key(Qt.Key_E); game.tick(1 / 60)
                console.log("autotest: door open?", game.sim.state.doors[0].open, "prompt", JSON.stringify(game.sim.prompt()))
                key(Qt.Key_Tab); key(Qt.Key_H); key(Qt.Key_Q); key(Qt.Key_F); game.tick(1 / 60)
                if (game.sim.state.phase === "playing") { key(Qt.Key_1); if (game.sim.state.active !== 0) console.log("AUTOTEST FAIL: number key select"); key(Qt.Key_2); if (game.sim.state.active !== 1) console.log("AUTOTEST FAIL: number key select 2") }
                // the squad strip: tapping / clicking the first card takes control of that zombie
                var was = game.sim.state.active
                var hit = game.hudSquadTap(16 + 60, 14 + 20)
                console.log("autotest: squad card tap", hit, "active", was, "->", game.sim.state.active)
                if (!hit || game.sim.state.active !== 0) console.log("AUTOTEST FAIL: squad card tap")
                key(Qt.Key_Escape); console.log("autotest: paused", game.screen); if (game.screen !== "paused") console.log("AUTOTEST FAIL: pause")
                key(Qt.Key_Escape); console.log("autotest: resumed", game.screen); if (game.screen !== "playing") console.log("AUTOTEST FAIL: resume")
                // force a win to instantiate the results screen and exercise persistence
                var exitZone = game.mission.zones.filter(function (z) { return z.kind === "exit" })[0]
                var zb = game.sim.state.squad; for (var i = 0; i < zb.length; i++) { zb[i].x = exitZone.x + exitZone.w / 2; zb[i].z = exitZone.z + exitZone.d / 2 + i * 0.5; zb[i].hidden = null }
                for (var t = 0; t < 80; t++) game.tick(1 / 60)
                console.log("autotest: results", game.screen, JSON.stringify(game.lastResults), JSON.stringify(game.lastUnlocks))
                key(Qt.Key_Down); key(Qt.Key_Return); console.log("autotest: deck after results", game.screen, JSON.stringify(game.save.progress))
                key(Qt.Key_Escape); key(Qt.Key_Return); key(Qt.Key_Return); console.log("autotest: back to squad", game.screen)
                console.log("AUTOTEST OK")
                Qt.quit()
            }
        }
    }
}
