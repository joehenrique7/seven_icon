# seven_icon

Pacote de ícones do **AtletaDoVolei**, baseado no [Iconsax](https://app.iconsax.io/) e servido como **icon font** (`.ttf`). Os ícones viram `IconData` e são usados direto no widget `Icon` do Flutter — leves, com cor herdada do tema e nitidez vetorial em qualquer tamanho.

## Instalação

No `pubspec.yaml` do app:

```yaml
dependencies:
  seven_icon:
    git:
      url: https://github.com/joehenrique7/seven_icon
      ref: v0.0.1
```

## Uso

```dart
import 'package:seven_icon/seven_icon.dart';

Icon(SevenIcons.search, size: 24, color: Colors.black);
```

> **Sobre cor:** num icon font cada glifo é monocromático (uma máscara). A cor que você escolhe ao exportar no Iconsax (ex.: branco) **não é gravada** no `.ttf` — a cor vem do `Icon(color: ...)` ou herda do `IconTheme` no Flutter.

## Ícones disponíveis (26)

`addCircle` · `addSquare` · `archiveTick` · `arrowLeft` · `calendar` · `calendarSearch` · `coin` · `copySuccess` · `discover` · `documentCopy` · `gallery` · `keyboard` · `logout` · `messages` · `notification` · `profile2user` · `profileTick` · `search` · `share` · `shieldTick` · `sliderHorizontal` · `sliderVertical` · `userEdit` · `userSquare` · `verify` · `whatsapp`

## Como adicionar/atualizar ícones

1. No [Iconsax](https://app.iconsax.io/), selecione os ícones (use as variantes **Outline** e/ou **Bold** — variantes _duotone_ como Bulk/TwoTone perdem o segundo tom em icon font).
2. Exporte como **Font**. O Iconsax entrega um `.zip` com `iconsax.ttf`, `iconsax.woff` e `iconsax.css` (este último mapeia nome → codepoint, ex.: `.is-search:before { content: "\F501F"; }`).
3. Substitua [`assets/fonts/iconsax.ttf`](assets/fonts/) pelo novo `.ttf`.
4. Atualize as constantes em [`lib/src/seven_icons.dart`](lib/src/seven_icons.dart) com os codepoints do `iconsax.css`:

   ```dart
   static const IconData search =
       IconData(0xF501F, fontFamily: fontFamily, fontPackage: fontPackage);
   ```

## Estrutura

```
seven_icon/
├── lib/
│   ├── seven_icon.dart        # export público
│   └── src/seven_icons.dart   # class SevenIcons (IconData por ícone)
├── assets/fonts/iconsax.ttf   # a icon font exportada do Iconsax
└── pubspec.yaml               # registra a font family "SevenIcon"
```
