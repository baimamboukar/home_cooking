import 'package:flutter/material.dart';

class Styles {
  static TextStyleTween title = TextStyleTween(
      begin: const TextStyle(),
      end: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
      ));

  static TextStyle subtitle = const TextStyle(
      color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 18.5);
  static TextStyle designText(
          {required Color color, required double size, required bool bold}) =>
      TextStyle(
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: size);
}
