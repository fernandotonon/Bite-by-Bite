# Architecture

```
app/config/*.js      data: characters (Horde Deck), missions (levels + objectives), assets (manifest), tuning
app/scripts/Sim.js   the simulation - pure JavaScript, no Qt (tests run it in node)
app/*.qml            presentation: BiteGame (screens + clock), Level3D (View3D diorama), Hud, screens
app/src/             C++: GamepadBridge (physical controller polling)
assets/              source-images -> exported (GLB) -> rigged -> runtime (balsam QML) ; audio ; ui
scripts/             asset pipeline (generate / rig / import), audio synthesis
tests/               node rule tests (sim.test.js, data.test.js); the app itself has --autotest
```

## Data → Simulation → Presentation

* **Characters** (`characters.js`) are data. A character has an `ability.id` the simulation understands
  (`bite`, `unlock`, `sabotage`, `smash`), `traits` flags that implement passives and weaknesses
  (`quiet`, `maintenance`, `insulated`, `sturdy`, `heavyHands`, `noisy`, `clumsyTech`), speeds, noise radii and
  prose for the screens. Nothing in `Sim.js` names a character id, so a doctor or a screamer is a new entry
  plus (optionally) a new ability id / trait in the simulation.
* **Missions** (`missions.js`) are data: walls, doors (with `lockType`), props (`movable`, `hide`, `blocksSight`,
  `weak` walls), pickups, collectibles, zones (`start`, `checkpoint`, `exit`, `maintenance`), humans (guards with
  patrols, civilians with `wander`, `vulnerable`, `recruit`, `witness`), cameras, lasers, panels with `links`,
  objectives (`escape`, `capture`, `noAlert`, `collectible`, `time`) and the briefing prose. A second mission is a
  second entry; `MissionScreen` lists `Missions.missions`.
* **Sim.js** owns the match: movement and sliding collision, the squad (active zombie, followers via A* on a
  0.5 m grid, stay/follow), guard FSM (patrol → suspicious → investigate → alert → search → return), detection
  meters (distance, sneaking, traits, line of sight against sight blockers), noise events, cameras (sweeping cone,
  alarm), lasers (trip = stun + alarm), panels (clean sabotage vs. clumsy smash), doors, weak walls, pushable
  props, radio throw, hiding spots, biting (faster from behind) and recruiting, checkpoints (a JSON snapshot of the
  state; getting caught reloads it after a short flash), objectives and the rating.
  `sim.takeEvents()` hands presentation events (audio, effects, toasts) to QML.
* **BiteGame.qml** is the state machine (`screen`), runs `FrameAnimation → sim.step(dt)`, routes actions from
  `InputManager` (keyboard bindings as data + the gamepad hook) and persists results with `SaveSystem`
  (Clayground `KeyValueStore`, SQLite). `Level3D.qml` reads `sim.state` through a `stateVersion` counter bumped
  every tick, so plain bindings refresh without copying state. Vision cones are `ProceduralMesh` fans whose rays
  are cut at the first wall (`sim.rayDistance`). `Hud.qml` projects detection meters over guards with
  `View3D.mapFrom3DScene`.
* **Assets** never appear in gameplay code: `PropVisual` looks an id up in `assets.js` and shows the balsam model
  when `representation === "model"`, toon boxes (`PlaceholderShapes.js`) otherwise. Rigged characters expose
  `clip` (Idle / Walk / Run / Bite) through the patch `scripts/import-runtime.py` applies to the balsam QML.

## Persistence (`progress.v1`, `settings.v1`)

```
progress = { unlocked: ["standard", "janitor", "brute", ...captured],
             missions: { <id>: { completed, bestTime, optionals: [ids], collectibles: [ids], rating, stars, plays } } }
settings = { volume, muted, showTutorial, showCones }
```

## Adding a mission

1. Add an entry to `missions.js` (copy the hospital; keep doorways ≥ 1.5 m so the 0.5 m nav grid passes).
2. `node tests/data.test.js` checks that every referenced asset id exists.
3. Write a bot walk in `tests/sim.test.js` like the hospital's "full flow" test - it proves the level is connected.

## Adding a character

1. Add an entry to `characters.js` with `capturable: true` and an `asset` id in `assets.js`.
2. If it needs a new verb, add an ability id or trait to `Sim.js` (`perform()` / `candidates()` / `fillRate()`).
3. Put a human with `recruit: "<id>"` into a mission; the results screen and the deck pick it up from `save.progress`.
