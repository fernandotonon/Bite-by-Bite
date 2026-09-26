# Asset pipeline - QtMeshEditor → Clayground

Every 3D asset starts from one of the concept images in `docs/concept/` (ChatGPT renders, T-poses for the
characters). They are copied with a readable id into `assets/source-images/<id>.png`; everything after that is a
re-runnable command.

```
assets/source-images/<id>.png
        │  qtmesh generate3d --backend trellis2 --preset balanced --target-tris 25000 --texture-size 1024
        │                    --matting best --no-source --seed 42          scripts/generate-models.sh
        ▼                                                                   ~9-10 min per model on this Mac
assets/exported/<id>/<id>.glb  (+ .material, PBR PNGs 1024²)
        │  qtmesh rig --skeleton humanoid --skin --algo unirig ; qtmesh anim --generate idle|walk|run|punch
        ▼                                                                   scripts/rig-character.sh (humanoids)
assets/rigged/<id>/<id>_rigged.glb   clips Idle / Walk / Run / Bite
        │  scripts/trim-base.py (base slab) → balsam → runtime patch (clip API)   scripts/import-all.sh
        ▼
assets/runtime/<id>/Prop<Id>.qml  (+ meshes/*.mesh, maps/*.png, animations/*.qad)
        │  scripts/update-asset-manifest.py  (model path, unitHeight, footOffset from `qtmesh info --json`)
        ▼
app/config/assets.js  →  PropVisual   (gameplay never names a file; a missing model falls back to toon boxes)
```

## Settings used for this project

* **Preset `balanced`** (TRELLIS.2 1024 cascade) - completes on this 24 GB Apple Silicon Mac with
  QtMeshEditor 3.42.1 / trellis.cpp `build-arm64` (earlier projects had to use `fast`; `FALLBACK_PRESETS=fast`
  keeps the batch going if a cascade ever crashes and `<id>/.preset` records what each model actually got).
* **25 000 triangles, 1024 px textures** for every asset (characters and props alike).
* **Matting `best`** (BiRefNet 1024²) on the *flattened* original: TRELLIS.2 skips the remover when the input has
  alpha, so RGBA concept images are composited onto their backdrop first (`scripts/flatten-alpha.py`).
* **`--no-source`**: no `<id>_source.qtm3d` re-bake sidecar (the game never needs it, ~20 MB each).
* The laser barrier image shows two pillars with beams: only the left pillar is generated (`laser_pillar`, cropped
  in `assets/source-images/`), the game places two and draws the beams itself so they can switch off.

## What the first run produced (2026-09-26)

* `balanced` finished for all six characters and for laser_pillar, maintenance_door, locker, curtain_divider and
  hospital_building (9-16 min each). It stalled (no output for 10 min, killed by the watchdog) on the boxy props
  security_camera, electrical_panel, medical_cart, radio, brain_jar, curtain_screen, hospital_bed and
  hospital_bed_modern, which then completed with `fast` (`assets/exported/<id>/.preset` says which). To retry one:
  `rm -r assets/exported/<id> assets/runtime/<id>; SEED=7 scripts/generate-models.sh <id>; scripts/import-all.sh <id>`.
* Rigging downloads UniRig (1.3 GB) and SkinTokens (2.3 GB) on first use - the first two rigs look stuck at 0 % CPU
  while that happens; afterwards each humanoid takes about 2 minutes.
* TRELLIS keeps the concept image's 3/4 view as the model's front, so most props needed a per-asset `rotation`
  in `assets.js` (app/AssetSheet.qml renders every asset top-down with +X/+Z markers to read it off).

## Pitfalls (from the previous projects, still true)

* Do not render (clayrender, the dojo, a browser) while a generation runs: trellis-cli exits with status 15
  when anything else uses the GPU.
* Rig **after** the generation batch, one character at a time; UniRig on a 25k mesh can grow to 24 GB.
* `scripts/stall-guard.sh <batch.log> 900 &` beside every batch kills a generator whose log went quiet.
* The Bash tool shell is zsh: `=word` at the start of a word is expanded (`echo ===` fails); quote it.

## Commands

```bash
scripts/generate-models.sh                          # every source image without a GLB (long!)
scripts/generate-models.sh radio locker             # specific ids
for id in zombie_standard zombie_janitor zombie_electrician zombie_brute guard nurse; do scripts/rig-character.sh $id; done
scripts/import-all.sh                               # balsam import + manifest refresh
FORCE=1 scripts/import-all.sh guard                 # re-import after rigging
qtmesh turntable assets/exported/radio/radio.glb -o radio.png --frames 4 --size 320x320   # quick look
```

## Placeholders

* `electrician_human` - no concept image; `assets.js` aliases the zombie electrician model with a skin tint.
* `ambulance` - no concept image; toon box with a red cross (`PlaceholderShapes.js`).
* Deck portraits - drawn silhouettes in `CharacterCard.qml` until turntable renders are generated.
* Audio - synthesized cues from `scripts/gen-audio.py`.
