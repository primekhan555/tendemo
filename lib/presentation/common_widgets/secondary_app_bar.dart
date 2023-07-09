import 'package:flutter/material.dart';
import 'package:tendemo/navigation/navigation.dart';

import '../../constants/app_colors.dart';
import 'heading.dart';

class SecondaryAppBar extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const SecondaryAppBar({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: ()=>Navigation.pop(), icon: Icon(Icons.arrow_back_ios,color: AppColors.black,)),
      backgroundColor: AppColors.white,
      toolbarHeight: 77,
      centerTitle: true,
      elevation: 0.2,
      title: Column(children: [
        Heading(heading: title ?? ''),
        Heading(
          heading: subTitle ?? '',
          fontSize: 12,
          color: AppColors.skyBlue,
        ),
      ]),
    );
  }
}
