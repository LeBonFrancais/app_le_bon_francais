import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle kBodyText =
TextStyle(fontSize: 18, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color kBlue = Color(0xff5663ff);

class Palette {
  static const MaterialColor darkBlue = MaterialColor(_darkBlue0PrimaryValue, <int, Color>{
    50: Color(0xFFE4E5EA),
    100: Color(0xFFBABFCC),
    200: Color(0xFF8D94AA),
    300: Color(0xFF5F6987),
    400: Color(0xFF3C496E),
    500: Color(_darkBlue0PrimaryValue),
    600: Color(0xFF17244D),
    700: Color(0xFF131F43),
    800: Color(0xFF0F193A),
    900: Color(0xFF080F29),
  });
  static const int _darkBlue0PrimaryValue = 0xFF1A2954;

  static const MaterialColor darkBlue0Accent = MaterialColor(_darkBlue0AccentValue, <int, Color>{
    100: Color(0xFF657EFF),
    200: Color(_darkBlue0AccentValue),
    400: Color(0xFF0029FE),
    700: Color(0xFF0025E5),
  });
  static const int _darkBlue0AccentValue = 0xFF3253FF;

  static const MaterialColor redDark = MaterialColor(_redDark0PrimaryValue, <int, Color>{
    50: Color(0xFFF6E6E6),
    100: Color(0xFFE7C0C0),
    200: Color(0xFFD89797),
    300: Color(0xFFC86D6D),
    400: Color(0xFFBC4D4D),
    500: Color(_redDark0PrimaryValue),
    600: Color(0xFFA92929),
    700: Color(0xFFA02323),
    800: Color(0xFF971D1D),
    900: Color(0xFF871212),
  });
  static const int _redDark0PrimaryValue = 0xFFB02E2E;

  static const MaterialColor redDark0Accent = MaterialColor(_redDark0AccentValue, <int, Color>{
    100: Color(0xFFFFBABA),
    200: Color(_redDark0AccentValue),
    400: Color(0xFFFF5454),
    700: Color(0xFFFF3B3B),
  });
  static const int _redDark0AccentValue = 0xFFFF8787;
}