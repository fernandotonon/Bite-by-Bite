#!/usr/bin/env python3
"""Synthesize the game's short cues as 16-bit mono WAV files (PLACEHOLDER audio, no external assets).
    python3 scripts/gen-audio.py            -> assets/audio/*.wav
Pure Python (wave + math): every cue is a few sine/square/noise segments with an envelope. AudioManager.qml
maps game events to these names; replace any file with a real recording of the same name to upgrade it."""
import math, os, random, struct, wave

RATE = 22050
OUT = os.path.join(os.path.dirname(__file__), "..", "assets", "audio")

def tone(freq, dur, vol=0.5, shape="sine", freq_end=None, decay=1.0):
    n = int(RATE * dur); out = []
    for i in range(n):
        t = i / RATE
        f = freq if freq_end is None else freq + (freq_end - freq) * (i / max(1, n))
        ph = 2 * math.pi * f * t
        s = math.sin(ph) if shape == "sine" else (1 if math.sin(ph) > 0 else -1) * 0.5 if shape == "square" else random.uniform(-1, 1)
        env = min(1.0, i / (RATE * 0.005)) * (1 - i / n) ** decay
        out.append(s * vol * env)
    return out

def seq(*parts): return [x for p in parts for x in p]
def mix(a, b):
    n = max(len(a), len(b)); return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0) for i in range(n)]
def silence(dur): return [0.0] * int(RATE * dur)
def wobble(freq, dur, vol=0.4, rate=6, depth=0.08):   # groany zombie vibrato
    n = int(RATE * dur); out = []
    for i in range(n):
        t = i / RATE; f = freq * (1 + depth * math.sin(2 * math.pi * rate * t))
        env = min(1.0, i / (RATE * 0.02)) * (1 - i / n)
        out.append((0.6 * math.sin(2 * math.pi * f * t) + 0.4 * (1 if math.sin(2 * math.pi * f * 0.5 * t) > 0 else -1)) * vol * env)
    return out

random.seed(11)
cues = {
    "ui_move":    tone(700, 0.03, 0.25, shape="square"),
    "ui_select":  seq(tone(620, 0.06, 0.35), tone(930, 0.10, 0.35)),
    "ui_back":    seq(tone(930, 0.06, 0.3), tone(620, 0.10, 0.3)),
    "door":       mix(tone(180, 0.18, 0.4, freq_end=90), tone(0, 0.10, 0.15, shape="noise", decay=3)),
    "locked":     seq(tone(300, 0.08, 0.35, shape="square"), silence(0.04), tone(300, 0.08, 0.35, shape="square")),
    "unlock":     seq(tone(1200, 0.04, 0.3), tone(0, 0.08, 0.2, shape="noise", decay=3), tone(900, 0.1, 0.3)),
    "pickup":     seq(tone(880, 0.05, 0.35), tone(1320, 0.08, 0.35)),
    "throw":      tone(0, 0.18, 0.25, shape="noise", decay=2),
    "land":       mix(tone(140, 0.12, 0.5, freq_end=60), tone(0, 0.08, 0.3, shape="noise", decay=2.5)),
    "radio":      seq(*[tone(f, 0.09, 0.3, shape="square") for f in (523, 659, 784, 659, 523, 784)]),
    "bite":       seq(wobble(160, 0.35, 0.5), tone(0, 0.08, 0.35, shape="noise", decay=2)),
    "recruit":    seq(wobble(220, 0.2, 0.45), tone(330, 0.12, 0.45), tone(440, 0.12, 0.45), tone(660, 0.3, 0.45)),
    "suspicious": seq(tone(520, 0.12, 0.4), tone(780, 0.18, 0.4)),
    "alert":      seq(tone(880, 0.12, 0.45, shape="square"), tone(1100, 0.22, 0.45, shape="square")),
    "alarm":      seq(tone(880, 0.12, 0.4, shape="square"), tone(660, 0.12, 0.4, shape="square"), tone(880, 0.12, 0.4, shape="square"), tone(660, 0.12, 0.4, shape="square")),
    "scream":     tone(1400, 0.45, 0.4, freq_end=900, decay=0.6),
    "laser":      mix(tone(2400, 0.25, 0.3, freq_end=1800), tone(0, 0.1, 0.2, shape="noise", decay=3)),
    "zap":        mix(tone(0, 0.22, 0.4, shape="noise", decay=1.5), tone(90, 0.22, 0.4, shape="square")),
    "sabotage":   seq(tone(700, 0.08, 0.35, freq_end=300), silence(0.05), tone(500, 0.1, 0.35, freq_end=150), silence(0.05), tone(200, 0.25, 0.35, freq_end=60)),
    "smash":      mix(tone(110, 0.3, 0.55, freq_end=40), tone(0, 0.25, 0.4, shape="noise", decay=1.8)),
    "crash":      mix(tone(70, 0.5, 0.6, freq_end=30), tone(0, 0.45, 0.5, shape="noise", decay=1.5)),
    "hide":       tone(0, 0.15, 0.2, shape="noise", decay=3),
    "checkpoint": seq(tone(659, 0.08, 0.4), tone(880, 0.08, 0.4), tone(1319, 0.2, 0.4)),
    "collect":    seq(tone(784, 0.07, 0.4), tone(988, 0.07, 0.4), tone(1175, 0.07, 0.4), tone(1568, 0.25, 0.4)),
    "caught":     seq(tone(440, 0.18, 0.5), tone(392, 0.18, 0.5), tone(311, 0.45, 0.5)),
    "switch":     seq(tone(500, 0.04, 0.3, shape="square"), tone(750, 0.06, 0.3, shape="square")),
    "command":    tone(620, 0.08, 0.3, shape="square"),
    "win":        seq(tone(523, 0.14, 0.5), tone(659, 0.14, 0.5), tone(784, 0.14, 0.5), tone(1047, 0.45, 0.5)),
    "step":       tone(0, 0.05, 0.12, shape="noise", decay=3),
}
os.makedirs(OUT, exist_ok=True)
for name, samples in cues.items():
    path = os.path.join(OUT, name + ".wav")
    with wave.open(path, "wb") as w:
        w.setnchannels(1); w.setsampwidth(2); w.setframerate(RATE)
        w.writeframes(b"".join(struct.pack("<h", int(max(-1, min(1, s)) * 32767)) for s in samples))
    print(name, round(len(samples) / RATE, 2), "s")
