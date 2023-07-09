import 'package:flutter/widgets.dart';

import 'app_colors.dart';

class AppTextstyle {
  static TextStyle normal(
          {FontWeight fontWeight = FontWeight.normal,
          double fontSize = 14,
          Color color = AppColors.black,
          double lineHeight = 1,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0}) =>
       TextStyle(
          // fontFamily: 'Manrope',
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: lineHeight == 1 ? 1 : lineHeight / fontSize,
          decoration: decoration,
          color: color);
  static TextStyle poppins(
         {FontWeight fontWeight = FontWeight.normal,
          double fontSize = 14,
          Color color = AppColors.black,
          double lineHeight = 1,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0}) =>
       TextStyle(
          // fontFamily: 'Manrope',
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: lineHeight == 1 ? 1 : lineHeight / fontSize,
          decoration: decoration,
          color: color);
}
