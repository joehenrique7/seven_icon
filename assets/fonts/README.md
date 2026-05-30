# assets/fonts

`iconsax.ttf` — icon font exportada do [Iconsax](https://app.iconsax.io/) (Export → Font).

O `pubspec.yaml` registra a font family `SevenIcon` apontando para este arquivo.
Os codepoints estão declarados em `lib/src/seven_icons.dart` (gerados a partir do `iconsax.css` do mesmo export).
Para atualizar, substitua o `.ttf` e ajuste as constantes conforme o novo `iconsax.css`.
