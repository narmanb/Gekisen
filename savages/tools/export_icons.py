#!/usr/bin/env python3
"""Convert every .dmi / image icon of DBZ Savages into PNG atlases for Godot.

DM finds 'file.dmi' by searching the FILE_DIR folders, so icons are keyed by their
lower-case file name.

Output (inside the Godot project):
  icons/<id>.png        atlas (cols frames per row, normally 16)
  data/icons.json       {name: {id, w, h, cols, states: {state: [dirs, frames, first, [delays], movement]}}}
"""
import json
import math
import os
import sys

from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..', '..', 'android-port', 'tools'))
import export_icons as gek  # noqa: E402  (export_modern / export_legacy / export_split)

ROOT = os.path.join(HERE, '..', 'source')
GODOT = os.path.join(HERE, '..', 'godot')
COLS = 16


def key_bmp(path):
    """BMP pictures have no transparency: the grey (192,192,192) backdrop and its dithering are
    flood-filled away from the edges and saved as a PNG with the same base name."""
    import tempfile
    from collections import deque
    im = Image.open(path).convert('RGBA')
    w, h = im.size
    px = im.load()

    def bg(c):
        return abs(c[0] - c[1]) < 12 and abs(c[1] - c[2]) < 12 and 170 <= c[0] <= 206
    q = deque([(x, y) for x in range(w) for y in (0, h - 1)] + [(x, y) for y in range(h) for x in (0, w - 1)])
    seen = set()
    while q:
        x, y = q.popleft()
        if (x, y) in seen or not (0 <= x < w and 0 <= y < h):
            continue
        seen.add((x, y))
        if not bg(px[x, y]):
            continue
        px[x, y] = (0, 0, 0, 0)
        q.extend([(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)])
    out = os.path.join(tempfile.mkdtemp(), os.path.basename(path)[:-4] + '.png')
    im.save(out)
    return out


def main():
    out_icons = os.path.join(GODOT, 'icons')
    os.makedirs(out_icons, exist_ok=True)
    os.makedirs(os.path.join(GODOT, 'data'), exist_ok=True)
    files = []
    for dp, dn, fn in os.walk(ROOT):
        dn.sort()
        for f in sorted(fn):
            if f.lower().endswith(('.dmi', '.png', '.bmp', '.jpg')):
                files.append(os.path.join(dp, f))
    index = {}
    nid = 0
    for path in files:
        key = os.path.basename(path).lower()
        if key in index:
            continue
        head = open(path, 'rb').read(4)
        try:
            if key.endswith('.bmp'):
                w, h, frames, meta = gek.export_split(key_bmp(path))
            elif not key.endswith('.dmi'):
                w, h, frames, meta = gek.export_split(path)
            elif head == b'\x89PNG':
                w, h, frames, meta = gek.export_modern(path)
            else:
                w, h, frames, meta = gek.export_legacy(path)
        except Exception as e:  # report and skip broken files
            print('skip', path, e)
            continue
        if not frames:
            continue
        cols = COLS
        while math.ceil(len(frames) / cols) * h > 8192 and cols * w < 8192:
            cols *= 2
        rows = math.ceil(len(frames) / cols)
        atlas = Image.new('RGBA', (min(cols, len(frames)) * w, rows * h))
        for k, fr in enumerate(frames):
            atlas.paste(fr, ((k % cols) * w, (k // cols) * h))
        atlas.save(os.path.join(out_icons, '%d.png' % nid), optimize=True)
        index[key] = dict(id=nid, w=w, h=h, cols=cols, states=meta)
        nid += 1
    with open(os.path.join(GODOT, 'data', 'icons.json'), 'w') as fh:
        json.dump(index, fh, separators=(',', ':'))
    print('exported', len(index), 'icons')


if __name__ == '__main__':
    main()
