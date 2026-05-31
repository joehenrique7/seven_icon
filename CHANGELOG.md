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
