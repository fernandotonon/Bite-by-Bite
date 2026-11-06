// Language selection and translation checks.   node tests/lang.test.js
import assert from "node:assert/strict"
import { readFileSync, readdirSync } from "node:fs"
import { dirname, join } from "node:path"
import { fileURLToPath } from "node:url"
import { loadQmlJs } from "./qmljs-load.mjs"
import { Ch, Mi } from "./helpers.mjs"

const here = dirname(fileURLToPath(import.meta.url))
const root = join(here, "..")
const I18n = loadQmlJs(join(root, "app", "i18n", "lang.js"))

let failures = 0
function check(cond, msg) {
    console.log((cond ? "  ok   " : "  FAIL ") + msg)
    if (!cond) failures++
}

console.log("code matching")
check(I18n.matchCode("pt_BR") === "pt_BR" && I18n.matchCode("pt-br") === "pt_BR" && I18n.matchCode("PT") === "pt_BR", "pt variants -> pt_BR")
check(I18n.matchCode("pt_BR.UTF-8") === "pt_BR" && I18n.matchCode("en_US") === "en", "encoding suffix, en_US -> en")
check(I18n.matchCode("ko_KR") === "" && I18n.matchCode("") === "", "unsupported / empty -> none")

console.log("priority: in-game > launcher > device > english")
check(I18n.resolve("", "", "ko_KR") === "en", "unsupported device language -> English")
check(I18n.resolve("", "", "pt_BR") === "pt_BR", "device language")
check(I18n.resolve("", "en", "pt_BR") === "en", "launcher beats device")
check(I18n.resolve("pt_BR", "en", "de") === "pt_BR", "in-game choice beats launcher")
check(I18n.resolve("bogus", "en", "de") === "en", "invalid in-game value ignored")
check(I18n.resolve("", "xx", "pt-BR") === "pt_BR", "invalid launcher value falls through to device")

console.log("translation")
check(I18n.translate("pt_BR", "Some unlisted English text") === "Some unlisted English text", "missing string stays English")
check(I18n.translate("en", "Play") === "Play", "English shows source text")
check(I18n.format("en", "Open %s", ["Room door"]) === "Open Room door", "format fills placeholders")
check(I18n.format("en", "Security down for %d s. A guard will come to check the panel.", [12]) === "Security down for 12 s. A guard will come to check the panel.", "format keeps the English sentence")

function add(set, s) { if (typeof s === "string" && s.trim()) set.add(s) }
function stringsFromData() {
    const out = new Set()
    for (const c of Ch.characters) {
        add(out, c.name); add(out, c.occupation); add(out, c.name.replace(/ Zombie$/, ""))
        for (const part of [c.ability, c.passive, c.weakness]) if (part) { add(out, part.label); add(out, part.hint) }
    }
    for (const m of Mi.missions) {
        add(out, m.title); add(out, m.subtitle); add(out, m.story); add(out, m.unlockText)
        const b = m.briefing || {}
        add(out, b.objective)
        for (const list of [b.hazards, b.suggested, b.challenges]) (list || []).forEach(s => add(out, s))
        add(out, m.objectives.main.label)
        m.objectives.optional.forEach(o => add(out, o.label))
        ;(m.tutorial || []).forEach(t => add(out, t.text))
        for (const list of ["doors", "props", "pickups", "collectibles", "panels", "controls", "traversals", "humans", "zones"]) {
            for (const it of (m[list] || [])) add(out, it.label)
        }
    }
    return out
}

function quoted(re, text, into) {
    for (const m of text.matchAll(re)) add(into, m[1].replace(/\\n/g, "\n").replace(/\\"/g, '"'))
}
function stringsFromSource() {
    const out = new Set()
    const qml = readdirSync(join(root, "app")).filter(f => f.endsWith(".qml"))
    for (const f of qml) {
        const text = readFileSync(join(root, "app", f), "utf8")
        quoted(/Lang\.tr\("((?:\\.|[^"\\])*)"\)/g, text, out)
        quoted(/Lang\.fmt\("((?:\\.|[^"\\])*)"/g, text, out)
    }
    const sim = readFileSync(join(root, "app", "scripts", "Sim.js"), "utf8")
    quoted(/offer\(\{[^}]*\}, "((?:\\.|[^"\\])*)"/g, sim, out)
    quoted(/offer\(\{[^}]*\} \? "((?:\\.|[^"\\])*)" : "((?:\\.|[^"\\])*)"/g, sim, out)
    // ternaries used as the format argument: "Unlock %s" : "Locked: %s"
    quoted(/"((?:\\.|[^"\\])*%s(?:\\.|[^"\\])*)"/g, sim, out)
    quoted(/setMessage\([^,]+, "((?:\\.|[^"\\])*)"/g, sim, out)
    quoted(/line\("((?:\\.|[^"\\])*)"\)/g, sim, out)
    const game = readFileSync(join(root, "app", "BiteGame.qml"), "utf8")
    quoted(/toastFmt = "((?:\\.|[^"\\])*)"/g, game, out)
    quoted(/toastFmt = \([^)]+ \? "((?:\\.|[^"\\])*)" : "((?:\\.|[^"\\])*)"\)/g, game, out)
    return out
}

const required = stringsFromData()
for (const s of stringsFromSource()) required.add(s)
// fixed prompts whose format has no placeholder, so the %s scan misses them
for (const s of ["Throw food bait", "SCREAM", "Break weak wall", "Weak wall (needs Brute)", "Leave hiding",
    "Only a Brute can break this wall", "No one to bite here", "Squad: stay here", "Squad: follow me",
    "Shutter opening", "Control activated", "Sedated - asleep for a while",
    "Live microphones! The whole studio heard that.", "Fire out", "Smoke clearing",
    "on", "off", "muted", "Hidden"]) required.add(s)

const ref = loadQmlJs(join(root, "app", "i18n", "pt_br.js")).STRINGS
console.log("catalog: " + required.size + " source strings, pt_BR has " + Object.keys(ref).length)
let missingRef = 0
for (const k of required) if (!(k in ref)) { if (missingRef < 30) console.log("  missing pt_BR: " + JSON.stringify(k)); missingRef++ }
check(missingRef === 0, "pt_BR has every source string (" + missingRef + " missing)")

console.log("every translation keeps the placeholders and line breaks of its key")
for (const code of I18n.ORDER) {
    if (code === "en") continue
    const S = loadQmlJs(join(root, "app", "i18n", code.toLowerCase() + ".js")).STRINGS
    let bad = 0
    for (const k of required) {
        if (!(k in S)) { if (bad < 8) console.log("  FAIL " + code + " missing: " + JSON.stringify(k).slice(0, 80)); bad++ }
        else if ((k.split("%").length !== String(S[k]).split("%").length) || (k.split("\n").length !== String(S[k]).split("\n").length) || !String(S[k]).trim()) {
            console.log("  FAIL " + code + " placeholder/newline mismatch: " + JSON.stringify(k).slice(0, 80)); bad++
        }
    }
    for (const k of Object.keys(S)) if (!required.has(k)) { console.log("  FAIL " + code + " has an unknown key: " + JSON.stringify(k).slice(0, 80)); bad++ }
    check(bad === 0, code + ": " + Object.keys(S).length + " strings")
    failures += bad
}

// the resolved Portuguese menu string, once the catalog is filled
if (ref["Play"] && ref["Play"] !== "Play") check(I18n.translate("pt_BR", "Play") === ref["Play"], "pt_BR Play is wired through translate()")

console.log(failures === 0 ? "PASS (0 failures)" : "FAIL (" + failures + " failures)")
if (failures) process.exit(1)
