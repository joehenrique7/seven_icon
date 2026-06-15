#!/usr/bin/env python3
"""Gera a icon font do seven_icon a partir de um export do Iconsax.

Suporta os dois tipos de export:
  * Font  -> zip com iconsax.ttf + iconsax.css (codepoints vêm do CSS)
  * SVG   -> zip com vários .svg de traçado (stroke); a fonte é gerada aqui
             rasterizando + vetorizando (Skia + potrace) e montando com fantasticon.

Faz o trabalho determinístico:
  - descompacta o zip
  - constrói/instala assets/fonts/iconsax.ttf
  - gera lib/src/seven_icons.dart (camelCase + codepoints na PUA BMP)
  - imprime um resumo JSON (total, novos, lista) para o restante do fluxo

Dependências: python3 (skia-python, numpy), potrace, npx fantasticon (só p/ SVG).
Uso:
    python3 build_font.py --zip assets/fonts/<arquivo>.zip --repo <raiz_do_pacote>
"""
import argparse, glob, json, os, re, shutil, subprocess, sys, tempfile, zipfile

SZ = 1024            # resolução de rasterização para o traçado (24un -> 1024px)
NUM = re.compile(r'[-+]?[0-9]*\.?[0-9]+')
DIGIT = {'0': 'zero', '1': 'one', '2': 'two', '3': 'three', '4': 'four',
         '5': 'five', '6': 'six', '7': 'seven', '8': 'eight', '9': 'nine'}


# ---------------------------------------------------------------- nomes / dart
def camel(kebab):
    parts = kebab.split('-')
    if parts[0].isdigit():
        parts[0] = DIGIT[parts[0][0]] + parts[0][1:]
    return parts[0] + ''.join(p[:1].upper() + p[1:] for p in parts[1:])


def old_names(repo):
    f = os.path.join(repo, 'lib/src/seven_icons.dart')
    names = set()
    if os.path.exists(f):
        for line in open(f, encoding='utf-8'):
            m = re.search(r'IconData (\w+) =', line)
            if m:
                names.add(m.group(1).lower())
    return names


def write_dart(repo, cp):
    lines = [f"  static const IconData {n} = IconData(0x{cp[n]:X}, "
             f"fontFamily: fontFamily, fontPackage: fontPackage);"
             for n in sorted(cp, key=str.lower)]
    body = "\n".join(lines)
    out = f'''import 'package:flutter/widgets.dart';

/// Ícones do AtletaDoVolei, servidos pela icon font `SevenIcon`
/// (gerada a partir do export do Iconsax).
///
/// Cada ícone é um [IconData] e pode ser usado direto no widget [Icon].
/// A cor NÃO vem da fonte — cada glifo é monocromático (uma máscara). Defina a
/// cor no Flutter (herda do [IconTheme] ou passe explicitamente):
/// ```dart
/// Icon(SevenIcons.search, size: 24, color: Colors.black);
/// ```
///
/// Codepoints na Área de Uso Privado (BMP); use sempre estas constantes —
/// não fixe o número do codepoint no app.
abstract final class SevenIcons {{
  SevenIcons._();

  static const String fontFamily = 'SevenIcon';
  static const String fontPackage = 'seven_icon';

{body}
}}
'''
    open(os.path.join(repo, 'lib/src/seven_icons.dart'), 'w', encoding='utf-8').write(out)


# ------------------------------------------------------------- parser de path
def build_path(d, skia):
    p = skia.Path()
    toks, i, n = [], 0, len(d)
    while i < n:
        ch = d[i]
        if ch in 'MmLlHhVvCcSsQqZzAa':
            toks.append(ch); i += 1
        elif ch in ' ,\t\r\n':
            i += 1
        else:
            m = NUM.match(d, i)
            if not m:
                i += 1; continue
            toks.append(float(m.group())); i = m.end()
    i, ln = 0, len(toks)
    cx = cy = sx = sy = 0.0
    cmd = None

    def num():
        nonlocal i
        v = toks[i]; i += 1; return v
    while i < ln:
        if isinstance(toks[i], str):
            cmd = toks[i]; i += 1
        if cmd in ('M', 'm'):
            x = num(); y = num()
            if cmd == 'm':
                x += cx; y += cy
            cx, cy = x, y; sx, sy = x, y; p.moveTo(cx, cy)
            cmd = 'l' if cmd == 'm' else 'L'
        elif cmd in ('L', 'l'):
            x = num(); y = num()
            if cmd == 'l':
                x += cx; y += cy
            cx, cy = x, y; p.lineTo(cx, cy)
        elif cmd in ('H', 'h'):
            x = num()
            if cmd == 'h':
                x += cx
            cx = x; p.lineTo(cx, cy)
        elif cmd in ('V', 'v'):
            y = num()
            if cmd == 'v':
                y += cy
            cy = y; p.lineTo(cx, cy)
        elif cmd in ('C', 'c'):
            a = [num() for _ in range(6)]
            if cmd == 'c':
                a = [a[k] + (cx if k % 2 == 0 else cy) for k in range(6)]
            p.cubicTo(*a); cx, cy = a[4], a[5]
        elif cmd in ('Q', 'q'):
            a = [num() for _ in range(4)]
            if cmd == 'q':
                a = [a[k] + (cx if k % 2 == 0 else cy) for k in range(4)]
            p.quadTo(*a); cx, cy = a[2], a[3]
        elif cmd in ('Z', 'z'):
            p.close(); cx, cy = sx, sy
        else:
            i += 1
    return p


