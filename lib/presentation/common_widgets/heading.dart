import 'package:flutter/material.dart';
import 'package:tendemo/constants/app_colors.dart';

import '../../constants/app_textstyle.dart';

class Heading extends StatelessWidget {
  final String heading;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const Heading(
      {super.key,
      required this.heading,
      this.color = AppColors.darkBlue,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: AppTextstyle.poppins(
          color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
