import 'dart:ui';

import 'package:flutter/material.dart';

class ColorManager {


    static  Color gray                 = HexColor.fromHex("#D8D8D8");
    static  Color dim_gray             = HexColor.fromHex("#686868");
    static  Color white                = HexColor.fromHex("#fafafa");
    static Color greenDark = HexColor.fromHex("#1ab506");


}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString;
    }
    return Color(int.parse(hexColorString,radix: 16));
  }
}