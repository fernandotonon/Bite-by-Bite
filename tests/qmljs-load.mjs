// Load a `.pragma library` QML JavaScript file into node and return its top-level `var`s.
// `.import "other.js" as Name` lines are resolved relative to the file (the way QML does it) and the loaded
// library is passed in under that name, so config files can build on each other.
import { readFileSync } from "node:fs"
import { dirname, resolve } from "node:path"
const cache = new Map()
export function loadQmlJs(path) {
    const abs = resolve(path)
    if (cache.has(abs)) return cache.get(abs)
    let src = readFileSync(abs, "utf8").replace(/^\s*\.pragma library\s*$/m, "")
    const imports = [...src.matchAll(/^\s*\.import\s+"([^"]+)"\s+as\s+([A-Za-z_$][\w$]*)\s*$/gm)].map(m => ({ file: m[1], name: m[2] }))
    src = src.replace(/^\s*\.import .*$/gm, "")
    const names = [...src.matchAll(/^(?:var|function)\s+([A-Za-z_$][\w$]*)/gm)].map(m => m[1])
    const fn = new Function(...imports.map(i => i.name), src + "\nreturn {" + [...new Set(names)].join(",") + "};")
    const result = fn(...imports.map(i => loadQmlJs(resolve(dirname(abs), i.file))))
    cache.set(abs, result)
    return result
}
