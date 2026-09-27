// Toon-box placeholders for every asset shape while (or if) a QtMeshEditor model is missing.
// parts(shape, height, def) -> [{ x, y, z, w, h, d, color, glow? }] in metres, origin at the bottom centre.
.pragma library

function box(x, y, z, w, h, d, color, glow) { return { x: x, y: y, z: z, w: w, h: h, d: d, color: color, glow: !!glow } }

function parts(shape, H, def) {
    var c = def.color || "#888", a = def.accent || "#333"
    switch (shape) {
    case "person": return [
        box(0, H * 0.52, 0, H * 0.32, H * 0.36, H * 0.18, c),          // torso
        box(0, H * 0.86, 0, H * 0.2, H * 0.2, H * 0.2, a),             // head
        box(-H * 0.09, H * 0.17, 0, H * 0.11, H * 0.34, H * 0.14, c),  // legs
        box(H * 0.09, H * 0.17, 0, H * 0.11, H * 0.34, H * 0.14, c),
        box(-H * 0.22, H * 0.55, 0, H * 0.08, H * 0.3, H * 0.1, a),    // arms
        box(H * 0.22, H * 0.55, 0, H * 0.08, H * 0.3, H * 0.1, a)]
    case "brute": return [
        box(0, H * 0.5, 0, H * 0.5, H * 0.4, H * 0.28, c),
        box(0, H * 0.82, 0, H * 0.22, H * 0.2, H * 0.22, a),
        box(-H * 0.13, H * 0.15, 0, H * 0.16, H * 0.3, H * 0.18, c),
        box(H * 0.13, H * 0.15, 0, H * 0.16, H * 0.3, H * 0.18, c),
        box(-H * 0.34, H * 0.5, 0, H * 0.14, H * 0.42, H * 0.16, a),
        box(H * 0.34, H * 0.5, 0, H * 0.14, H * 0.42, H * 0.16, a)]
    case "pillar": return [box(0, H * 0.08, 0, 0.5, H * 0.16, 0.5, a), box(0, H * 0.55, 0, 0.32, H * 0.8, 0.32, c), box(0, H * 0.97, 0, 0.36, H * 0.06, 0.36, a)]
    case "camera": return [box(0, H * 0.5, 0, 0.16, H, 0.16, a), box(0, H * 0.6, 0.15, 0.22, H * 0.7, 0.34, c)]
    case "panel": return [box(0, H * 0.5, 0, 0.8, H, 0.22, c), box(0, H * 0.72, 0.12, 0.5, H * 0.16, 0.04, a, true)]
    case "door": return [box(0, H * 0.5, 0, 1.0, H, 0.1, c), box(0, H * 0.06, 0.06, 1.0, H * 0.12, 0.02, a)]
    case "cart": return [box(0, H * 0.1, 0, 0.9, 0.06, 0.9, a), box(0, H * 0.5, 0, 0.9, 0.06, 0.9, c), box(0, H * 0.95, 0, 0.9, 0.06, 0.9, c),
                         box(-0.4, H * 0.5, -0.4, 0.06, H, 0.06, c), box(0.4, H * 0.5, -0.4, 0.06, H, 0.06, c), box(-0.4, H * 0.5, 0.4, 0.06, H, 0.06, c), box(0.4, H * 0.5, 0.4, 0.06, H, 0.06, c)]
    case "locker": return [box(0, H * 0.5, 0, 0.6, H, 0.9, c), box(0, H * 0.5, 0.47, 0.08, H * 0.2, 0.04, a)]
    case "jar": return [box(0, H * 0.1, 0, 0.5, H * 0.2, 0.5, c), box(0, H * 0.55, 0, 0.42, H * 0.7, 0.42, a, true), box(0, H * 0.94, 0, 0.5, H * 0.12, 0.5, c)]
    case "curtain": return [box(0, H * 0.5, 0, def.w || 1.8, H, 0.08, c), box(0, H * 0.98, 0, def.w || 1.8, 0.05, 0.1, a)]
    case "bed": return [box(0, H * 0.25, 0, 1.0, H * 0.5, 2.1, a), box(0, H * 0.62, 0, 1.0, H * 0.24, 2.1, c), box(0, H * 0.7, -0.75, 1.0, H * 0.14, 0.5, "#c9d9ee")]
    case "ambulance": return [box(0, H * 0.45, 0, 4.4, H * 0.75, 2.1, c), box(0, H * 0.9, 0, 4.4, H * 0.2, 2.1, c), box(-1.2, H * 0.6, 1.06, 0.7, 0.7, 0.03, a), box(1.2, H * 0.6, 1.06, 0.7, 0.7, 0.03, a),
                              box(0, H * 1.02, -0.4, 0.5, 0.12, 0.3, "#e63946", true), box(-1.5, 0.3, 0, 0.7, 0.6, 2.2, "#222"), box(1.5, 0.3, 0, 0.7, 0.6, 2.2, "#222")]
    case "dog": return [box(0, H * 0.55, 0, H * 0.5, H * 0.45, H * 1.1, c), box(0, H * 0.85, H * 0.65, H * 0.4, H * 0.4, H * 0.45, a),
                        box(-H * 0.18, H * 0.17, H * 0.35, H * 0.12, H * 0.34, H * 0.12, c), box(H * 0.18, H * 0.17, H * 0.35, H * 0.12, H * 0.34, H * 0.12, c),
                        box(-H * 0.18, H * 0.17, -H * 0.35, H * 0.12, H * 0.34, H * 0.12, c), box(H * 0.18, H * 0.17, -H * 0.35, H * 0.12, H * 0.34, H * 0.12, c)]
    case "food": return [box(0, H * 0.3, 0, 0.35, H * 0.6, 0.35, c), box(0, H * 0.8, 0, 0.42, H * 0.4, 0.42, a)]
    case "shutter": return [box(0, H * 0.5, 0, def.w || 3, H, 0.12, c), box(0, H * 0.06, 0, def.w || 3, H * 0.12, 0.16, a)]
    case "table": return [box(0, H * 0.72, 0, def.w || 1.4, 0.06, def.d || 1.4, c), box(0, H * 0.35, 0, 0.14, H * 0.7, 0.14, a)]
    case "gate": return [box(-0.5, H * 0.5, 0, 0.16, H, 0.5, c), box(0.5, H * 0.5, 0, 0.16, H, 0.5, c), box(0, H * 0.97, 0, 1.16, 0.08, 0.5, a)]
    case "hatch": return [box(0, H * 0.5, 0, 0.7, H, 0.08, c), box(0, H * 0.5, 0.05, 0.5, H * 0.7, 0.02, a)]
    case "building": return [box(0, H * 0.5, 0, def.w || 6, H, def.d || 4, c), box(0, H * 0.75, (def.d || 4) / 2 + 0.05, (def.w || 6) * 0.4, H * 0.5, 0.1, a)]
    case "desk": return [box(0, H * 0.5, 0, def.w || 1.4, 0.06, def.d || 0.7, c), box(-0.5, H * 0.25, 0, 0.1, H * 0.5, 0.6, a), box(0.5, H * 0.25, 0, 0.1, H * 0.5, 0.6, a), box(0.6, H * 0.85, 0, 0.5, H * 0.35, 0.05, a)]
    case "truck": return [box(0, H * 0.45, 0, 2.2, H * 0.75, 6.5, c), box(0, H * 0.9, 1.4, 2.2, H * 0.2, 2.4, a), box(-0.9, 0.3, 0, 0.5, 0.6, 6.6, "#222"), box(0.9, 0.3, 0, 0.5, 0.6, 6.6, "#222")]
    case "console": return [box(0, H * 0.4, 0, def.w || 1.8, H * 0.8, 0.7, c), box(0, H * 0.85, -0.1, (def.w || 1.8) * 0.9, H * 0.3, 0.1, a, true)]
    case "cell": return [box(0, H * 0.5, 0, 1.6, H, 1.6, a, true), box(0, H * 0.04, 0, 1.8, H * 0.08, 1.8, c), box(0, H * 0.96, 0, 1.8, H * 0.08, 1.8, c)]
    case "box": default: return [box(0, H * 0.5, 0, def.w || 0.5, H, def.d || 0.5, c)]
    }
}
