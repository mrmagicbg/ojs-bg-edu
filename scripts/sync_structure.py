#!/usr/bin/env python3
import os
import re
from pathlib import Path

repo_root = Path(__file__).resolve().parents[1]
en_dir = repo_root / 'docs' / 'en'
bg_dir = repo_root / 'docs' / 'bg'

md_files = list(en_dir.rglob('*.md'))
modified = []

heading_re = re.compile(r'^(#{1,6}\s+.*)$')


def get_top_block(lines):
    # return list of lines that are the top consecutive block starting with '>'
    out = []
    for ln in lines:
        if ln.lstrip().startswith('>'):
            out.append(ln)
        elif not ln.strip():
            # If blank line after top block, include it and stop
            if out:
                out.append(ln)
                break
            else:
                # skip leading blank lines
                continue
        else:
            break
    return out


def get_last_block(lines):
    # return consecutive block of lines starting with '>' from the end
    out = []
    i = len(lines)-1
    while i >= 0 and not lines[i].strip():
        i -= 1
    # now collect consecutive '>' lines from i backwards
    j = i
    while j >= 0 and lines[j].lstrip().startswith('>'):
        j -= 1
    if j < i:
        return lines[j+1:i+1]
    return []


def extract_code_blocks_by_heading(lines):
    blocks = {}  # heading -> list of (start_idx, end_idx, text)
    heading = '<root>'
    i = 0
    n = len(lines)
    while i < n:
        m = heading_re.match(lines[i])
        if m:
            heading = m.group(1).strip()
            i += 1
            continue
        if lines[i].lstrip().startswith('```'):
            start = i
            fence = lines[i].rstrip('\n')
            i += 1
            while i < n and not lines[i].lstrip().startswith('```'):
                i += 1
            # include the closing fence if present
            if i < n:
                end = i
            else:
                end = n-1
            text = ''.join(lines[start:end+1])
            blocks.setdefault(heading, []).append((start, end, text))
            i = end + 1
            continue
        i += 1
    return blocks


def replace_top_block(bg_lines, en_top):
    # remove existing top block from bg_lines and prepend en_top
    i = 0
    n = len(bg_lines)
    while i < n and bg_lines[i].lstrip().startswith('>') or (i < n and not bg_lines[i].strip() and i==0):
        i += 1
    # if there was a top block, skip its trailing blank
    new = []
    new.extend(en_top)
    # if en_top did not end with a blank line, ensure separation
    if not en_top or (en_top and en_top[-1].strip()):
        new.append('\n')
    new.extend(bg_lines[i:])
    return new


def replace_last_block(bg_lines, en_last):
    # replace last consecutive '>' block near end
    n = len(bg_lines)
    i = n - 1
    while i >= 0 and not bg_lines[i].strip():
        i -= 1
    if i < 0:
        # empty file
        return bg_lines
    # find start j of consecutive > lines up from i
    j = i
    while j >= 0 and bg_lines[j].lstrip().startswith('>'):
        j -= 1
    if j == i:
        # no trailing > block
        return bg_lines
    new = bg_lines[:j+1]
    new.extend(en_last)
    new.append('\n')
    return new


for en_path in md_files:
    rel = en_path.relative_to(en_dir)
    bg_path = bg_dir / rel
    if not bg_path.exists():
        continue
    en_lines = en_path.read_text(encoding='utf-8').splitlines(keepends=True)
    bg_lines = bg_path.read_text(encoding='utf-8').splitlines(keepends=True)

    changed = False

    # 1) replace top navigation block
    en_top = get_top_block(en_lines)
    if en_top:
        # compare with bg top
        bg_top = get_top_block(bg_lines)
        if en_top != bg_top:
            bg_lines = replace_top_block(bg_lines, en_top)
            changed = True

    # 2) replace last navigation/footer block
    en_last = get_last_block(en_lines)
    if en_last:
        bg_last = get_last_block(bg_lines)
        if en_last != bg_last:
            bg_lines = replace_last_block(bg_lines, en_last)
            changed = True

    # 3) sync code blocks under matching headings
    en_blocks = extract_code_blocks_by_heading(en_lines)
    bg_blocks = extract_code_blocks_by_heading(bg_lines)

    # build a map of heading -> iterator of en block texts
    en_block_texts = {h: [b[2] for b in lst] for h, lst in en_blocks.items()}
    used_counters = {h: 0 for h in en_block_texts}

    # Rebuild bg_lines replacing blocks when heading exists in en
    out_lines = []
    i = 0
    n = len(bg_lines)
    current_heading = '<root>'
    while i < n:
        m = heading_re.match(bg_lines[i])
        if m:
            current_heading = m.group(1).strip()
            out_lines.append(bg_lines[i])
            i += 1
            continue
        if bg_lines[i].lstrip().startswith('```'):
            # find end of this bg block
            start = i
            i += 1
            while i < n and not bg_lines[i].lstrip().startswith('```'):
                i += 1
            if i < n:
                end = i
            else:
                end = n-1
            # replace if en has block(s) for this heading
            if current_heading in en_block_texts and used_counters.get(current_heading, 0) < len(en_block_texts[current_heading]):
                repl = en_block_texts[current_heading][used_counters[current_heading]]
                out_lines.append(repl)
                used_counters[current_heading] += 1
            else:
                # keep original bg block
                out_lines.extend(bg_lines[start:end+1])
            i = end + 1
            continue
        # normal line
        out_lines.append(bg_lines[i])
        i += 1

    if out_lines != bg_lines:
        bg_path.write_text(''.join(out_lines), encoding='utf-8')
        modified.append(str(rel))

if modified:
    print('Modified BG files:')
    for m in modified:
        print('- ' + m)
else:
    print('No BG files modified (structural parity already satisfied).')

# exit
