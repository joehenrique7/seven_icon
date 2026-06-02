# seven_icon

Pacote de ícones do **AtletaDoVolei**, baseado no [Iconsax](https://app.iconsax.io/) e servido como **icon font** (`.ttf`). Os ícones viram `IconData` e são usados direto no widget `Icon` do Flutter — leves, com cor herdada do tema e nitidez vetorial em qualquer tamanho.

## Instalação

No `pubspec.yaml` do app:

```yaml
dependencies:
  seven_icon:
    git:
      url: https://github.com/joehenrique7/seven_icon
      ref: v0.3.0
```

## Uso

```dart
import 'package:seven_icon/seven_icon.dart';

Icon(SevenIcons.search, size: 24, color: Colors.black);
```

> **Sobre cor:** num icon font cada glifo é monocromático (uma máscara). A cor que você escolhe ao exportar no Iconsax (ex.: branco) **não é gravada** no `.ttf` — a cor vem do `Icon(color: ...)` ou herda do `IconTheme` no Flutter.

> **Sobre os codepoints:** ficam na Área de Uso Privado (BMP) e podem mudar de uma versão para outra. Use **sempre** as constantes de `SevenIcons` (ex.: `SevenIcons.search`) — nunca fixe o número do codepoint direto no app.

## Ícones disponíveis (188)

`addCircle` · `addSquare` · `aiAc` · `aiAdd` · `aiAntenna` · `aiCommentary` · `aiFuelTank` · `aiHeartSquare` · `aiHomepage` · `aiHospital` · `aiHousing` · `aiLandscape` · `aiLoveletter` · `aiRecordVideo` · `aiSandTimer` · `aiSendMessage` · `aiShapeTriangle` · `aiSyringe` · `aiTagPrice` · `aiTools` · `aiUsers` · `aiWaterCycle` · `aiWeight` · `archive` · `archive1` · `archive2` · `archiveAdd` · `archiveMinus` · `archiveSlash` · `archiveTick` · `arrowBack` · `arrowCircleDown` · `arrowCircleLeft` · `arrowCircleRight` · `arrowCircleUp` · `arrowDown` · `arrowDown2` · `arrowDown3` · `arrowDown4` · `arrowForward` · `arrowLeft` · `arrowLeft2` · `arrowLeft3` · `arrowRight` · `arrowRight2` · `arrowRight3` · `arrowRight4` · `arrowSquareDown` · `arrowSquareLeft` · `arrowSquareRight` · `arrowSquareUp` · `arrowSwap` · `arrowSwap2` · `arrowSwap3` · `arrowTransfer` · `arrowTransfer2` · `arrowUp` · `arrowUp2` · `arrowUp3` · `arrowUp4` · `backwardItem` · `blend` · `bookSaved` · `bookSquare` · `bubble` · `building` · `calendar` · `calendarSearch` · `call` · `camera` · `card` · `christmasWreath` · `clipboard` · `clipboardText` · `clock` · `closeCircle` · `closeSquare` · `coin` · `convertArrow` · `copy` · `copySuccess` · `danger` · `discover` · `documentCopy` · `documentNormal` · `edit` · `edit1` · `enhancePrize` · `enhanceUserAi` · `exportArrow` · `exportArrow2` · `exportCircle` · `exportCircle2` · `eye` · `eyeSlash` · `filterSquare` · `forbidden` · `gallery` · `gift172` · `global` · `heart` · `heartAdd` · `heartRemove` · `heartTick` · `importArrow` · `importArrow2` · `importCircle` · `importCircle2` · `infoCircle` · `instagram` · `keyboard` · `location` · `locationAdd` · `locationCross` · `locationMinus` · `locationSlash` · `locationTick` · `lock` · `login` · `login2` · `logout` · `logout2` · `map` · `map1` · `medalStar` · `menu` · `messages` · `microphone` · `minusCircle` · `minusSquare` · `moreCircle` · `musicalNoteAi` · `notification` · `partyPopper` · `people` · `personalcard` · `profile2user` · `profileTick` · `receiptSquare` · `receiveSquare` · `receiveSquare2` · `received` · `recordCircle` · `redoArrow` · `refreshArrow` · `refreshArrow2` · `refreshCircle` · `refreshLeft` · `refreshRight` · `refreshSquare` · `repeatArrow` · `repeatCircle` · `save` · `saveAdd` · `saveMinus` · `saveRemove` · `search` · `securitySafe` · `securityUser` · `send` · `setting` · `setting1` · `setting2` · `share` · `shieldTick` · `shop` · `sidebarLeft` · `sliderHorizontal` · `sliderVertical` · `smartBag` · `smartCursor` · `smartLockAi` · `star` · `star4` · `starSlash` · `tag` · `threeDotsMore` · `tickSquare` · `trash` · `unlock` · `user` · `userEdit` · `userSquare` · `verify` · `video` · `voiceCircle` · `warning` · `whatsapp`

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
