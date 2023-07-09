import 'package:flutter/material.dart';
import 'package:tendemo/constants/app_assets.dart';
import 'package:tendemo/constants/app_colors.dart';
import 'package:tendemo/constants/app_textstyle.dart';

class CustomBottomNavigation extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;
  const CustomBottomNavigation(
      {super.key, required this.onTap, this.selectedIndex = 1});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 75,
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.darkPurple,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          NavigationItem(
              label: 'Dashboard',
              icon: AppAssets.dashboard,
              isActive: selectedIndex == 0,
              onTap: () => onTap(0)),
          NavigationItem(
              label: 'Watch',
              icon:  AppAssets.watch,
              isActive: selectedIndex == 1,
              onTap: () => onTap(1)),
          NavigationItem(
              label: 'Media Library',
              icon: AppAssets.mediaLibrary,
              isActive: selectedIndex == 2,
              onTap: () => onTap(2)),
          NavigationItem(
              label: 'More',
              icon: AppAssets.more,
              isActive: selectedIndex == 3,
              onTap: () => onTap(3)),
        ]),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String label;
  final String icon;
  final bool isActive;
  final VoidCallback onTap;
  const NavigationItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.onTap,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,color:  isActive ? AppColors.white : AppColors.darkGrey,
            height: 16,width: 16,
            ),
          // Icon(Icons.abc,
          //     color: isActive ? AppColors.white : AppColors.darkGrey),
          const SizedBox(height: 5),
          Text(label,
              style: AppTextstyle.normal(
                  color: isActive ? AppColors.white : AppColors.darkGrey))
        ]));
  }
}
