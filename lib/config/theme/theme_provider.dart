/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */
import 'package:flutter/material.dart';
import 'package:flutter_task/resources/utils/color_helper.dart';
import 'package:flutter_task/resources/utils/layout.dart';

Color primaryFont = ColorHelper.fromHex('#000000');
Color secondaryFont = ColorHelper.fromHex('#FF7B67');

ThemeData lightTheme(BuildContext context) => ThemeData(
      disabledColor: const Color.fromRGBO(206, 206, 206, 1),
      scaffoldBackgroundColor: ColorHelper.fromHex('#FFFFFF'),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      brightness: Brightness.light,
      shadowColor: ColorHelper.fromHex('#000000').withOpacity(0.2),
      dividerTheme: DividerThemeData(
        color: ColorHelper.fromHex('#CDCDCD'),
        thickness: rSize(context, 1),
        space: 0,
      ),
      fontFamily: 'Arial',
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: primaryFont,
          fontSize: rSize(context, 16),
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: primaryFont,
          fontSize: rSize(context, 14),
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: primaryFont,
          fontSize: rSize(context, 12),
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: primaryFont,
          fontSize: rSize(context, 16),
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: primaryFont,
          fontSize: rSize(context, 14),
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          color: primaryFont,
          fontSize: rSize(context, 12),
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: primaryFont,
          fontWeight: FontWeight.w700,
          fontSize: rSize(context, 24),
        ),
        headlineMedium: TextStyle(
          color: primaryFont,
          fontWeight: FontWeight.w700,
          fontSize: rSize(context, 20),
        ),
        headlineSmall: TextStyle(
          color: primaryFont,
          fontWeight: FontWeight.w700,
          fontSize: rSize(context, 16),
        ),
        displayLarge: TextStyle(
          color: primaryFont,
          fontWeight: FontWeight.w700,
          fontSize: rSize(context, 44),
          letterSpacing: rSize(context, -1),
        ),
        displayMedium: TextStyle(
          color: primaryFont,
          fontWeight: FontWeight.w400,
          fontSize: rSize(context, 44),
        ),
        displaySmall: TextStyle(
          color: primaryFont,
          fontWeight: FontWeight.w700,
          fontSize: rSize(context, 36),
        ),
      ),
      hintColor: const Color.fromRGBO(206, 206, 206, 1),
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorHelper.fromHex('#000000'), //Liquorice
        inversePrimary: ColorHelper.fromHex('#FF7B67'), //Aurora
        onPrimary: ColorHelper.fromHex('#FFBFC5'), //Shepherd's delight
        primaryContainer: ColorHelper.fromHex('#FFFFFF'), //Coconut
        onPrimaryContainer: ColorHelper.fromHex('#FDF2F0'), //Aurora light
        tertiary: ColorHelper.fromHex('#002E88'), //Blueberry dark
        tertiaryContainer: ColorHelper.fromHex('#006EB8'), //Blueberry
        tertiaryFixed: ColorHelper.fromHex('#00A1FF'), //Sky blue
        tertiaryFixedDim: ColorHelper.fromHex('#99D9FF'), //Sky blue light
        scrim: ColorHelper.fromHex('#00864E'), //Mint
        error: ColorHelper.fromHex('#EC0026'), //Chilli
        outline: ColorHelper.fromHex('#FFBE2C'), //Banana
        outlineVariant: ColorHelper.fromHex('#BF7D20'), //Gold
        surface: ColorHelper.fromHex('#FFFFFF'), //Slate
        surfaceBright: ColorHelper.fromHex('#757575'), //Thunder
        surfaceTint: ColorHelper.fromHex('#CDCDCD'), //Smoke
        surfaceDim: ColorHelper.fromHex('#E2E2E2'), //Cloud
        surfaceContainer: ColorHelper.fromHex('#F1F1F1'), //Pearl
        shadow: ColorHelper.fromHex('#000000').withOpacity(0.2),
        errorContainer: ColorHelper.fromHex('#89420E'),
      ),
    );
