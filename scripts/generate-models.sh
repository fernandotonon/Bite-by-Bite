#!/usr/bin/env bash
# Bite by Bite - QtMeshEditor: concept image -> game-ready static GLB (TRELLIS.2 backend).
#
#   scripts/generate-models.sh                        # every assets/source-images/*.png without a model
#   scripts/generate-models.sh zombie_standard radio  # only these ids
#   PRESET=fast scripts/generate-models.sh locker     # another TRELLIS preset (default: balanced, 1024 cascade)
#   FALLBACK_PRESETS=fast scripts/generate-models.sh  # retry with `fast` when the balanced cascade fails
#
# Settings for this project (all assets, characters and props alike):
#   --preset balanced (1024 cascade)  --target-tris 25000  --texture-size 1024  --matting best  --no-source
# `--matting best` runs the original image through QtMeshEditor's high-quality background remover
# (BiRefNet 1024²); TRELLIS.2 skips matting when the input already has alpha, so RGBA concept images are
# flattened onto their backdrop first (scripts/flatten-alpha.py). `--no-source` skips the ~20 MB
# <id>_source.qtm3d re-bake sidecar, which the game never needs.
# Output per model: assets/exported/<id>/<id>.glb + .material + PBR PNGs. Logs: assets/qtmesh-projects/logs/.
set -uo pipefail
cd "$(dirname "$0")/.."
export QTMESH_NO_TELEMETRY=1
export QTMESH_TRELLIS2_CLI="${QTMESH_TRELLIS2_CLI:-$HOME/trellis.cpp/build-arm64/trellis-cli}"
export QTMESH_TRELLIS2_CLI_MODELS="${QTMESH_TRELLIS2_CLI_MODELS:-$HOME/trellis.cpp/models}"
Q="${QTMESH:-/opt/homebrew/bin/qtmesh}"
WATCHDOG_MIN="${WATCHDOG_MIN:-40}"
STALL_SEC="${STALL_SEC:-600}"
FALLBACK_PRESETS="${FALLBACK_PRESETS-}"
PRESET="${PRESET:-balanced}"
TRIS="${TRIS:-25000}"
TEXSIZE="${TEXSIZE:-1024}"
OUT_ROOT="${OUT_ROOT:-assets/exported}"
MATTING="${MATTING:-best}"
echo "using $Q ($($Q --version 2>/dev/null | head -1)), trellis-cli $QTMESH_TRELLIS2_CLI, preset $PRESET, tris $TRIS, tex $TEXSIZE, matting $MATTING, out $OUT_ROOT"

mkdir -p "$OUT_ROOT" assets/qtmesh-projects/{logs,matted,flat}
if [ $# -gt 0 ]; then ids=("$@"); else
    ids=(); for f in assets/source-images/*.png; do ids+=("$(basename "${f%.png}")"); done
fi

run_with_watchdog() {
    local minutes="$1" logfile="$2"; shift 2
    "$@" &
    local pid=$!
    local waited=0 quiet=0 last_size=-1
    while kill -0 "$pid" 2>/dev/null; do
        sleep 10; waited=$((waited + 10))
        local size; size=$(stat -f %z "$logfile" 2>/dev/null || echo 0)
        if [ "$size" = "$last_size" ]; then quiet=$((quiet + 10)); else quiet=0; last_size="$size"; fi
        if [ $quiet -ge "$STALL_SEC" ] || [ $waited -ge $((minutes * 60)) ]; then
            echo "watchdog: no output for ${quiet}s (ran ${waited}s), killing generate3d" >&2
            kill "$pid" 2>/dev/null; sleep 2; kill -9 "$pid" 2>/dev/null
            pkill -f "trellis-cli" 2>/dev/null
            return 124
        fi
    done
    wait "$pid"; return $?
}

has_alpha_matte() {  # RGBA image whose border is transparent
    python3 - "$1" <<'PY'
import sys; from PIL import Image
im = Image.open(sys.argv[1])
if im.mode != "RGBA": sys.exit(1)
a = im.getchannel("A"); w, h = im.size
border = [a.getpixel((x, y)) for x in range(0, w, 8) for y in (0, h - 1)] + [a.getpixel((x, y)) for y in range(0, h, 8) for x in (0, w - 1)]
sys.exit(0 if max(border) < 40 else 1)
PY
}

for id in "${ids[@]}"; do
    img="assets/source-images/$id.png"
    dir="$OUT_ROOT/$id"; out="$dir/$id.glb"; log="assets/qtmesh-projects/logs/$id.log"
    [ -f "$img" ] || { echo "SKIP $id (no image)"; continue; }
    [ -s "$out" ] && { echo "SKIP $id (exists)"; continue; }
    mkdir -p "$dir"; S=$(date +%s)
    mattflag=""
    if [ "$MATTING" = "best" ]; then
        input="assets/qtmesh-projects/flat/$id.png"
        python3 scripts/flatten-alpha.py "$img" "$input" >> "$log" 2>&1
        mattflag="--matting best"; echo "$id: BiRefNet matting of the flattened original" >> "$log"
    elif has_alpha_matte "$img"; then
        input="$img"; echo "$id: source already matted (RGBA)" >> "$log"
    else
        input="assets/qtmesh-projects/matted/$id.png"
        python3 scripts/prematte.py "$img" "$input" >> "$log" 2>&1
    fi
    rc=1
    for preset in "$PRESET" $FALLBACK_PRESETS; do
        echo "== $id: preset $preset, $TRIS tris, ${TEXSIZE}px ($(date '+%H:%M:%S'))" | tee -a "$log"
        run_with_watchdog "$WATCHDOG_MIN" "$log" "$Q" generate3d "$input" -o "$out" --backend trellis2 --preset "$preset" \
            --target-tris "$TRIS" --texture-size "$TEXSIZE" $mattflag --no-source --seed "${SEED:-42}" >> "$log" 2>&1
        rc=$?
        [ $rc -eq 0 ] && [ -s "$out" ] && { echo "$preset" > "$dir/.preset"; break; }
        echo "-- $id: preset $preset failed (rc=$rc)" | tee -a "$log"
        rm -f "$out"
    done
    if [ $rc -eq 0 ] && [ -s "$out" ]; then
        rm -f "$dir/${id}_source.qtm3d"
        python3 scripts/resize-textures.py "$dir" "$TEXSIZE" >> "$log" 2>&1
        echo "OK   $id $(( $(date +%s) - S ))s preset=$(cat "$dir/.preset") tris=$TRIS tex=$TEXSIZE"
    else
        echo "FAIL $id rc=$rc (see $log)"; rmdir "$dir" 2>/dev/null
    fi
done
