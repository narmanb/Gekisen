#!/usr/bin/env python3
"""Convert every .dmi in the BYOND project into a PNG atlas + JSON metadata.

Output:
  web/assets/icons/<id>.png   one atlas per .dmi (16 frames per row)
  web/data/icons.json         {dmi_path: {id, w, h, states: {name: [dirs, frames, first, [delays], movement]}}}
"""
import json
import math
import os
import re
import sys
import zlib

from PIL import Image

sys.path.insert(0, os.path.dirname(__file__))
import legacy_dmi  # noqa: E402

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
OUT = os.path.join(ROOT, 'android-port', 'web')
COLS = 16


def modern_meta(im):
    desc = im.info.get('Description', '')
    w = h = 32
    states = []
    cur = None
    for line in desc.splitlines():
        line = line.strip()
        m = re.match(r'(\w+)\s*=\s*(.*)', line)
        if not m:
            continue
        k, v = m.group(1), m.group(2).strip()
        if k == 'width':
            w = int(v)
        elif k == 'height':
            h = int(v)
        elif k == 'state':
            cur = dict(name=v.strip('"'), dirs=1, frames=1, delay=[1], movement=0)
            states.append(cur)
        elif cur is not None:
            if k == 'dirs':
                cur['dirs'] = int(v)
            elif k == 'frames':
                cur['frames'] = int(v)
            elif k == 'delay':
                cur['delay'] = [float(x) for x in v.split(',')]
            elif k == 'movement':
                cur['movement'] = int(v)
    if not states:
        states = [dict(name='', dirs=1, frames=1, delay=[1], movement=0)]
    return w, h, states


def export_modern(path):
    im = Image.open(path).convert('RGBA')
    w, h, states = modern_meta(Image.open(path))
    per_row = max(1, im.width // w)
    frames = []
    meta = {}
    k = 0
    for st in states:
        first = len(frames)
        for _ in range(st['dirs'] * st['frames']):
            x, y = (k % per_row) * w, (k // per_row) * h
            frames.append(im.crop((x, y, x + w, y + h)))
            k += 1
        delays = st['delay'][:st['frames']] or [1]
        key = ('M:' if st['movement'] else '') + st['name']
        if key not in meta:
            meta[key] = [st['dirs'], st['frames'], first, delays, st['movement']]
    return w, h, frames, meta


def export_split(path):
    """A plain image used as an icon is split into 32x32 states named "x,y"
    (x from the left, y from the bottom), like BYOND does."""
    im = Image.open(path).convert('RGBA')
    cols, rows = (im.width + 31) // 32, (im.height + 31) // 32
    frames, meta = [], {}
    for y in range(rows):
        for x in range(cols):
            top = im.height - (y + 1) * 32
            tile = Image.new('RGBA', (32, 32))
            tile.paste(im.crop((x * 32, max(0, top), x * 32 + 32, top + 32)), (0, max(0, -top)))
            meta['%d,%d' % (x, y)] = [1, 1, len(frames), [1], 0]
            frames.append(tile)
    return 32, 32, frames, meta


def export_legacy(path):
    r = legacy_dmi.parse(open(path, 'rb').read())
    pal = r['palette']
    frames = []
    meta = {}
    for st in r['states']:
        first = len(frames)
        for px in st['images']:
            frames.append(Image.frombytes('RGBA', (32, 32), legacy_dmi.image_rgba(pal, px)))
        movement = 1 if st['flags'] & 2 else 0
        key = ('M:' if movement else '') + st['name']
        if key in meta:
            continue
        meta[key] = [st['dirs'], st['frames'], first, [max(1, st['unk'])] * st['frames'], movement]
    return 32, 32, frames, meta


def main():
    os.makedirs(os.path.join(OUT, 'assets', 'icons'), exist_ok=True)
    os.makedirs(os.path.join(OUT, 'data'), exist_ok=True)
    index = {}
    files = []
    for dp, dn, fn in os.walk(ROOT):
        if '.git' in dp or 'android-port' in dp:
            continue
        for f in fn:
            if f.lower().endswith(('.dmi', '.png', '.bmp')):
                files.append(os.path.relpath(os.path.join(dp, f), ROOT))
    files.sort()
    for i, rel in enumerate(files):
        path = os.path.join(ROOT, rel)
        head = open(path, 'rb').read(4)
        try:
            if not rel.lower().endswith('.dmi'):
                w, h, frames, meta = export_split(path)
            elif head == b'\x89PNG':
                w, h, frames, meta = export_modern(path)
            else:
                w, h, frames, meta = export_legacy(path)
        except Exception as e:  # pragma: no cover - report and skip
            print('skip', rel, e)
            continue
        if not frames:
            continue
        rows = math.ceil(len(frames) / COLS)
        atlas = Image.new('RGBA', (min(COLS, len(frames)) * w, rows * h))
        for k, fr in enumerate(frames):
            atlas.paste(fr, ((k % COLS) * w, (k // COLS) * h))
        atlas.save(os.path.join(OUT, 'assets', 'icons', '%d.png' % i), optimize=True)
        key = rel.replace('\\', '/').lower()
        index[key] = dict(id=i, w=w, h=h, states=meta)
    with open(os.path.join(OUT, 'data', 'icons.json'), 'w') as fh:
        json.dump(index, fh, separators=(',', ':'))
    print('exported', len(index), 'icon files')


if __name__ == '__main__':
    main()
