import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppColors {
  const AppColors({
    required this.additional110,
    required this.additional1100,
    required this.additional2100,
    required this.additional3100,
    required this.additional410,
    required this.additional4100,
    required this.additional510,
    required this.additional5100,
    required this.additional610,
    required this.additional6100,
    required this.additional710,
    required this.additional7100,
    required this.additional810,
    required this.additional8100,
    required this.additional910,
    required this.additional9100,
    required this.background,
    required this.background50,
    required this.border,
    required this.border50,
    required this.buttonTypo,
    required this.carrefour100,
    required this.carrefour30,
    required this.element,
    required this.error10,
    required this.error100,
    required this.makro100,
    required this.makro30,
    required this.makroAdditional,
    required this.overlay,
    required this.primary,
    required this.primaryButtonClicked10,
    required this.primaryButtonClicked100,
    required this.subtypo,
    required this.tile,
    required this.typo,
    required this.systemUiOverlayStyle,
  });

  // additional
  final Color additional110;
  final Color additional1100;
  final Color additional2100;
  final Color additional3100;
  final Color additional410;
  final Color additional4100;
  final Color additional510;
  final Color additional5100;
  final Color additional610;
  final Color additional6100;
  final Color additional710;
  final Color additional7100;
  final Color additional810;
  final Color additional8100;
  final Color additional910;
  final Color additional9100;

  // elements
  final Color background;
  final Color background50;
  final Color border;
  final Color border50;
  final Color buttonTypo;
  final Color element;
  final Color subtypo;
  final Color tile;
  final Color typo;

  // carrefour
  final Color carrefour100;
  final Color carrefour30;

  // universal
  final Color error10;
  final Color error100;
  final Color overlay;
  final Color primary;
  final Color primaryButtonClicked10;
  final Color primaryButtonClicked100;

  // makro
  final Color makro100;
  final Color makro30;
  final Color makroAdditional;

  // System
  final SystemUiOverlayStyle systemUiOverlayStyle;

  Map<String, Map<String, Color>> get allColors => {
        "additional": additionalColors,
        "elements": elementsColors,
        "carrefour": carrefourColors,
        "universal": universalColors,
        "makro": makroColors,
      };

  Map<String, Color> get additionalColors => {
        "additional110": additional110,
        "additional1100": additional1100,
        "additional2100": additional2100,
        "additional3100": additional3100,
        "additional410": additional410,
        "additional4100": additional4100,
        "additional510": additional510,
        "additional5100": additional5100,
        "additional610": additional610,
        "additional6100": additional6100,
        "additional710": additional710,
        "additional7100": additional7100,
        "additional810": additional810,
        "additional8100": additional8100,
        "additional910": additional910,
        "additional9100": additional9100,
      };

  Map<String, Color> get elementsColors => {
        "background": background,
        "background50": background50,
        "border": border,
        "border50": border50,
        "buttonTypo": buttonTypo,
        "element": element,
        "subtypo": subtypo,
        "tile": tile,
        "typo": typo,
      };

  Map<String, Color> get carrefourColors => {
        "carrefour100": carrefour100,
        "carrefour30": carrefour30,
      };

  Map<String, Color> get universalColors => {
        "error10": error10,
        "error100": error100,
        "overlay": overlay,
        "primary": primary,
        "primaryButtonClicked10": primaryButtonClicked10,
        "primaryButtonClicked100": primaryButtonClicked100,
      };

  Map<String, Color> get makroColors => {
        "makro100": makro100,
        "makro30": makro30,
        "makroAdditional": makroAdditional,
      };
}

class LightAppColors extends AppColors {
  const LightAppColors()
      : super(
          additional110: const Color(0x1A98C93C),
          additional1100: const Color(0xFF98C93C),
          additional2100: const Color(0xFFEC0677),
          additional3100: const Color(0xFF70AE09),
          additional410: const Color(0x1AF0771F),
          additional4100: const Color(0xFFF0771F),
          additional510: const Color(0x1A55B8D8),
          additional5100: const Color(0xFF55B8D8),
          additional610: const Color(0x1A25B422),
          additional6100: const Color(0xFF25B422),
          additional710: const Color(0x1A5591D8),
          additional7100: const Color(0xFF5591D8),
          additional810: const Color(0x1AAE55D8),
          additional8100: const Color(0xFFAE55D8),
          additional910: const Color(0x1A22B490),
          additional9100: const Color(0xFF22B490),
          background: const Color(0xFFF2F2F2),
          background50: const Color(0x80F2F2F2),
          border: const Color(0xFFDADADA),
          border50: const Color(0x80DADADA),
          buttonTypo: const Color(0xFF404041),
          carrefour100: const Color(0xFF314FB9),
          carrefour30: const Color(0xFF8497D8),
          element: const Color(0xFFFFFFFF),
          error10: const Color(0x1AEF404A),
          error100: const Color(0xFFEF404A),
          makro100: const Color(0xFF072386),
          makro30: const Color(0xFFB8C1DF),
          makroAdditional: const Color(0xFF173C7B),
          overlay: const Color(0x73000000),
          primary: const Color(0xFFFFCD00),
          primaryButtonClicked10: const Color(0x1AF6B409),
          primaryButtonClicked100: const Color(0xFFF6B409),
          subtypo: const Color(0xFF929497),
          tile: const Color(0xFFFFFFFF),
          typo: const Color(0xFF404041),
          systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        );
}

class DarkAppColors extends AppColors {
  const DarkAppColors()
      : super(
          additional110: const Color(0x1A98C93C),
          additional1100: const Color(0xFF98C93C),
          additional2100: const Color(0xFFEC0677),
          additional3100: const Color(0xFF70AE09),
          additional410: const Color(0x1AF0771F),
          additional4100: const Color(0xFFF0771F),
          additional510: const Color(0x1A55B8D8),
          additional5100: const Color(0xFF55B8D8),
          additional610: const Color(0x1A25B422),
          additional6100: const Color(0xFF25B422),
          additional710: const Color(0x1A5591D8),
          additional7100: const Color(0xFF5591D8),
          additional810: const Color(0x1AAE55D8),
          additional8100: const Color(0xFFAE55D8),
          additional910: const Color(0x1A22B490),
          additional9100: const Color(0xFF22B490),
          background: const Color(0xFF000000),
          background50: const Color(0x80000000),
          border: const Color(0xFF595959),
          border50: const Color(0x80595959),
          buttonTypo: const Color(0xFF404041),
          carrefour100: const Color(0xFF314FB9),
          carrefour30: const Color(0xFF8497D8),
          element: const Color(0xFFFFFFFF),
          error10: const Color(0x1AEF404A),
          error100: const Color(0xFFEF404A),
          makro100: const Color(0xFF072386),
          makro30: const Color(0xFF7C8ABC),
          makroAdditional: const Color(0xFF173C7B),
          overlay: const Color(0x73000000),
          primary: const Color(0xFFFFCD00),
          primaryButtonClicked10: const Color(0x1AF6B409),
          primaryButtonClicked100: const Color(0x1AF6B409),
          subtypo: const Color(0xFF929497),
          tile: const Color(0xFF262628),
          typo: const Color(0xFFF2F2F2),
          systemUiOverlayStyle: SystemUiOverlayStyle.light,
        );
}
