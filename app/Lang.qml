// QML face of app/i18n/lang.js. Text bindings call tr() / fmt(), which read `rev`, so every
// label updates when the language changes.
pragma Singleton
import QtQuick
import "i18n/lang.js" as I18n

QtObject {
    // Bumped on every apply so bindings that call tr() re-evaluate.
    property int rev: 0
    property string code: "en"
    // "" means Auto (launcher, then the device). A code from I18n.ORDER is an explicit choice.
    property string choice: ""
    property string launcher: ""
    property string osName: ""

    function tr(s) {
        var n = rev
        return I18n.translate(code, s)
    }
    function fmt(template, args) {
        var n = rev
        return I18n.format(code, template, args || [])
    }
    // "Standard Zombie" -> the translated short name ("Standard" / "Padrão" / ...).
    function shortName(name) {
        var n = rev
        return I18n.translate(code, String(name || "").replace(/ Zombie$/, ""))
    }
    function apply(user, launcherRaw, osRaw) {
        // An explicit saved code is kept; anything else (including a stale value) is Auto.
        choice = I18n.matchCode(user) || ""
        launcher = launcherRaw || ""
        osName = osRaw || ""
        code = I18n.resolve(choice, launcher, osName)
        rev++
    }
    // What Auto would resolve to, ignoring the in-game choice.
    function autoCode() {
        var n = rev
        return I18n.resolve("", launcher, osName)
    }
    // The text after "Language: " — a language's own name, or "Auto · Deutsch".
    function choiceCaption() {
        var n = rev
        if (!choice) return "Auto · " + I18n.LANGS[autoCode()]
        return I18n.LANGS[choice] || choice
    }
    // Dropdown entries: Auto first, then each language by its own name (never translated).
    function choiceLabels() {
        var n = rev
        var out = ["Auto · " + I18n.LANGS[autoCode()]]
        for (var i = 0; i < I18n.ORDER.length; i++) out.push(I18n.LANGS[I18n.ORDER[i]])
        return out
    }
    // Index of the current choice in choiceLabels() (0 = Auto).
    function choiceIndex() {
        var n = rev
        if (!choice) return 0
        var i = I18n.ORDER.indexOf(choice)
        return i < 0 ? 0 : i + 1
    }
    // Code for choiceLabels()[i]: "" for Auto, else a code from ORDER.
    function choiceAt(i) {
        if (!i) return ""
        return I18n.ORDER[i - 1] || ""
    }
}
