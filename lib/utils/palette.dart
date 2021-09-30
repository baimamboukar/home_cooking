import 'dart:math';

import 'package:flutter/material.dart';

class Palette {
  static Color primary = Colors.cyan;
  static Color secondary = Colors.orange;
  static Color success = Colors.green;
  static Color error = Colors.redAccent;
  static Color light = Colors.white;
  static Color dark = Colors.black45;
  static LinearGradient linearGradient = LinearGradient(colors: [
    Colors.teal,
    Colors.teal.withOpacity(0.7),
    Colors.teal.withOpacity(0.4)
  ]);
  static LinearGradient gradientWith(Color color) => LinearGradient(
      colors: [color, color.withOpacity(0.5), color.withOpacity(0.3)]);

  static LinearGradient customGradientWith(List<Color> colors) =>
      LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter);
  static Color randomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
