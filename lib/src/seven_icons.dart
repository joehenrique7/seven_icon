import 'package:flutter/widgets.dart';

/// Ícones do AtletaDoVolei, servidos pela icon font `SevenIcon`
/// (exportada do Iconsax).
///
/// Cada ícone é um [IconData] e pode ser usado direto no widget [Icon].
/// A cor NÃO vem da fonte — cada glifo é monocromático (uma máscara). Defina a
/// cor no Flutter (herda do [IconTheme] ou passe explicitamente):
/// ```dart
/// Icon(SevenIcons.search, size: 24, color: Colors.black);
/// ```
///
/// Codepoints gerados a partir do `iconsax.css` que acompanha a fonte.
abstract final class SevenIcons {
  SevenIcons._();

  static const String fontFamily = 'SevenIcon';
  static const String fontPackage = 'seven_icon';

  static const IconData addCircle =
      IconData(0xF9CB6, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData addSquare =
      IconData(0xF7466, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData archiveTick =
      IconData(0xFE6EB, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData arrowLeft =
      IconData(0xF8D45, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData calendar =
      IconData(0xF465B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData calendarSearch =
      IconData(0xFE774, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData coin =
      IconData(0xF006B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData copySuccess =
      IconData(0xF8A4A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData discover =
      IconData(0xFF625, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData documentCopy =
      IconData(0xFCC48, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData gallery =
      IconData(0xF621F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData keyboard =
      IconData(0xF08D5, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData logout =
      IconData(0xFED00, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData messages =
      IconData(0xF7190, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData notification =
      IconData(0xFD9C7, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData profile2user =
      IconData(0xF24B0, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData profileTick =
      IconData(0xFC620, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData search =
      IconData(0xF501F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData share =
      IconData(0xFB025, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData shieldTick =
      IconData(0xF6FF1, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData sliderHorizontal =
      IconData(0xF956C, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData sliderVertical =
      IconData(0xF72E6, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData userEdit =
      IconData(0xF704A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData userSquare =
      IconData(0xFCF7F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData verify =
      IconData(0xF35EF, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData whatsapp =
      IconData(0xFFB60, fontFamily: fontFamily, fontPackage: fontPackage);

  // NOTA: o ícone "people" foi exportado na variante duotone (Bulk), com 6
  // paths sobrepostos em tons/opacidades diferentes. Um único widget [Icon]
  // renderiza apenas uma cor, então essa variante não cabe como um IconData
  // simples. Use [profile2user] (variante de tom único) ou reexporte "people"
  // como Outline/Bold no Iconsax se quiser ele aqui.
}
