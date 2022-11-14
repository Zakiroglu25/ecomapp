import 'package:flutter/material.dart';

class Gradients {
  Gradients._();

  static const LinearGradient gBack = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(93, 95, 239, 0.5),
        Color.fromRGBO(39, 227, 216, 0.5),
        Color.fromRGBO(227, 46, 46, 0.5),
        Color.fromRGBO(254, 178, 1, 0.5),
      ]);

  static const LinearGradient gBorder = LinearGradient(
      tileMode: TileMode.mirror,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(248, 235, 253, 1),
        Color.fromRGBO(248, 235, 253, 1),
        Color.fromRGBO(255, 246, 225, 1),
        Color.fromRGBO(235, 251, 228, 1),
      ]);
}
