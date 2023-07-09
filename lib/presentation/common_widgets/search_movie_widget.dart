import 'package:flutter/material.dart';
import 'package:tendemo/constants/app_textstyle.dart';
import 'package:tendemo/extensions/sized_box.dart';

import '../../constants/app_colors.dart';

class SearchMovieWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String imageUrl;
  final String title;
  final String genre;
  final double? height;
  final double marginTop;
  const SearchMovieWidget({super.key,required this.title,required this.genre, required this.imageUrl, this.height,this.marginTop=25,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin:  EdgeInsets.only(top: marginTop),
            height: 100,
            width: 130,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(20),
            decoration:  BoxDecoration(
              image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)
            ),
            
            // child: Text(title,style: AppTextstyle.poppins(fontSize: 18,color: AppColors.white,fontWeight: FontWeight.w500),),
          ),
          21.spaceX,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
               Text(title,maxLines: 1, style: AppTextstyle.poppins(color: AppColors.darkBlue,fontSize: 16,fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text(genre,maxLines: 1, style: AppTextstyle.poppins(color: AppColors.lightGrey,fontSize: 12,fontWeight: FontWeight.w500)),
            ],),
          ),
          Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,color: AppColors.skyBlue,size: 30,))
        ],
      ),
    );
  }
}