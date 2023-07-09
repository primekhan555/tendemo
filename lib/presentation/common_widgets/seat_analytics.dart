import 'package:flutter/material.dart';
import 'package:tendemo/constants/app_assets.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/presentation/common_widgets/heading.dart';

import '../../constants/app_colors.dart';

class SeatAnalytics extends StatelessWidget {
  const SeatAnalytics({super.key});
  item(String image, String title,Color imageColor) {
    return Row(
      children: [
        Image.asset(image, color: imageColor, height: 20,width: 20,),
        13.spaceX,
        Heading(
          heading: title,
          color: AppColors.lightGrey,
          fontSize: 12,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item(AppAssets.seat, 'Selected',AppColors.yellow),
                  20.spaceY,
                  item(AppAssets.seat, "VIP (150\$)",AppColors.darkPurple),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item(AppAssets.seat, 'Not available',AppColors.lightGrey),
                  20.spaceY,
                  item(AppAssets.seat, "Regular (50 \$)",AppColors.skyBlue),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
