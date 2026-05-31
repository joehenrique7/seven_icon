import 'package:flutter/widgets.dart';

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
abstract final class SevenIcons {
  SevenIcons._();

  static const String fontFamily = 'SevenIcon';
  static const String fontPackage = 'seven_icon';

  static const IconData addCircle = IconData(0xE001, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData addSquare = IconData(0xE002, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData archiveTick = IconData(0xE003, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData arrowDown = IconData(0xE004, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData arrowLeft = IconData(0xE005, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData arrowRight3 = IconData(0xE006, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData arrowTransfer2 = IconData(0xE007, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData arrowUp2 = IconData(0xE008, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData backwardItem = IconData(0xE009, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData blend = IconData(0xE00A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData bubble = IconData(0xE00B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData building = IconData(0xE00C, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData calendar = IconData(0xE00D, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData calendarSearch = IconData(0xE00E, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData call = IconData(0xE00F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData camera = IconData(0xE010, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData card = IconData(0xE011, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData christmasWreath = IconData(0xE012, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData clipboard = IconData(0xE013, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData clipboardText = IconData(0xE014, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData clock = IconData(0xE015, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData closeCircle = IconData(0xE016, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData closeSquare = IconData(0xE017, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData coin = IconData(0xE018, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData copy = IconData(0xE019, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData copySuccess = IconData(0xE01A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData danger = IconData(0xE01B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData discover = IconData(0xE01C, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData documentCopy = IconData(0xE01D, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData documentNormal = IconData(0xE01E, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData edit = IconData(0xE01F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData edit1 = IconData(0xE020, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData eye = IconData(0xE021, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData eyeSlash = IconData(0xE022, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData filterSquare = IconData(0xE023, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData forbidden = IconData(0xE024, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData gallery = IconData(0xE025, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData gift172 = IconData(0xE026, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData global = IconData(0xE027, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData heart = IconData(0xE028, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData heartAdd = IconData(0xE029, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData heartRemove = IconData(0xE02A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData heartTick = IconData(0xE02B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData infoCircle = IconData(0xE02C, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData instagram = IconData(0xE02D, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData keyboard = IconData(0xE02E, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData location = IconData(0xE02F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData locationAdd = IconData(0xE030, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData locationCross = IconData(0xE031, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData locationMinus = IconData(0xE032, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData locationSlash = IconData(0xE033, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData locationTick = IconData(0xE034, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData lock = IconData(0xE035, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData logout = IconData(0xE036, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData map = IconData(0xE037, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData map1 = IconData(0xE038, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData medalStar = IconData(0xE039, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData menu = IconData(0xE03A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData messages = IconData(0xE03B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData microphone = IconData(0xE03C, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData minusCircle = IconData(0xE03D, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData minusSquare = IconData(0xE03E, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData moreCircle = IconData(0xE03F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData notification = IconData(0xE040, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData partyPopper = IconData(0xE041, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData people = IconData(0xE042, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData personalcard = IconData(0xE043, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData profile2user = IconData(0xE044, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData profileTick = IconData(0xE045, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData receiptSquare = IconData(0xE046, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData recordCircle = IconData(0xE047, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData search = IconData(0xE048, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData securitySafe = IconData(0xE049, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData securityUser = IconData(0xE04A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData send = IconData(0xE04B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData setting = IconData(0xE04C, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData setting1 = IconData(0xE04D, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData setting2 = IconData(0xE04E, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData share = IconData(0xE04F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData shieldTick = IconData(0xE050, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData shop = IconData(0xE051, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData sidebarLeft = IconData(0xE052, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData sliderHorizontal = IconData(0xE053, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData sliderVertical = IconData(0xE054, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData star = IconData(0xE055, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData star4 = IconData(0xE056, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData starSlash = IconData(0xE057, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData tag = IconData(0xE058, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData threeDotsMore = IconData(0xE059, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData tickSquare = IconData(0xE05A, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData trash = IconData(0xE05B, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData unlock = IconData(0xE05C, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData user = IconData(0xE05D, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData userEdit = IconData(0xE05E, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData userSquare = IconData(0xE05F, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData verify = IconData(0xE060, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData video = IconData(0xE061, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData voiceCircle = IconData(0xE062, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData warning = IconData(0xE063, fontFamily: fontFamily, fontPackage: fontPackage);
  static const IconData whatsapp = IconData(0xE064, fontFamily: fontFamily, fontPackage: fontPackage);
}
