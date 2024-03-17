import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instace = ColorManager._init();
  static ColorManager get instance {
    return _instace;
  }

  ColorManager._init();

  Color get white => const Color(0xFFFFFFFF);
  Color get gray => const Color(0xFF959EAD);
  Color get darkGray => const Color(0xFF292D36);
  Color get darkRed => const Color(0xFFEF5350);
  Color get black => const Color(0xff020306);
  Color get shadowBlack => const Color(0x0A000000);
  Color get transparent => const Color(0x00000000);
  Color get primary => const Color(0xff0b00dc);
  Color get secondary => const Color(0xff616161);
  Color get cupertinoSlidingSegmentedControlBackground =>
      const Color(0xFFF6F7FE);
  Color get cupertinoSlidingSegmentedControlActive => const Color(0xFF4960E9);

  List<Color> get homeGradient => const [
        Color(0xFF4960E9),
        Color(0xFF4960E9),
        Color(0xFF7749EA),
      ];
}