def to_svg_d(path, skia):
    out = []
    it = skia.Path.Iter(path, False)
    f = lambda v: ('%.3f' % v).rstrip('0').rstrip('.')
    while True:
        verb, pts = it.next()
        if verb == skia.Path.kDone_Verb:
            break
        if verb == skia.Path.kMove_Verb:
            out.append('M%s %s' % (f(pts[0].x()), f(pts[0].y())))
        elif verb == skia.Path.kLine_Verb:
            out.append('L%s %s' % (f(pts[1].x()), f(pts[1].y())))
        elif verb == skia.Path.kQuad_Verb:
            out.append('Q%s %s %s %s' % (f(pts[1].x()), f(pts[1].y()), f(pts[2].x()), f(pts[2].y())))
        elif verb == skia.Path.kCubic_Verb:
            out.append('C%s %s %s %s %s %s' % (f(pts[1].x()), f(pts[1].y()), f(pts[2].x()), f(pts[2].y()), f(pts[3].x()), f(pts[3].y())))
        elif verb == skia.Path.kConic_Verb:
            q = skia.Path.ConvertConicToQuads(pts[0], pts[1], pts[2], it.conicWeight(), 1)
            for k in range(1, len(q) - 1, 2):
                out.append('Q%s %s %s %s' % (f(q[k].x()), f(q[k].y()), f(q[k+1].x()), f(q[k+1].y())))
        elif verb == skia.Path.kClose_Verb:
            out.append('Z')
    return ''.join(out)


# ------------------------------------------------------- render + trace (SVG)
def trace_svg(src, dst, skia, np):
    raw = open(src, encoding='utf-8').read()
    for c in ('#fff', '#ffffff', 'white'):
        raw = re.sub(r'(stroke|fill)="%s"' % c, r'\1="#000"', raw, flags=re.I)
    raw = re.sub(r'\s(width|height)="[^"]*"', '', raw, count=2)
    bm = skia.Bitmap(); bm.allocPixels(skia.ImageInfo.MakeN32Premul(SZ, SZ))
    cv = skia.Canvas(bm); cv.clear(skia.ColorWHITE)
    data = skia.Data.MakeWithCopy(raw.encode()); stream = skia.MemoryStream(data)
    dom = skia.SVGDOM.MakeFromStream(stream)
    dom.setContainerSize(skia.Size(SZ, SZ)); dom.render(cv)
    gray = np.array(bm)[:, :, 0]
    with tempfile.TemporaryDirectory() as td:
        pgm = os.path.join(td, 'i.pgm'); out = os.path.join(td, 'o.svg')
        h, w = gray.shape
        with open(pgm, 'wb') as fp:
            fp.write(b'P5\n%d %d\n255\n' % (w, h)); fp.write(gray.astype(np.uint8).tobytes())
        subprocess.run(['potrace', '-s', '-k', '0.5', '-a', '1.2', '-O', '0.2',
                        '-t', '2', '-u', '100', '-o', out, pgm], check=True)
        psvg = open(out, encoding='utf-8').read()
    g = re.search(r'transform="translate\(([^)]+)\)\s*scale\(([^)]+)\)"', psvg)
    tx, ty = [float(x) for x in NUM.findall(g.group(1))[:2]]
    sx, sy = [float(x) for x in NUM.findall(g.group(2))[:2]]
    ds = ''.join(re.findall(r'<path[^>]*\sd="([^"]*)"', psvg))
    p = build_path(ds, skia)
    mt = skia.Matrix(); mt.setAll(sx, 0, tx, 0, sy, ty, 0, 0, 1); p.transform(mt)
    nm = skia.Matrix(); nm.setScale(24.0 / SZ, 24.0 / SZ); p.transform(nm)
    p = skia.AsWinding(p)
    open(dst, 'w', encoding='utf-8').write(
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">'
        '<path d="%s" fill="#000" fill-rule="nonzero"/></svg>' % to_svg_d(p, skia))


