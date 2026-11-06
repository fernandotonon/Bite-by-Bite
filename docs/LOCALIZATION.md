# Localization

Strings in the code and the mission data are the English source text and double as translation keys.
A language file (`app/i18n/<code>.js`, e.g. `pt_br.js`) maps those exact strings to another language;
anything missing shows in English. `app/i18n/lang.js` is the service, `app/Lang.qml` is what the screens call
(`Lang.tr`, `Lang.fmt`). The simulation keeps English text so the node tests can match it; the HUD translates
at display time. Format strings carry `.fmt` and `.args`: the format is translated, then `%s` and `%d` are filled.
String arguments (ability names, door labels, character names) are translated before they are filled in.

## Which language is used (first match wins)
1. The player's choice in game (title / pause menu Language dropdown), unless Auto.
2. The QtMesh Games launcher: `QTMESH_LANG` for a native build, or `qtmesh_lang` on the web build
   (the loading page turns that into `--lang=` and into `QTMESH_LANG` for the wasm module).
   `pt_BR`, `pt-BR` and `pt` all work. The launcher only sends a language the game lists in its manifest.
3. The device / OS language (`Qt.locale().name`).
4. English.

`--lang=de` forces a language when the launcher variable is empty, which is how the web build and local runs
pass it. The loading page (it runs before Qt) uses `qtmesh_lang`, then the browser language, then English.

Auto is shown as `Auto · Deutsch` (the Auto prefix is not translated). Language names are the name of each
language in itself and are never translated.

## Current languages
English, Português (Brasil), Deutsch, Русский, Français, Polski, Türkçe, Español, Italiano.
The same list is on the QtMesh Games manifest (`languages`) so the launcher can set the language,
including the store tagline, the description, and the three Bite by Bite achievements.

DejaVu Sans (regular and bold) is the UI font so Cyrillic and Turkish glyphs render. It has no CJK glyphs.

## Writing code
* Show a literal with `Lang.tr("Play")`. The English text is the key.
* Formatted text: `Lang.fmt("%d zombies", [n])` (translate the format, then fill).
* Mission and character strings are translated where they are drawn (`Lang.tr(mission.title)`).
* A binding only refreshes on a language change if it reads `Lang.rev`. `tr()` and `fmt()` do that.
* Keep WASD, E, F, Q, Tab, H, Esc, Shift, Ctrl, R, and the `%s` / `%d` counts identical to the English key.

## Adding a language
1. Copy `app/i18n/pt_br.js` to `app/i18n/<code>.js`, translate the values (keep `%d`, `%s` and line breaks).
2. Add the code to `ORDER` and `LANGS` in `app/i18n/lang.js`, and import the file.
3. Add the launcher locale (`pt-BR`, not `pt_BR`) to `languages` in the QtMesh Games manifest, plus tagline,
   description and achievement translations.
4. `node tests/lang.test.js` (every key present, no extras, placeholders and line breaks match).

Translations were machine-written and should be reviewed by native speakers before release.
