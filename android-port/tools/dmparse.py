#!/usr/bin/env python3
"""Minimal DM (BYOND) object-tree parser.

It understands enough of DM's indentation based syntax to recover, for every
type path, the variables it declares/overrides and the raw text of its procs
and verbs.  Inheritance is resolved by `resolve()`.
"""
import os
import re

KEYWORDS = {'if', 'else', 'for', 'while', 'switch', 'return', 'spawn', 'do',
            'goto', 'del', 'sleep', 'break', 'continue', 'set'}


def strip_comments(src):
    out = []
    i, n = 0, len(src)
    in_str = None
    depth = 0
    while i < n:
        c = src[i]
        if in_str:
            out.append(c)
            if c == '\\' and i + 1 < n:
                out.append(src[i + 1])
                i += 2
                continue
            if in_str == '{"' and src.startswith('"}', i):
                out.append('}')
                i += 2
                in_str = None
                continue
            if in_str in ('"', "'") and c == in_str:
                in_str = None
            elif in_str in ('"', "'") and c == '\n':
                in_str = None
            i += 1
            continue
        if src.startswith('/*', i):
            depth = 1
            i += 2
            while i < n and depth:
                if src.startswith('/*', i):
                    depth += 1
                    i += 2
                elif src.startswith('*/', i):
                    depth -= 1
                    i += 2
                else:
                    if src[i] == '\n':
                        out.append('\n')
                    i += 1
            continue
        if src.startswith('//', i):
            while i < n and src[i] != '\n':
                i += 1
            continue
        if src.startswith('{"', i):
            in_str = '{"'
            out.append('{"')
            i += 2
            continue
        if c in '"\'':
            in_str = c
        out.append(c)
        i += 1
    return ''.join(out)


def logical_lines(src):
    src = strip_comments(src.replace('\r\n', '\n').replace('\r', '\n'))
    # join continuation lines and multi-line {" "} strings
    lines = []
    buf = ''
    for raw in src.split('\n'):
        if buf:
            buf += ' ' + raw.strip()
        else:
            buf = raw
        if buf.count('{"') > buf.count('"}'):
            continue
        if buf.rstrip().endswith('\\'):
            buf = buf.rstrip()[:-1]
            continue
        lines.append(buf.rstrip())
        buf = ''
    if buf:
        lines.append(buf)
    return lines


def indent_of(line):
    n = 0
    for ch in line:
        if ch == '\t':
            n += 1
        elif ch == ' ':
            n += 0.25  # four spaces ~ one tab
        else:
            break
    return n


PATH_RE = re.compile(r'^/?[A-Za-z_][\w]*(/[A-Za-z_][\w]*)*/?$')


class Type:
    def __init__(self, path):
        self.path = path
        self.vars = {}
        self.procs = {}

    def __repr__(self):
        return 'Type(%s)' % self.path