# --------------------------------------------------------------- pipelines
def from_svg_export(svg_dir, repo, summary):
    import skia, numpy as np
    files = sorted(glob.glob(os.path.join(svg_dir, '*.svg')))
    # nomes + dedupe determinístico
    seen, rows = {}, []
    for f in files:
        m = re.match(r'iconsax-(.+?)-[0-9a-f]{12}-\.svg$', os.path.basename(f))
        base = m.group(1) if m else os.path.splitext(os.path.basename(f))[0]
        k = seen.get(base, 0); seen[base] = k + 1
        kebab = base if k == 0 else f"{base}-{k}"
        if base == 'logout2':
            kebab = 'logout'           # preserva nome legado
        rows.append((f, camel(kebab)))
    rows.sort(key=lambda r: r[1].lower())
    cp = {name: 0xE001 + i for i, (_, name) in enumerate(rows)}
    with tempfile.TemporaryDirectory() as td:
        glyphs = os.path.join(td, 'glyphs'); os.makedirs(glyphs)
        for f, name in rows:
            trace_svg(f, os.path.join(glyphs, name + '.svg'), skia, np)
        fontdir = os.path.join(td, 'font'); os.makedirs(fontdir)
        cfg = {"inputDir": glyphs, "outputDir": fontdir, "name": "iconsax",
               "fontTypes": ["ttf", "woff"], "assetTypes": ["json"],
               "normalize": True, "fontHeight": 1000, "descent": 150,
               "round": 10e12, "codepoints": cp}
        json.dump(cfg, open(os.path.join(td, '.fantasticonrc.json'), 'w'))
        subprocess.run(['npx', '-y', 'fantasticon', '--config',
                        os.path.join(td, '.fantasticonrc.json')], check=True)
        shutil.copy(os.path.join(fontdir, 'iconsax.ttf'),
                    os.path.join(repo, 'assets/fonts/iconsax.ttf'))
    write_dart(repo, cp)
    summary.update(source='svg', codepoints=cp)


def from_font_export(work, repo, summary):
    # zip de Font: iconsax.ttf + iconsax.css (codepoints no CSS)
    css = glob.glob(os.path.join(work, '*.css'))[0]
    ttf = glob.glob(os.path.join(work, '*.ttf'))[0]
    text = open(css, encoding='utf-8').read()
    cp = {}
    for m in re.finditer(r'\.is-([a-z0-9-]+):before\s*\{\s*content:\s*"\\([0-9A-Fa-f]+)"', text):
        name = m.group(1)
        if name == 'logout2':
            name = 'logout'
        cp[camel(name)] = int(m.group(2), 16)
    shutil.copy(ttf, os.path.join(repo, 'assets/fonts/iconsax.ttf'))
    write_dart(repo, cp)
    summary.update(source='font', codepoints=cp)


def sanitize_font(repo):
    """Limpa flags de glifo inválidos e valida a fonte no OTS.

    A pipeline svg2ttf/FontForge às vezes deixa o bit reservado 7 (e o bit 6,
    OVERLAP_SIMPLE) setado nos flags de glifo. O freetype/Skia tolera, mas o OTS
    (OpenType Sanitizer, usado por Chrome/Safari/Firefox) rejeita a fonte inteira
    — todos os ícones viram tofu na web. Aqui zeramos os bits 6 e 7 e validamos.
    """
    from fontTools.ttLib import TTFont
    ttf = os.path.join(repo, 'assets/fonts/iconsax.ttf')
    f = TTFont(ttf)
    glyf = f['glyf']
    fixed = []
    for gname in f.getGlyphOrder():
        g = glyf[gname]
        if g.isComposite() or g.numberOfContours <= 0 or not hasattr(g, 'flags'):
            continue
        cleaned = bytes(fl & 0x3F for fl in g.flags)
        if cleaned != bytes(g.flags):
            g.flags = bytearray(cleaned)
            fixed.append(gname)
    if fixed:
        f.save(ttf)
    # validação OTS (não-bloqueante se o módulo não estiver instalado)
    try:
        import ots
    except ImportError:
        print('aviso: opentype-sanitizer não instalado — pulei a validação OTS '
              '(pip install opentype-sanitizer)', file=sys.stderr)
        return fixed
    with tempfile.NamedTemporaryFile(suffix='.ttf') as out:
        if ots.sanitize(ttf, out.name).returncode != 0:
            sys.exit('OTS rejeitou a fonte gerada — não passaria nos navegadores')
    return fixed


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--zip', required=True)
    ap.add_argument('--repo', required=True)
    args = ap.parse_args()
    repo = os.path.abspath(args.repo)
    summary = {}
    with tempfile.TemporaryDirectory() as work:
        with zipfile.ZipFile(args.zip) as z:
            z.extractall(work)
        # achata: alguns zips têm subpasta
        svgs = glob.glob(os.path.join(work, '**', '*.svg'), recursive=True)
        css = glob.glob(os.path.join(work, '**', '*.css'), recursive=True)
        if css:
            from_font_export(os.path.dirname(css[0]), repo, summary)
        elif svgs:
            from_svg_export(os.path.dirname(svgs[0]), repo, summary)
        else:
            sys.exit('zip não contém .svg nem .css — export do Iconsax inesperado')
    fixed = sanitize_font(repo)
    cp = summary['codepoints']
    old = old_names(repo)
    names = sorted(cp, key=str.lower)
    new = [n for n in names if n.lower() not in old]
    report = {"source": summary['source'], "total": len(cp),
              "new_count": len(new), "new": new, "names": names,
              "sanitized_glyphs": fixed}
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
