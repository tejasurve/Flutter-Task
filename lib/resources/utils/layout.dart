/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'package:flutter/material.dart';

double rSize(
  BuildContext context,
  double size,
) {
  double standardLength = 0;

  standardLength = MediaQuery.of(context).size.width;

  double standardDesignLength = 375;
  double scaledSize = size * (standardLength / standardDesignLength);

  return standardLength > 600 ? scaledSize * 0.5 : scaledSize;
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

int roundUpAbsolute(double number) {
  return number.isNegative ? number.floor() : number.ceil();
}

bool isRtl(BuildContext context) {
  final TextDirection currentDirection = Directionality.of(context);
  return currentDirection == TextDirection.rtl;
}