class Tree:
    def __init__(self):
        self.types = {}

    def get(self, path):
        path = '/' + path.strip('/')
        if path not in self.types:
            self.types[path] = Type(path)
        return self.types[path]

    def parent_of(self, path):
        if path in ('/datum', '/'):
            return None
        defaults = {'/atom': '/datum', '/atom/movable': '/atom', '/turf': '/atom',
                    '/area': '/atom', '/obj': '/atom/movable', '/mob': '/atom/movable'}
        if path in defaults:
            return defaults[path]
        t = self.types.get(path)
        if t and 'parent_type' in t.vars:
            return '/' + t.vars['parent_type'].strip('/')
        p = path.rsplit('/', 1)[0]
        return p or '/datum'

    def chain(self, path):
        out = []
        p = path
        seen = set()
        while p and p not in seen:
            seen.add(p)
            out.append(p)
            p = self.parent_of(p)
        return out

    def resolve(self, path):
        vals = {}
        for p in reversed(self.chain(path)):
            t = self.types.get(p)
            if t:
                vals.update(t.vars)
        return vals

    def find_proc(self, path, name):
        for p in self.chain(path):
            t = self.types.get(p)
            if t and name in t.procs:
                return p, t.procs[name]
        return None, None

    def parse_file(self, filename):
        src = open(filename, encoding='latin-1').read()
        lines = logical_lines(src)
        # stack of (indent, kind, path) kind: type|var|code
        stack = []
        i = 0
        while i < len(lines):
            line = lines[i]
            s = line.strip()
            if not s or s.startswith('#'):
                i += 1
                continue
            ind = indent_of(line)
            while stack and stack[-1][0] >= ind:
                stack.pop()
            ctx = stack[-1] if stack else (-1, 'type', '')
            kind, cur = ctx[1], ctx[2]
            if kind == 'code':
                i += 1
                continue
            if kind == 'var':
                self._var_decl(cur, s)
                i += 1
                continue
            # type context
            m = re.match(r'^(.*?)\s*\((.*)\)\s*(set .*)?$', s)
            if m and PATH_RE.match(m.group(1).strip() or '-') and '=' not in m.group(1):
                # proc/verb definition: collect its body
                full = self._join(cur, m.group(1).strip())
                parts = full.strip('/').split('/')
                pname = parts[-1]
                owner = []
                for p in parts[:-1]:
                    if p in ('proc', 'verb'):
                        continue
                    owner.append(p)
                body = []
                j = i + 1
                while j < len(lines):
                    ln = lines[j]
                    if ln.strip() and indent_of(ln) <= ind:
                        break
                    body.append(ln)
                    j += 1
                is_verb = '/verb/' in '/' + full + '/' or (cur.split('/')[-1:] == ['verb'])
                self.get('/'.join(owner)).procs[pname] = dict(args=m.group(2), body='\n'.join(body),
                                                               verb=is_verb, line=s)
                stack.append((ind, 'code', full))
                i = j
                continue
            if '=' in s and not s.startswith('var/') and not re.match(r'^[\w/]+\s*$', s):
                lhs, rhs = s.split('=', 1)
                lhs = lhs.strip()
                if lhs.startswith('var/'):
                    lhs = lhs.split('/')[-1]
                if re.match(r'^[\w/]+$', lhs):
                    if '/' in lhs:
                        # path/var = value  (e.g. mob/icon = 'x.dmi')
                        tpath, vname = lhs.rsplit('/', 1)
                        self.get(self._join(cur, tpath)).vars[vname] = rhs.strip()
                    else:
                        self.get(cur or '/').vars[lhs] = rhs.strip()
                i += 1
                continue
            if s.startswith('var/') or s == 'var' or '/var/' in s or s.endswith('/var'):
                if s == 'var' or s.endswith('/var'):
                    base = s[:-3].rstrip('/') if s != 'var' else ''
                    stack.append((ind, 'var', self._join(cur, base) if base else cur))
                else:
                    pre, decl = s.split('var/', 1)
                    owner = self._join(cur, pre.rstrip('/')) if pre else cur
                    self._var_decl(owner, decl)
                i += 1
                continue
            if PATH_RE.match(s):
                first = s.strip('/').split('/')[0]
                if first in KEYWORDS:
                    i += 1
                    continue
                full = self._join(cur, s)
                if s.strip('/').split('/')[-1] in ('verb', 'proc'):
                    stack.append((ind, 'type', full))
                    i += 1
                    continue
                self.get(full)
                stack.append((ind, 'type', full))
                i += 1
                continue
            i += 1

    def _join(self, cur, s):
        if s.startswith('/'):
            return '/' + s.strip('/')
        clean = [p for p in cur.strip('/').split('/') if p and p not in ('verb', 'proc')]
        if '/'.join(cur.strip('/').split('/')[-1:]) in ('verb', 'proc'):
            return '/' + '/'.join(cur.strip('/').split('/') + s.strip('/').split('/'))
        return '/' + '/'.join(clean + s.strip('/').split('/'))

    def _var_decl(self, owner, decl):
        decl = decl.strip()
        if '=' in decl:
            lhs, rhs = decl.split('=', 1)
            name = lhs.strip().split('/')[-1].split(' ')[0]
            val = rhs.strip()
        else:
            name = decl.split('/')[-1].split(' ')[0]
            val = 'null'
        name = re.sub(r'\[.*', '', name)
        if re.match(r'^\w+$', name):
            t = self.get(owner or '/')
            if name not in t.vars or val != 'null':
                t.vars[name] = val


def load(root):
    tree = Tree()
    for fn in sorted(os.listdir(root)):
        if fn.endswith('.dm'):
            tree.parse_file(os.path.join(root, fn))
    return tree


def literal(v):
    """Convert a DM literal to a python value (best effort)."""
    if v is None:
        return None
    v = v.strip()
    if v == 'null':
        return None
    if re.match(r"^'[^']*'$", v):
        return {'icon': v[1:-1]}
    if re.match(r'^"[^"\[]*"$', v):
        return v[1:-1]
    if v.startswith('{"') and v.endswith('"}'):
        return v[2:-2]
    try:
        if re.match(r'^-?\d+$', v):
            return int(v)
        return float(v)
    except ValueError:
        pass
    m = re.match(r'^(NORTH|SOUTH|EAST|WEST|NORTHEAST|NORTHWEST|SOUTHEAST|SOUTHWEST)$', v)
    if m:
        return {'NORTH': 1, 'SOUTH': 2, 'EAST': 4, 'WEST': 8, 'NORTHEAST': 5, 'NORTHWEST': 9,
                'SOUTHEAST': 6, 'SOUTHWEST': 10}[v]
    m = re.match(r'^(MOB|OBJ|TURF|AREA|FLY)_LAYER(\s*[-+]\s*\d+)?$', v)
    if m:
        base = {'AREA': 1, 'TURF': 2, 'OBJ': 3, 'MOB': 4, 'FLY': 5}[m.group(1)]
        off = int(m.group(2).replace(' ', '')) if m.group(2) else 0
        return base + off
    try:
        return eval(v, {'__builtins__': {}}, {})  # simple arithmetic like 1e6 or 10*5
    except Exception:
        return {'expr': v}


if __name__ == '__main__':
    import sys
    t = load(sys.argv[1] if len(sys.argv) > 1 else '.')
    print(len(t.types), 'types')
    for p in sys.argv[2:]:
        print(p, t.resolve(p))
