// Language service. Strings in the code and the mission data are the English source text and
// double as translation keys (app/i18n/<code>.js). A missing translation shows the English text.
//
// Which language is used (first match wins):
//   1. the player's choice in the game (title / pause -> Language), when not Auto
//   2. the QtMesh Games launcher: QTMESH_LANG, or --lang= on the web build (pt_BR, pt-BR, pt)
//   3. the device / OS language
//   4. English
//
// Pure data and functions so the node tests can load this file. Lang.qml is the QML face.
.pragma library
.import "pt_br.js" as PtBr
.import "de.js" as De
.import "ru.js" as Ru
.import "fr.js" as Fr
.import "pl.js" as Pl
.import "tr.js" as Tr
.import "es.js" as Es
.import "it.js" as It

// code -> name shown in that language (never translated). ORDER is the release priority and the
// order of the language control. Each non-English code has app/i18n/<code lowercase>.js.
var ORDER = ["en", "pt_BR", "de", "ru", "fr", "pl", "tr", "es", "it"]
var LANGS = {
    "en": "English",
    "pt_BR": "Português (Brasil)",
    "de": "Deutsch",
    "ru": "Русский",
    "fr": "Français",
    "pl": "Polski",
    "tr": "Türkçe",
    "es": "Español",
    "it": "Italiano"
}
var DICTS = {
    "pt_BR": PtBr.STRINGS,
    "de": De.STRINGS,
    "ru": Ru.STRINGS,
    "fr": Fr.STRINGS,
    "pl": Pl.STRINGS,
    "tr": Tr.STRINGS,
    "es": Es.STRINGS,
    "it": It.STRINGS
}

// "pt-br", "PT_br", "pt" -> "pt_BR" (a bare language matches the first supported variant); "" if unsupported.
function matchCode(raw) {
    var r = String(raw || "").replace(/^\s+|\s+$/g, "").replace(/-/g, "_").split(".")[0].split("@")[0]
    if (!r) return ""
    var low = r.toLowerCase()
    var i
    for (i = 0; i < ORDER.length; i++) if (ORDER[i].toLowerCase() === low) return ORDER[i]
    var lang = low.split("_")[0]
    for (i = 0; i < ORDER.length; i++) if (ORDER[i].toLowerCase().split("_")[0] === lang) return ORDER[i]
    return ""
}

// user / launcher / os are raw codes. First supported one wins, else English.
function resolve(user, launcher, os) {
    var c = matchCode(user)
    if (c) return c
    c = matchCode(launcher)
    if (c) return c
    c = matchCode(os)
    if (c) return c
    return "en"
}

function translate(code, text) {
    if (text === undefined || text === null) return ""
    var s = String(text)
    if (!s || code === "en") return s
    var dict = DICTS[code]
    if (dict && dict[s] !== undefined && dict[s] !== "") return dict[s]
    return s
}

// Translate the format, then fill %s / %d from the left. Arguments are already display text.
function format(code, template, args) {
    var out = translate(code, template)
    var i = 0
    var list = args || []
    return out.replace(/%[sd]/g, function () {
        var a = list[i++]
        return a === undefined || a === null ? "" : String(a)
    })
}
