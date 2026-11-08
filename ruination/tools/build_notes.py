#!/usr/bin/env python3
"""Legacy update notes: the original game's Updates text (Basic Commands.dm, var/const/Updates)
-> godot/data/legacy_updates.txt as BBCode for the in-game Legacy Update Notes window."""
import html
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(HERE, '..', 'source', 'DBFT Programming', 'Basic Commands', 'Basic Commands.dm')
OUT = os.path.join(HERE, '..', 'godot', 'data', 'legacy_updates.txt')

text = open(SRC, encoding='latin-1').read().replace('\r', '')
body = re.search(r'var/const/Updates\s*=\s*\{"(.*?)\n"\}', text, re.S).group(1)
# date headers are written as <font size = 4>2/2/2021<br> (sometimes with the '4>' missing)
body = re.sub(r'<font size\s*=\s*(?:\d+>)?\s*(\d{1,2}/\d{1,2}/\d{4})\s*<br>', r'\n@@DATE \1\n', body, flags=re.I)
body = re.sub(r'<title>(.*?)</title>', r'@@TITLE \1\n', body, flags=re.I)
body = re.sub(r'<br\s*/?>|<p>', '\n', body, flags=re.I)
body = re.sub(r'<b>(.*?)</b>', r'[b]\1[/b]', body, flags=re.I | re.S)
body = re.sub(r'<[^>]*>', '', body)
body = html.unescape(body).replace('[', '[lb]').replace('[lb]b]', '[b]').replace('[lb]/b]', '[/b]')
blocks, cur, title = [], None, ''
for line in body.split('\n'):
    s = line.strip()
    if not s:
        continue
    if s.startswith('@@TITLE'):
        title = s[8:]
        continue
    if s.startswith('@@DATE'):
        cur = [s[7:], []]
        blocks.append(cur)
        continue
    if cur is None:
        cur = ['', []]
        blocks.append(cur)
    cur[1].append(s)
out = ['[b]%s[/b] (from the original game)\n' % (title or 'Dragonball Ruination')]
prev = None
for date, lines in blocks:
    if (date, lines) == prev:
        continue            # the original lists a couple of updates twice
    prev = (date, lines)
    if date:
        out.append('\n[color=#ffd75e][b]%s[/b][/color]' % date)
    out.extend(lines)
open(OUT, 'w').write('\n'.join(out) + '\n')
print('legacy notes:', len(blocks), 'blocks,', sum(len(b[1]) for b in blocks), 'lines ->', OUT)
