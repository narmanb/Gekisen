#!/usr/bin/env python3
"""Sprites drawn for this port (not in the original game) -> godot/icons/<id>.png + icons.json.
Run after export_icons.py, which rewrites icons.json.

doublesunday.dmi: Raditz's Double Sunday. A thinner yellow beam than Final Flash with a small
glowing orb head, so the two beams he fires side by side read as two separate beams.
States 'doublesunday' (head) and 'doublesundayt' (trail), 4 directions (S, N, E, W)."""
import json
import os
from PIL import Image, ImageDraw

HERE = os.path.dirname(os.path.abspath(__file__))
GODOT = os.path.join(HERE, '..', 'godot')
ICONS = os.path.join(GODOT, 'data', 'icons.json')

ORANGE = (255, 140, 20, 255)
YELLOW = (255, 225, 50, 255)
PALE = (255, 252, 200, 255)
WHITE = (255, 255, 255, 255)


def trail_east():
    im = Image.new('RGBA', (32, 32), (0, 0, 0, 0))
    d = ImageDraw.Draw(im)
    d.rectangle([0, 13, 31, 19], fill=ORANGE)
    d.rectangle([0, 14, 31, 18], fill=YELLOW)
    d.rectangle([0, 15, 31, 17], fill=PALE)
    d.line([0, 16, 31, 16], fill=WHITE)
    return im


def head_east():
    im = Image.new('RGBA', (32, 32), (0, 0, 0, 0))
    d = ImageDraw.Draw(im)
    d.rectangle([0, 13, 20, 19], fill=ORANGE)       # the beam behind the orb
    d.rectangle([0, 14, 20, 18], fill=YELLOW)
    d.rectangle([0, 15, 20, 17], fill=PALE)
    for x, y in ((27, 11), (28, 16), (27, 21), (25, 8), (25, 24)):   # crackle in front
        d.line([22, 16, x, y], fill=YELLOW)
    d.ellipse([15, 9, 29, 23], fill=ORANGE)
    d.ellipse([16, 10, 28, 22], fill=YELLOW)
    d.ellipse([18, 12, 26, 20], fill=PALE)
    d.ellipse([20, 14, 24, 18], fill=WHITE)
    return im


def four_dirs(east):
    # BYOND order: south, north, east, west
    return [east.rotate(-90), east.rotate(90), east, east.transpose(Image.FLIP_LEFT_RIGHT)]


def main():
    icons = json.load(open(ICONS))
    name = 'doublesunday.dmi'
    iid = icons[name]['id'] if name in icons else max(v['id'] for v in icons.values()) + 1
    frames = four_dirs(head_east()) + four_dirs(trail_east())
    sheet = Image.new('RGBA', (32 * 16, 32), (0, 0, 0, 0))
    for i, f in enumerate(frames):
        sheet.paste(f, (i * 32, 0))
    sheet.save(os.path.join(GODOT, 'icons', '%d.png' % iid))
    icons[name] = {'id': iid, 'w': 32, 'h': 32, 'cols': 16,
                   'states': {'doublesunday': [4, 1, 0, [1], 0], 'doublesundayt': [4, 1, 4, [1], 0]}}
    json.dump(icons, open(ICONS, 'w'), separators=(',', ':'))
    print('custom sprites:', name, 'id', iid)


if __name__ == '__main__':
    main()
