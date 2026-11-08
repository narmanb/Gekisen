"""Decoder for the legacy (pre-BYOND 4.0) DMI icon format.

The format was reverse-engineered from the files in this repository:

  magic      b'\\x04DMI'
  u8         flags/version
  u16        palette size N
  N*3 bytes  palette, stored R,B,G. Colour 0 is the transparent mask colour (c0c0c0).
  u16        number of icon states
  per state:
    u16 dirs, u16 frames, u16 unknown
    u8  state flags (2 = movement state)
    u16 name length (including NUL) + name bytes
    dirs*frames images, frame-major (frame0: dir S,N,E,W, frame1: ...):
      u16 image id, u16 ref flag. ref flag != 0 means "reuse image <id>"
      (2 = mirrored horizontally, 1 = as-is) and no pixel data follows.
      u16 run count L
      if L > 0: L bytes of run lengths (each byte is one run), then the run
                colours: ceil(L/8)*bits bytes, LSB-first packed `bits`-wide codes
      if L == 0: raw image: 1024 codes packed the same way (1024/8*bits bytes)
  trailer (per-state animation delays, not fully decoded)

bits = ceil(log2(N)) (minimum 1).  Images are 32x32, rows top to bottom.
"""
import math

W = H = 32


def u16(d, p):
    return d[p] | (d[p + 1] << 8)


def _codes(buf, count, bits):
    v = int.from_bytes(buf, 'little')
    mask = (1 << bits) - 1
    return [(v >> (bits * k)) & mask for k in range(count)]


def parse(data):
    d = data
    if d[:4] != b'\x04DMI':
        raise ValueError('not a legacy DMI')
    n = u16(d, 5)
    p = 7
    # palette entries are stored as R, B, G
    pal = [(d[p + 3 * i], d[p + 3 * i + 2], d[p + 3 * i + 1]) for i in range(n)]
    p += 3 * n
    bits = max(1, math.ceil(math.log2(n))) if n > 1 else 1
    ns = u16(d, p)
    p += 2
    states = []
    byid = {}
    for _ in range(ns):
        dirs, frames, unk = u16(d, p), u16(d, p + 2), u16(d, p + 4)
        p += 6
        flags = d[p]
        p += 1
        ln = u16(d, p)
        p += 2
        name = d[p:p + ln].split(b'\0')[0].decode('latin-1')
        p += ln
        imgs = []
        for k in range(dirs * frames):
            iid, xf = u16(d, p), u16(d, p + 2)
            p += 4
            if xf:
                imgs.append(('ref', iid, xf))
                continue
            L = u16(d, p)
            p += 2
            if L == 0:
                nb = (W * H // 8) * bits
                px = _codes(d[p:p + nb], W * H, bits)
                p += nb
            else:
                runs = d[p:p + L]
                p += L
                nb = math.ceil(L / 8) * bits
                cols = _codes(d[p:p + nb], L, bits)
                p += nb
                px = []
                for r, c in zip(runs, cols):
                    px.extend([c] * r)
                if len(px) != W * H:
                    raise ValueError('bad run total %d' % len(px))
            byid[iid] = px
            imgs.append(px)
        states.append(dict(name=name, dirs=dirs, frames=frames, flags=flags,
                           unk=unk, images=imgs))
    for st in states:
        st['refs'] = [(k, im[1], im[2]) for k, im in enumerate(st['images']) if isinstance(im, tuple)]
        st['images'] = [(_mirror(byid[im[1]]) if im[2] == 2 else byid[im[1]])
                        if isinstance(im, tuple) else im for im in st['images']]
    return dict(palette=pal, bits=bits, states=states, trailer=d[p:])


def _mirror(px):
    return [px[y * W + (W - 1 - x)] for y in range(H) for x in range(W)]


def image_rgba(pal, px):
    """Return RGBA bytes for one image. Palette index 0 is transparent."""
    out = bytearray(W * H * 4)
    for i, c in enumerate(px):
        if c == 0 or c >= len(pal):
            continue
        r, g, b = pal[c]
        out[i * 4:i * 4 + 4] = bytes((r, g, b, 255))
    return bytes(out)
