# seven_icon

Pacote de ícones do **AtletaDoVolei**, baseado no [Iconsax](https://app.iconsax.io/) e servido como **icon font** (`.ttf`). Os ícones viram `IconData` e são usados direto no widget `Icon` do Flutter — leves, com cor herdada do tema e nitidez vetorial em qualquer tamanho.

## Instalação

No `pubspec.yaml` do app:

```yaml
dependencies:
  seven_icon:
    git:
      url: https://github.com/joehenrique7/seven_icon
      ref: v0.4.0
```

## Uso

```dart
import 'package:seven_icon/seven_icon.dart';

Icon(SevenIcons.search, size: 24, color: Colors.black);
```

> **Sobre cor:** num icon font cada glifo é monocromático (uma máscara). A cor que você escolhe ao exportar no Iconsax (ex.: branco) **não é gravada** no `.ttf` — a cor vem do `Icon(color: ...)` ou herda do `IconTheme` no Flutter.

> **Sobre os codepoints:** ficam na Área de Uso Privado (BMP) e podem mudar de uma versão para outra. Use **sempre** as constantes de `SevenIcons` (ex.: `SevenIcons.search`) — nunca fixe o número do codepoint direto no app.

## Ícones disponíveis (506)

`activity` · `addCircle` · `addItem` · `addSquare` · `aiAc` · `aiAdd` · `aiAntenna` · `aiCommentary` · `aiFuelTank` · `aiHeartSquare` · `aiHomepage` · `aiHospital` · `aiHousing` · `aiLandscape` · `aiLoveletter` · `aiRecordVideo` · `aiSandTimer` · `aiSendMessage` · `aiShapeTriangle` · `aiSyringe` · `aiTagPrice` · `aiTools` · `aiUsers` · `aiWaterCycle` · `aiWeight` · `airplane` · `airplaneSquare` · `alignBottom` · `alignLeft` · `alignLeft1` · `aquarius` · `archive` · `archive1` · `archive2` · `archiveAdd` · `archiveBook` · `archiveMinus` · `archiveSlash` · `archiveTick` · `arrowBack` · `arrowCircleDown` · `arrowCircleLeft` · `arrowCircleRight` · `arrowCircleUp` · `arrowDown` · `arrowDown2` · `arrowDown3` · `arrowDown4` · `arrowForward` · `arrowLeft` · `arrowLeft2` · `arrowLeft3` · `arrowRight` · `arrowRight2` · `arrowRight3` · `arrowRight4` · `arrowSquareDown` · `arrowSquareLeft` · `arrowSquareRight` · `arrowSquareUp` · `arrowSwap` · `arrowSwap2` · `arrowSwap3` · `arrowTransfer` · `arrowTransfer2` · `arrowUp` · `arrowUp2` · `arrowUp3` · `arrowUp4` · `award` · `backward10Seconds` · `backward15Seconds` · `backward5Seconds` · `backwardItem` · `bank` · `battery2bars` · `batteryDisable` · `bell2` · `bill` · `bitcoinBtc` · `bitcoinCard` · `blend` · `bluetoothCircle` · `bookSaved` · `bookSquare` · `box` · `box1` · `boxAdd` · `boxRemove` · `boxSearch` · `boxTick` · `boxTime` · `briefcase` · `brush` · `brushSquare` · `bubble` · `building` · `building1` · `building2` · `building3` · `buildings` · `buildings1` · `buyCrypto` · `cake` · `cake1` · `cake2` · `calculator` · `calendar` · `calendar1` · `calendar2` · `calendar3` · `calendar4` · `calendarAdd` · `calendarChristmas` · `calendarDate` · `calendarEdit` · `calendarRemove` · `calendarSearch` · `calendarTick` · `calendarTree` · `call` · `camera` · `car` · `card` · `cardAdd` · `cardEdit` · `cardReceive` · `cardRemove` · `cardRemove1` · `cardSend` · `cardSlash` · `cardTick` · `cardTick1` · `cards` · `category` · `chainlinkLink` · `chart` · `chart1` · `chart2` · `chart3` · `chartFail` · `chartSquare` · `chartSquare1` · `chartSuccess` · `chatbox` · `check` · `christmasHouse` · `christmasTree` · `christmasWreath` · `clipboard` · `clipboardExport` · `clipboardImport` · `clipboardText` · `clipboardTick` · `clock` · `clock1` · `closeCircle` · `closeSquare` · `cloud` · `cloudAdd` · `cloudCross` · `cloudRemove` · `cloudSnow` · `cloudSunny` · `code` · `codeCircle` · `coin` · `colorfilter` · `component` · `conversationBox` · `convertArrow` · `copy` · `copySuccess` · `courthouse` · `cpu` · `cpuSetting` · `creativeCommons` · `crop` · `crown` · `cup` · `danger` · `data` · `devices` · `devices1` · `diagram` · `directDown` · `directInbox` · `directLeft` · `directNormal` · `directNotification` · `directRight` · `directUp` · `directboxDefault` · `directboxNotif` · `discover` · `dislike` · `document` · `document1` · `documentCloud` · `documentCode` · `documentCopy` · `documentDownload` · `documentFavorite` · `documentFilter` · `documentForward` · `documentNormal` · `documentSketch` · `dollarSquare` · `driving` · `edit` · `edit1` · `emojiHappy` · `emojiNormal` · `emojiSad` · `emptyWallet` · `enhancePrize` · `enhanceUserAi` · `exportArrow` · `exportArrow2` · `exportCircle` · `exportCircle2` · `externalDrive` · `eye` · `eyeSlash` · `favoriteChart` · `filterSquare` · `filterTick` · `firstline` · `flash` · `flash1` · `forbidden` · `forward` · `forward10Seconds` · `forward15Seconds` · `forward5Seconds` · `forwardItem` · `ftxTokenFtt` · `gallery` · `galleryAdd` · `galleryEdit` · `galleryExport` · `galleryFavorite` · `galleryImport` · `galleryRemove` · `gallerySlash` · `galleryTick` · `game` · `gasStation` · `gemini` · `gemini1` · `gift172` · `glass` · `global` · `graph` · `grid` · `grid1` · `gridEqual` · `happy` · `happyemoji` · `hashtag` · `hashtag1` · `health` · `heart` · `heartAdd` · `heartEdit` · `heartRemove` · `heartSearch` · `heartSlash` · `heartTick` · `homeHashtag` · `homeTrendDown` · `homeTrendUp` · `hospital` · `house` · `house1` · `huobiTokenHt` · `iconIcx` · `illustrator` · `importArrow` · `importArrow2` · `importCircle` · `importCircle2` · `infoCircle` · `instagram` · `key` · `keyboard` · `lampCharge` · `lampOn` · `lampSlash` · `level` · `like` · `likeDislike` · `link` · `location` · `locationAdd` · `locationCross` · `locationMinus` · `locationSlash` · `locationTick` · `lock` · `lockSlash` · `login` · `login2` · `logout` · `logout2` · `magicpen` · `man` · `map` · `map1` · `math` · `maximize` · `maximize1` · `medal` · `medalStar` · `menu` · `messageAdd` · `messages` · `microphone` · `minusCircle` · `minusSquare` · `mirroringScreen` · `moneroXmr` · `money` · `money1` · `monitor` · `monitorMobile` · `monitorRecorder` · `moon` · `moreCircle` · `mouse` · `mouseSquare` · `musicalNoteAi` · `note` · `note1` · `noteAdd` · `noteFavorite` · `noteRemove` · `noteText` · `notification` · `notificationBing` · `notificationStatus` · `padlock` · `paintBrush` · `partyPopper` · `passwordCheck` · `path` · `pause` · `people` · `percentageCircle` · `percentageSquare` · `personalcard` · `play` · `presentationChart` · `previous` · `printer` · `printerSlash` · `profile2user` · `profileAdd` · `profileCircle` · `profileDelete` · `profileRemove` · `profileTick` · `quoteUpSquare` · `radar` · `ranking` · `ranking1` · `receipt` · `receipt1` · `receipt2` · `receipt3` · `receiptAdd` · `receiptSearch` · `receiptSquare` · `receiveSquare` · `receiveSquare2` · `received` · `recordCircle` · `redoArrow` · `refreshArrow` · `refreshArrow2` · `refreshCircle` · `refreshLeft` · `refreshRight` · `refreshSquare` · `repeatArrow` · `repeatCircle` · `rotateLeft` · `rotateLeft1` · `rotateRight` · `rotateRight1` · `routing` · `sagittarius` · `santa2` · `save` · `saveAdd` · `saveMinus` · `saveRemove` · `scissor` · `search` · `security` · `securityCard` · `securitySafe` · `securityUser` · `send` · `send1` · `send2` · `sendSquare` · `sendSquare2` · `setting` · `setting1` · `setting2` · `shapes` · `share` · `shield` · `shieldCross` · `shieldSearch` · `shieldTick` · `shop` · `shopAdd` · `shopRemove` · `sidebarBottom` · `sidebarLeft` · `sidebarRight` · `sidebarTop` · `signpost` · `size` · `slack` · `slash` · `sliderHorizontal` · `sliderVertical` · `smartBag` · `smartCursor` · `smartHome` · `smartLockAi` · `sms` · `smsEdit` · `smsSearch` · `smsStar` · `smsTracking` · `speedometer` · `star` · `star4` · `starSlash` · `statusUp` · `sticker` · `stickynote` · `stop` · `stopCircle` · `sun` · `swapHorizontal` · `swapHorizontal2` · `swapHorizontal3` · `tag` · `tag1` · `task` · `taskSquare` · `teacher` · `threeDCubeScan` · `threeDSquare` · `threeDotsMore` · `threeSquare` · `tickSquare` · `ticket` · `ticketDiscount` · `ticketExpired` · `ticketStar` · `timer` · `timerPause` · `timerStart` · `toggleOffCircle` · `toggleOnCircle` · `topBottomGrid` · `transactionMinus` · `trash` · `tree` · `trendDown` · `trendUp` · `truck` · `truckFast` · `truckRemove` · `truckTick` · `truckTime` · `twentyFourSupport` · `undoArrow` · `unlimited` · `unlock` · `user` · `userCircleAdd` · `userEdit` · `userHexagon` · `userSquare` · `userTick` · `verify` · `video` · `voiceCircle` · `volumeCross` · `volumeHigh` · `volumeLow` · `volumeLow1` · `volumeMute` · `warning` · `watch` · `weight` · `weight1` · `whatsapp` · `woman`

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
