import 'package:flutter/material.dart';
import 'package:tendemo/extensions/sized_box.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_textstyle.dart';

class PrimaryButton extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final Color titleColor;
  final String title;
  final String? label;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  const PrimaryButton({super.key,this.bgColor=AppColors.skyBlue,this.borderColor=AppColors.skyBlue,required this.title,this.onTap,this.prefixIcon,this.label,this.titleColor=AppColors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           if(label!=null) ...[Text(
                label!,
                style: AppTextstyle.poppins(
                    fontWeight: FontWeight.w400, color: AppColors.darkBlue,fontSize: 10),
              ),3.spaceY],
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if(prefixIcon!=null)...[
                 Icon(
               prefixIcon!,
                color: AppColors.white,
              ),
              8.spaceX,
              ],
              Text(
                title,
                style: AppTextstyle.poppins(
                    fontWeight: FontWeight.w600, color: titleColor),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
