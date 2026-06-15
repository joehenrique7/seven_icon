---
name: atualizar-icones
description: Atualiza a icon font do pacote seven_icon a partir de um export do Iconsax (zip em assets/fonts). Use quando o usuário pedir para atualizar/substituir os ícones, subir uma nova versão da fonte, ou descompactar um novo zip do Iconsax. Lida tanto com export SVG (gera a fonte localmente) quanto export Font (.ttf+.css).
---

# Atualizar ícones (seven_icon)

Regenera `assets/fonts/iconsax.ttf` + `lib/src/seven_icons.dart` a partir de um
export do Iconsax e publica uma nova versão. O Iconsax hoje só exporta em
**SVG** (traçado/stroke); o build vetoriza isso localmente.

## Pré-requisitos (instale se faltar)

- `potrace` → `brew install potrace`
- venv Python com `skia-python` + `numpy` + `fonttools` + `opentype-sanitizer`:
  ```bash
  python3 -m venv /tmp/seven-icon-venv
  /tmp/seven-icon-venv/bin/pip install -q skia-python numpy fonttools opentype-sanitizer
  ```
  `fonttools` e `opentype-sanitizer` são usados no passo de saneamento da fonte
  (zera bits de flag de glifo reservados e valida no OTS — sem isso o Chrome/
  Safari/Firefox podem rejeitar a fonte e mostrar tofu). Se o OTS não estiver
  instalado o build apenas avisa e segue; com ele, falha se a fonte não passar.
- `npx fantasticon` (baixado on-the-fly; precisa de Node) — só para export SVG.

## Passos

1. **Ache o zip** que o usuário colocou em `assets/fonts/*.zip`. Se não houver,
   pergunte onde está.

2. **Rode o build** (faz tudo que é determinístico: descompacta, vetoriza,
   monta a fonte, instala o `.ttf`, gera o `seven_icons.dart` e imprime um
   resumo JSON com `total`, `new` e `names`):
   ```bash
   /tmp/seven-icon-venv/bin/python .claude/skills/atualizar-icones/build_font.py \
     --zip assets/fonts/<arquivo>.zip --repo .
   ```
   - O script detecta automaticamente o tipo de export:
     - **SVG**: rasteriza cada ícone (Skia, 1024px), vetoriza com `potrace`,
       gera SVG preenchido e monta `.ttf`/`.woff` com `fantasticon`.
       Codepoints ficam na PUA BMP (`0xE001`+), pois `svg2ttf` só gera cmap BMP.
     - **Font** (`.ttf`+`.css`): copia o `.ttf` e lê os codepoints do `.css`.
   - Nomes vêm do arquivo, em `camelCase`. Duplicados (ex.: `setting` ×3) viram
     `setting`, `setting1`, `setting2`. `logout2` é mantido como `logout` (legado).
     Nome começando com dígito (`3-dots-more`) vira `threeDotsMore`.

3. **Verifique** (opcional, recomendado): confira que todos os codepoints do
   `seven_icons.dart` têm glifo no `.ttf` — o script já falha se algo der errado,
   mas vale renderizar uns glifos com Skia se quiser inspecionar visualmente.

4. **Atualize os metadados** usando o resumo do passo 2:
   - `pubspec.yaml`: suba a `version` (novos ícones = minor; mudança de
     codepoints que pode afetar quem fixava número = registre no CHANGELOG).
   - `README.md`: atualize a contagem em "Ícones disponíveis (N)" e a lista
     (use `names` do resumo) e o `ref: vX.Y.Z` da instalação.
   - `CHANGELOG.md`: nova seção com os ícones novos (`new` do resumo).

5. **Limpe**: apague o `.zip` de `assets/fonts/` (não versionar o zip).

6. **Publique**: commit, tag `vX.Y.Z` e push de `main` + tag (o app consome via
   `git ref`). Confirme com o usuário antes do push se ele não tiver pedido
   explicitamente para subir.

## Notas

- Os SVGs do Iconsax vêm como **stroke** (`fill:none`), por isso não dá para
  alimentar um font-builder direto: o build rasteriza + revetoriza para ter
  formas preenchidas. Isso também resolve ícones "bold" com subpaths duplicados
  (ex.: `userSquare`) que quebram em booleanas vetoriais.
- O número do codepoint é detalhe interno; o `.dart` e o `.ttf` são gerados
  juntos e ficam sempre em sincronia. Apps devem usar `SevenIcons.<nome>`.
