// Persistent progress and settings: one JSON blob each in Clayground's KeyValueStore (SQLite through
// QtQuick.LocalStorage). Everything the design asks to persist lives in `progress`:
//   unlocked      captured character ids (the Horde Deck)
//   missions      { id: { completed, bestTime, optionals: [ids], collectibles: [ids], rating, stars, plays } }
import QtQuick
import "config/characters.js" as Characters

Item {
    id: save
    property var settings: ({ volume: 0.8, muted: false, showTutorial: true, showCones: true })
    property var progress: ({ unlocked: Characters.initialUnlocked(), missions: {} })
    readonly property string settingsKey: "settings.v1"
    readonly property string progressKey: "progress.v1"
    property var store: null
    readonly property string backend: store && store.backend !== undefined ? store.backend : "KeyValueStore"

    function ensureStore() {
        if (store) return store
        // --autotest runs keep their own store so headless checks never touch real progress
        var name = Qt.application.arguments.indexOf("--autotest") >= 0 ? "BiteByBiteAutotest" : "BiteByBite"
        try { store = Qt.createQmlObject('import Clayground.Storage; KeyValueStore { name: "' + name + '" }', save, "KeyValueStore") }
        catch (e) { console.warn("SaveSystem: no storage backend, progress will not persist", e); store = memoryStore }
        return store
    }
    property bool loaded: false
    Component.onCompleted: load()
    property var memoryStore: ({ data: {}, backend: "memory", get: function (k, d) { return k in this.data ? this.data[k] : d }, set: function (k, v) { this.data[k] = v; return true }, remove: function (k) { delete this.data[k] } })

    function load() {
        ensureStore()
        if (loaded) return
        loaded = true
        try { var s = store.get(settingsKey, ""); if (s) settings = Object.assign({}, settings, JSON.parse(s)) } catch (e) { console.warn("SaveSystem: bad settings", e) }
        try { var p = store.get(progressKey, ""); if (p) { var pr = JSON.parse(p); progress = { unlocked: pr.unlocked || Characters.initialUnlocked(), missions: pr.missions || {} } } } catch (e2) { console.warn("SaveSystem: bad progress", e2) }
    }
    function writeSettings(patch) { settings = Object.assign({}, settings, patch); ensureStore().set(settingsKey, JSON.stringify(settings)) }
    function writeProgress(p) { progress = p; ensureStore().set(progressKey, JSON.stringify(p)) }
    function isUnlocked(charId) { return progress.unlocked.indexOf(charId) >= 0 }
    function missionRecord(id) { return progress.missions[id] || null }
    function missionCompleted(id) { var r = missionRecord(id); return !!(r && r.completed) }
    // merge a mission result; returns { newCharacters: [ids], newBest: bool }
    function recordResult(missionId, result) {
        var p = { unlocked: progress.unlocked.slice(), missions: Object.assign({}, progress.missions) }
        var rec = Object.assign({ completed: false, bestTime: 0, optionals: [], collectibles: [], rating: "", stars: 0, plays: 0 }, p.missions[missionId] || {})
        var out = { newCharacters: [], newBest: false }
        rec.plays += 1
        if (result.won) {
            rec.completed = true
            if (!rec.bestTime || result.time < rec.bestTime) { rec.bestTime = Math.round(result.time); out.newBest = true }
            for (var i = 0; i < result.optional.length; i++) if (result.optional[i].done && rec.optionals.indexOf(result.optional[i].id) < 0) rec.optionals.push(result.optional[i].id)
            for (i = 0; i < result.collected.length; i++) if (rec.collectibles.indexOf(result.collected[i]) < 0) rec.collectibles.push(result.collected[i])
            // the rating is the best set of optionals ever achieved on this mission
            rec.stars = Math.max(rec.stars, result.stars)
            rec.rating = ["C", "B", "A", "S", "S+"][Math.max(rec.stars, result.stars)] || "C"
            for (i = 0; i < result.recruited.length; i++) if (p.unlocked.indexOf(result.recruited[i]) < 0) { p.unlocked.push(result.recruited[i]); out.newCharacters.push(result.recruited[i]) }
        }
        p.missions[missionId] = rec
        writeProgress(p)
        return out
    }
    function clearAll() { ensureStore().remove(settingsKey); store.remove(progressKey); settings = { volume: 0.8, muted: false, showTutorial: true, showCones: true }; progress = { unlocked: Characters.initialUnlocked(), missions: {} } }
}
