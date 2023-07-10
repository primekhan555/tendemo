import 'package:flutter/material.dart';
import 'package:tendemo/api_resources/api_models/up_coming_movie_model.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/presentation/common_widgets/search_movie_widget.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_textstyle.dart';
import '../../navigation/navigation.dart';
import '../views/watch_section/movie_detail_screen.dart';
class SearchSubmitted extends StatelessWidget {
  final List<Results> moviesList;
  const SearchSubmitted({super.key,this.moviesList=const[]});

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.spaceY,
                      Container(
                        margin: const EdgeInsets.only(left: 21),
                        child: Text('Top Result',
                            style: AppTextstyle.poppins(
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w500,
                                fontSize: 12)),
                      ),
                      const Divider(indent: 20, endIndent: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount:moviesList.length,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (BuildContext context, int index) {
                            Results item=moviesList[index];
                            return  SearchMovieWidget(
                              onTap: () {
                                Navigation.pushNamed(
                                    MovieDetailScreen.routeName,arguments: item.id);
                              },
                                title: item.title??'',
                                genre: item.title??"",
                                imageUrl:AppConstants.imageUrl(item.posterPath ?? ''));
                          },
                        ),
                      ),
                    ],
                  );
  }
}