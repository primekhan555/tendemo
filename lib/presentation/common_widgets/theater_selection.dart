import 'package:flutter/material.dart';
import 'package:tendemo/extensions/sized_box.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_textstyle.dart';

class TheaterSelection extends StatefulWidget {
  const TheaterSelection({super.key});

  @override
  State<TheaterSelection> createState() => _TheaterSelectionState();
}

class _TheaterSelectionState extends State<TheaterSelection> {
  TextStyle get boldText => AppTextstyle.poppins(
      fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.darkBlue);
  TextStyle get normalText => AppTextstyle.poppins(
      fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.lightGrey);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                width: 270,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: '12:30  ', style: boldText),
                        TextSpan(text: 'Cinetech + hall 1', style: normalText)
                      ])),
                      5.spaceY,
                      Container(
                        height: 145,
                        width: 249,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.skyBlue)),
                        child: Image.asset(AppAssets.theater),
                      ),
                      10.spaceY,
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: 'From', style: normalText),
                        TextSpan(text: " 50\$", style: boldText),
                        TextSpan(text: ' or', style: normalText),
                        TextSpan(text: ' 2500 bonus', style: boldText)
                      ])),
                    ]),
              );
            },
          ),
        )
      ],
    );
  }
}
