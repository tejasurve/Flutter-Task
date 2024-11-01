/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */
import 'package:flutter/material.dart';

class ColorHelper {
  static Color fromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
