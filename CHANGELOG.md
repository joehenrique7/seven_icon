## 0.3.0

* `SevenIcons` ampliada para **188 ícones** — 88 novos importados de 4 icon fonts (export Font do Iconsax) e mesclados na `iconsax.ttf` existente. Os glifos (em 200) foram reescalados para a grade da fonte base (em 1000) com a transformação `x'=5x, y'=5y-150`, alinhando traço, escala e baseline aos ícones já existentes. Duplicados (mesmo nome de um ícone já presente) foram ignorados. Novos: aiAc, aiAdd, aiAntenna, aiCommentary, aiFuelTank, aiHeartSquare, aiHomepage, aiHospital, aiHousing, aiLandscape, aiLoveletter, aiRecordVideo, aiSandTimer, aiSendMessage, aiShapeTriangle, aiSyringe, aiTagPrice, aiTools, aiUsers, aiWaterCycle, aiWeight, archive, archive1, archive2, archiveAdd, archiveMinus, archiveSlash, arrowBack, arrowCircleDown, arrowCircleLeft, arrowCircleRight, arrowCircleUp, arrowDown2, arrowDown3, arrowDown4, arrowForward, arrowLeft2, arrowLeft3, arrowRight, arrowRight2, arrowRight4, arrowSquareDown, arrowSquareLeft, arrowSquareRight, arrowSquareUp, arrowSwap, arrowSwap2, arrowSwap3, arrowTransfer, arrowUp, arrowUp3, arrowUp4, bookSaved, bookSquare, convertArrow, enhancePrize, enhanceUserAi, exportArrow, exportArrow2, exportCircle, exportCircle2, importArrow, importArrow2, importCircle, importCircle2, login, login2, logout2, musicalNoteAi, receiveSquare, receiveSquare2, received, redoArrow, refreshArrow, refreshArrow2, refreshCircle, refreshLeft, refreshRight, refreshSquare, repeatArrow, repeatCircle, save, saveAdd, saveMinus, saveRemove, smartBag, smartCursor, smartLockAi.

## 0.2.0

* Fonte agora **gerada a partir do export SVG** do Iconsax (que deixou de oferecer export em Font). Pipeline: rasterização + vetorização (Skia + potrace) dos traços para formas preenchidas e montagem do `.ttf`/`.woff` com `fantasticon`. Processo automatizado na skill `atualizar-icones`.
* `SevenIcons` ampliada para **100 ícones** — 44 novos: arrowDown, arrowTransfer2, arrowUp2, building, camera, card, clipboard, clipboardText, clock, closeCircle, closeSquare, copy, danger, documentNormal, eye, eyeSlash, forbidden, global, heart, heartAdd, heartRemove, heartTick, infoCircle, location, locationAdd, locationCross, locationMinus, locationSlash, locationTick, lock, map, map1, menu, minusCircle, minusSquare, receiptSquare, securitySafe, send, shop, tag, threeDotsMore, trash, unlock, warning.
* **Breaking interno:** os codepoints foram realocados para a Área de Uso Privado (BMP, `0xE001`+), pois o `svg2ttf` só gera cmap BMP. Quem usa as constantes de `SevenIcons` (recomendado) não é afetado; apps que fixavam o número do codepoint na mão precisam passar a usar as constantes.

## 0.1.0

* Fonte `assets/fonts/iconsax.ttf` reexportada do Iconsax (todos os codepoints anteriores preservados).
* `SevenIcons` ampliada para 56 ícones — 30 novos: arrowRight3, backwardItem, blend, bubble, call, christmasWreath, edit, edit1, filterSquare, gift172, instagram, medalStar, microphone, moreCircle, partyPopper, people, personalcard, recordCircle, securityUser, setting, setting1, setting2, sidebarLeft, star, star4, starSlash, tickSquare, user, video, voiceCircle.

## 0.0.1

* Estrutura inicial do pacote de ícones (icon font baseada no Iconsax).
* Adicionada a fonte `assets/fonts/iconsax.ttf` e registrada a font family `SevenIcon`.
* Classe `SevenIcons` com 26 ícones (`IconData`): addCircle, addSquare, archiveTick, arrowLeft, calendar, calendarSearch, coin, copySuccess, discover, documentCopy, gallery, keyboard, logout, messages, notification, profile2user, profileTick, search, share, shieldTick, sliderHorizontal, sliderVertical, userEdit, userSquare, verify, whatsapp.
