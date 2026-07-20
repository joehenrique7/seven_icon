# seven_icon

Pacote de ícones do **AtletaDoVolei**, baseado no [Iconsax](https://app.iconsax.io/) e servido como **icon font** (`.ttf`). Os ícones viram `IconData` e são usados direto no widget `Icon` do Flutter — leves, com cor herdada do tema e nitidez vetorial em qualquer tamanho.

## Instalação

No `pubspec.yaml` do app:

```yaml
dependencies:
  seven_icon:
    git:
      url: https://github.com/joehenrique7/seven_icon
      ref: v0.10.0
```

## Uso

```dart
import 'package:seven_icon/seven_icon.dart';

Icon(SevenIcons.search, size: 24, color: Colors.black);
```

> **Sobre cor:** num icon font cada glifo é monocromático (uma máscara). A cor que você escolhe ao exportar no Iconsax (ex.: branco) **não é gravada** no `.ttf` — a cor vem do `Icon(color: ...)` ou herda do `IconTheme` no Flutter.

> **Sobre os codepoints:** ficam na Área de Uso Privado (BMP) e podem mudar de uma versão para outra. Use **sempre** as constantes de `SevenIcons` (ex.: `SevenIcons.search`) — nunca fixe o número do codepoint direto no app.

## Ícones disponíveis

O pacote expõe **1054 ícones** como constantes `IconData` em `SevenIcons`.
Para navegar/buscar a lista completa, consulte [`lib/src/seven_icons.dart`](lib/src/seven_icons.dart).

## Como adicionar/atualizar ícones

O Iconsax passou a exportar só em **SVG** (não mais em Font), então a fonte é
gerada localmente a partir dos SVGs. O processo está automatizado na skill
[`atualizar-icones`](.claude/skills/atualizar-icones/) (Claude Code), que faz tudo abaixo:

1. No [Iconsax](https://app.iconsax.io/), selecione os ícones (variantes **Outline**/**Bold**) e exporte como **SVG**.
2. Coloque o `.zip` em [`assets/fonts/`](assets/fonts/).
3. Rode o build: cada SVG (que vem como traçado/_stroke_) é rasterizado e
   vetorizado (Skia + potrace) para virar uma forma preenchida, e a
   [`fantasticon`](https://github.com/tancredi/fantasticon) monta o `.ttf` + `.woff`.
4. As constantes de [`lib/src/seven_icons.dart`](lib/src/seven_icons.dart) e os codepoints
   (Área de Uso Privado, BMP) são gerados junto com a fonte, mantendo `.dart` e `.ttf` em sincronia.

> Requisitos do build: `fontforge` não é necessário; usa-se `potrace`, `python3`
> (`skia-python`, `numpy`) e `npx fantasticon`. Veja a skill para os comandos.

## Estrutura

```
seven_icon/
├── lib/
│   ├── seven_icon.dart        # export público
│   └── src/seven_icons.dart   # class SevenIcons (IconData por ícone)
├── assets/fonts/iconsax.ttf   # a icon font exportada do Iconsax
└── pubspec.yaml               # registra a font family "SevenIcon"
```
