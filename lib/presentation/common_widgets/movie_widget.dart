import 'package:flutter/material.dart';
import 'package:tendemo/constants/app_colors.dart';
import 'package:tendemo/constants/app_textstyle.dart';

class MovieWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String imageUrl;
  final String title;
  final double? height;
  final double marginTop;
  const MovieWidget({super.key,required this.title,required this.imageUrl, this.height,this.marginTop=25,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:  EdgeInsets.only(top: marginTop),
        height: height??180,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(20),
        decoration:  BoxDecoration(
          image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(title,style: AppTextstyle.poppins(fontSize: 18,color: AppColors.white,fontWeight: FontWeight.w500),),
      ),
    );
  }
}