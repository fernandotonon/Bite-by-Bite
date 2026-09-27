// The game: owns the screens (title, deck, missions, briefing, squad, playing, paused, results), the
// simulation and its clock, input routing, persistence and audio. Presentation lives in Level3D and Hud.
import QtQuick
import "scripts/Sim.js" as SimJs
import "config/characters.js" as Characters
import "config/campaign.js" as Missions
import "config/tuning.js" as Tuning

FocusScope {
    id: game
    signal quitRequested()

    // ---- state ----------------------------------------------------------------------------------
    property string screen: "title"           // title | deck | missions | briefing | squad | playing | paused | results
    property string missionId: "hospital_night_shift"
    readonly property var mission: Missions.get(missionId)
    property var squad: ["standard"]
    property var sim: null
    property int stateVersion: 0
    property real simTime: 0
    property var lastResults: null
    property var lastUnlocks: null
    property var tutorialShown: ({})
    readonly property bool running: screen === "playing"
    readonly property var appArgs: Qt.application.arguments
    readonly property bool noModels: appArgs.indexOf("--no-models") >= 0
    property alias input: input
    property alias level: level
    // small screens (phones in landscape): the 2D UI is designed for ~1280x720 and scales down as a whole
    readonly property real uiScale: Math.min(1, height / 720, width / 1100)
    readonly property bool touchShown: touch.shown
    readonly property bool reducedFx: touchShown || appArgs.indexOf("--reduced-fx") >= 0 || Qt.platform.os === "android" || Qt.platform.os === "ios"
    readonly property var hudPrompt: hud.prompt
    function hudSquadTap(x, y) { return hud.squadTap(x, y) }      // touch on the squad strip (UI-layer coordinates)
    property alias save: save
    property alias audio: audio

    SaveSystem { id: save }
    AudioManager { id: audio; volume: save.settings.volume; muted: save.settings.muted }
    InputManager { id: input; onTriggered: function (a, serial) { game.onAction(a, serial) } }
    // physical gamepad: the C++ GamepadBridge exists only in the built app (not in the dojo), so it is created dynamically
    function attachGamepad() {
        try { var gp = Qt.createQmlObject('import bite_by_bite; GamepadBridge {}', game, "GamepadBridge"); input.gamepad = gp; console.log("BiteByBite: gamepad bridge ready") }
        catch (e) { console.log("BiteByBite: no gamepad bridge in this runtime (keyboard only)") }
    }
    Keys.onPressed: function (e) { input.keyPressed(e) }
    Keys.onReleased: function (e) { input.keyReleased(e) }
    onActiveFocusChanged: if (!activeFocus) input.clear()
    Component.onCompleted: {
        save.load(); forceActiveFocus(); attachGamepad(); input.touch = touch
        Qt.callLater(function () { console.log("BiteByBite: save backend", save.backend, "unlocked", JSON.stringify(save.progress.unlocked), "models", !noModels) })
        var mArg = appArgs.filter(function (a) { return a.indexOf("--mission=") === 0 })[0]
        if (mArg) missionId = mArg.substring(10)
        if (appArgs.indexOf("--autostart") >= 0) debugStart()
    }

    // ---- mission lifecycle ----------------------------------------------------------------------
    function makeSim(squadIds) {
        return SimJs.createSim({ mission: mission, characters: Characters.byId, tuning: Tuning.tuning, squad: squadIds, rng: Math.random })
    }
    function startMission(squadIds) {
        squad = squadIds.slice()
        sim = makeSim(squad)
        level.sim = sim; level.fx = []; level.snapCamera()
        hud.sim = sim; hud.prompt = null; hud.toast = ""; hud.flash = ""
        tutorialShown = {}
        lastResults = null; lastUnlocks = null
        simTime = 0
        screen = "playing"
        refresh()
        showTutorial("move")
    }
    function finishMission() {
        lastResults = sim.results()
        lastUnlocks = save.recordResult(missionId, lastResults)
        audio.play("win")
        screen = "results"
    }
    function abandonMission() { screen = "title"; sim = null; level.sim = null; hud.sim = null }
    function debugStart(missionIdArg, squadIds) { if (missionIdArg) missionId = missionIdArg; startMission(squadIds || ["standard"]) }
    function debugInfo() {
        var S = sim ? sim.state : null
        return { screen: screen, phase: S ? S.phase : "", time: S ? S.elapsed : 0, active: S ? S.active : -1,
                 squad: S ? S.squad.map(function (z) { return { id: z.charId, x: +z.x.toFixed(2), z: +z.z.toFixed(2), hidden: !!z.hidden } }) : [],
                 guards: S ? S.humans.map(function (h) { return { id: h.id, state: h.state, meter: +h.meter.toFixed(2) } }) : [] }
    }

    // ---- clock ------------------------------------------------------------------------------------
    FrameAnimation {
        running: game.running
        onTriggered: game.tick(Math.min(frameTime, 0.1))
    }
    function tick(dt) {
        input.poll()
        sim.setInput({ x: input.moveX, z: input.moveZ, run: input.run, sneak: input.sneak })
        sim.step(dt)
        simTime = sim.state.time
        level.simTime = simTime; hud.stateVersion = stateVersion
        level.sync(dt)
        handleEvents()
        refresh()
        if (sim.state.phase === "won") finishMission()
    }
    function refresh() {
        stateVersion++
        level.stateVersion = stateVersion
        hud.stateVersion = stateVersion
        hud.prompt = sim ? sim.prompt() : null
        if (hud.prompt) { if (hud.prompt.kind === "door") showTutorial("door"); else if (hud.prompt.kind === "pickup") showTutorial("radio"); else if (hud.prompt.kind === "bite") showTutorial("bite") }
    }
    function showTutorial(id) {
        if (!save.settings.showTutorial || tutorialShown[id]) return
        var t = null
        for (var i = 0; i < mission.tutorial.length; i++) if (mission.tutorial[i].id === id) t = mission.tutorial[i]
        if (!t) return
        tutorialShown[id] = true
        hud.toast = t.text; hud.toastUntil = sim.state.elapsed + 6
    }
    function handleEvents() {
        var evs = sim.takeEvents()
        for (var i = 0; i < evs.length; i++) {
            var e = evs[i]
            switch (e.type) {
            case "door": audio.play("door"); break
            case "locked": audio.play("locked"); break
            case "unlock": audio.play("unlock"); break
            case "pickup": audio.play("pickup"); break
            case "throw": audio.play("throw"); break
            case "land": audio.play("land"); audio.play("radio"); level.addFx(e.x, e.z, "noise"); break
            case "noise": if (e.kind === "radio" || e.kind === "crash" || e.kind === "scream") level.addFx(e.x, e.z, "noise"); break
            case "biteStart": break
            case "bite": audio.play("bite"); level.addFx(e.x, e.z, "bite"); break
            case "recruit": audio.play("recruit"); showTutorial("switch"); hud.toast = Characters.get(e.charId).name + " joined the squad! Tab switches, H tells the others to stay or follow."; hud.toastUntil = sim.state.elapsed + 6; break
            case "suspicious": audio.play("suspicious"); break
            case "alert": audio.play("alert"); break
            case "alarm": audio.play("alarm"); level.addFx(e.x, e.z, "alarm"); break
            case "scream": audio.play("scream"); break
            case "laserTrip": audio.play("laser"); break
            case "zap": audio.play("zap"); break
            case "sabotage": audio.play("sabotage"); hud.toast = "Security down for " + Math.round(e.duration) + " s. A guard will come to check the panel."; hud.toastUntil = sim.state.elapsed + 4; break
            case "smash": audio.play("smash"); hud.toast = "Panel smashed: " + Math.round(e.duration) + " s outage and every guard heard it!"; hud.toastUntil = sim.state.elapsed + 4; break
            case "wallBreak": audio.play("crash"); level.addFx(e.x, e.z, "noise"); break
            case "hide": case "unhide": audio.play("hide"); break
            case "checkpoint": audio.play("checkpoint"); hud.flash = "checkpoint"; hud.flashUntil = sim.state.elapsed + 1.2; showTutorial("guard"); break
            case "collect": audio.play("collect"); break
            case "caught": audio.play("caught"); hud.flash = "caught"; hud.flashUntil = sim.state.elapsed + Tuning.tuning.caughtRestartDelay; break
            case "restart": level.snapCamera(); level.fx = []; break
            case "switch": audio.play("switch"); break
            case "command": audio.play("command"); hud.toast = e.mode === "stay" ? "Squad: stay here" : "Squad: follow me"; hud.toastUntil = sim.state.elapsed + 1.5; break
            case "noTarget": audio.play("locked"); break
            case "control": audio.play("unlock"); hud.toast = (e.kind === "shutter" ? "Shutter opening" : "Control activated"); hud.toastUntil = sim.state.elapsed + 2; break
            case "bait": audio.play("throw"); break
            case "baitLand": audio.play("land"); level.addFx(e.x, e.z, "noise"); break
            case "traverseStart": audio.play("hide"); break
            case "traverseEnd": audio.play("hide"); level.snapCamera(); break
            case "cough": audio.play("step"); level.addFx(e.x, e.z, "noise"); break
            case "screamAbility": audio.play("scream"); level.addFx(e.toX, e.toZ, "alarm"); break
            case "sedate": audio.play("hide"); level.addFx(e.x, e.z, "bite"); hud.toast = "Sedated - asleep for a while"; hud.toastUntil = sim.state.elapsed + 2; break
            case "wake": audio.play("suspicious"); break
            case "release": audio.play("recruit"); level.addFx(e.x, e.z, "bite"); hud.toast = Characters.get(e.charId).name + " is free and follows you!"; hud.toastUntil = sim.state.elapsed + 3; break
            case "sonicAlarm": audio.play("alarm"); hud.toast = "Live microphones! The whole studio heard that."; hud.toastUntil = sim.state.elapsed + 3; break
            case "hazardOff": audio.play("sabotage"); level.addFx(e.x, e.z, "noise"); hud.toast = e.kind === "fire" ? "Fire out" : "Smoke clearing"; hud.toastUntil = sim.state.elapsed + 2; break
            case "controlExpired": audio.play("locked"); break
            case "doorClosed": audio.play("door"); break
            }
        }
    }

    // ---- input routing --------------------------------------------------------------------------
    property int consumedSerial: -1
    function onAction(a, serial) {
        if (serial !== undefined && serial === consumedSerial) return    // this press already changed the screen
        var before = screen
        handleAction(a)
        if (screen !== before && serial !== undefined) consumedSerial = serial
    }
    function handleAction(a) {
        if (screen === "playing") {
            switch (a) {
            case "interact": sim.interact(); refresh(); break
            case "context": {   // the touch button: whatever the prompt offers (bite / ability / interact)
                var pr = sim.prompt()
                if (pr && pr.kind === "bite") sim.bite(); else if (pr && pr.needs) sim.ability(); else sim.interact()
                refresh(); break
            }
            case "bite": sim.bite(); refresh(); break
            case "ability": sim.ability(); refresh(); break
            case "switchNext": sim.switchZombie(1); refresh(); break
            case "switchPrev": sim.switchZombie(-1); refresh(); break
            case "command": sim.toggleCommand(); refresh(); break
            case "restart": sim.restart(); level.snapCamera(); refresh(); break
            case "pause": screen = "paused"; audio.play("ui_select"); input.clear(); break
            }
            return
        }
        var s = screenItem()
        if (s && s.navigate) s.navigate(a)
    }
    function screenItem() {
        switch (screen) {
        case "title": return title
        case "deck": return deck
        case "missions": return missions
        case "briefing": return briefing
        case "squad": return squadScreen
        case "paused": return pause
        case "results": return results
        }
        return null
    }

    // ---- presentation ---------------------------------------------------------------------------
    Rectangle { anchors.fill: parent; color: Theme.bg }
    Level3D {
        id: level
        anchors.fill: parent
        visible: game.screen === "playing" || game.screen === "paused" || game.screen === "results"
        mission: game.mission
        showCones: save.settings.showCones
        useModels: !game.noModels
        reducedFx: game.reducedFx     // phones: no shadows / MSAA (MSAA offscreen targets also come out black on mobile WebGL)
    }
    // a touch anywhere reveals the touch controls; PointHandler is passive, so menus keep their clicks
    PointHandler { acceptedDevices: PointerDevice.TouchScreen; onActiveChanged: if (active) touch.shown = true }
    Item {
        id: ui
        transformOrigin: Item.TopLeft
        scale: game.uiScale
        width: game.width / game.uiScale
        height: game.height / game.uiScale
    Hud {
        id: hud
        anchors.fill: parent
        visible: game.screen === "playing"
        game: game; level: level; uiScale: game.uiScale
        touch: game.touchShown
    }
    TitleScreen { id: title; anchors.fill: parent; visible: game.screen === "title"; game: game
                  onPlay: game.screen = "missions"; onDeck: game.screen = "deck"; onQuit: game.quitRequested() }
    DeckScreen { id: deck; anchors.fill: parent; visible: game.screen === "deck"; game: game; onBack: { audio.play("ui_back"); game.screen = game.sim && game.lastResults ? "results" : "title" } }
    MissionScreen { id: missions; anchors.fill: parent; visible: game.screen === "missions"; game: game
                    onChosen: function (id) { if (Missions.isUnlocked(Missions.get(id), save.completedMissions())) { game.missionId = id; game.screen = "briefing" } else audio.play("locked") }
                    onBack: { audio.play("ui_back"); game.screen = "title" } }
    BriefingScreen { id: briefing; anchors.fill: parent; visible: game.screen === "briefing"; game: game; mission: game.mission
                     onProceed: { squadScreen.reset(); game.screen = "squad" }
                     onBack: game.screen = "missions" }
    SquadScreen { id: squadScreen; anchors.fill: parent; visible: game.screen === "squad"; game: game; mission: game.mission
                  onStart: function (ids) { game.startMission(ids) }
                  onBack: { audio.play("ui_back"); game.screen = "briefing" } }
    PauseScreen { id: pause; anchors.fill: parent; visible: game.screen === "paused"; game: game
                  onResume: { game.screen = "playing"; game.forceActiveFocus() }
                  onRestartCheckpoint: { sim.restart(); level.snapCamera(); game.refresh(); game.screen = "playing" }
                  onRestartMission: game.startMission(game.squad)
                  onAbandon: game.abandonMission() }
    ResultsScreen { id: results; anchors.fill: parent; visible: game.screen === "results"; game: game; results: game.lastResults; unlocks: game.lastUnlocks
                    onReplay: { squadScreen.reset(); game.screen = "squad" }
                    onDeck: game.screen = "deck"
                    onMissions: { game.sim = null; level.sim = null; hud.sim = null; game.screen = "missions" } }
    TouchControls { id: touch; anchors.fill: parent; game: game; input: input; z: 50 }
    }
}
