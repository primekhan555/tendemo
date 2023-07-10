import 'package:flutter/material.dart';
import 'package:tendemo/api_resources/api_models/up_coming_movie_model.dart';
import 'package:tendemo/presentation/common_widgets/movie_widget.dart';

import '../../constants/app_constants.dart';
import '../../navigation/navigation.dart';
import '../views/watch_section/movie_detail_screen.dart';
class SearchOpened extends StatelessWidget {
  final List<Results> moviesList;
  const SearchOpened({super.key,this.moviesList=const[]});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount:moviesList.length,
                        itemBuilder: (context, index) {
                          Results item = moviesList[index];
                          return MovieWidget(
                              onTap: () {
                                Navigation.pushNamed(
                                    MovieDetailScreen.routeName,arguments: item.id);
                              },
                              height: 80,
                              marginTop: 0,
                              title: item.title ?? '',
                              imageUrl:
                                  AppConstants.imageUrl(item.posterPath ?? ''));
                        });
  }
}