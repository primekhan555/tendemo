import 'package:flutter/material.dart';
import 'package:tendemo/api_resources/api_models/up_coming_movie_model.dart';
import 'package:tendemo/core/core.dart';

import '../../constants/app_constants.dart';
import '../../navigation/navigation.dart';
import '../views/watch_section/movie_detail_screen.dart';
import 'movie_widget.dart';

class MovieCommon extends StatelessWidget {
  final List<Results> moviesList;
  const MovieCommon({super.key, this.moviesList = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moviesList.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      itemBuilder: (BuildContext context, int index) {
        Results item = moviesList[index];
        return MovieWidget(
            onTap: () {
              Navigation.pushNamed(MovieDetailScreen.routeName,
                  arguments: item.id);
            },
            title: item.title ?? '',
            imageUrl: AppConstants.imageUrl(item.posterPath ?? ''));
      },
    );
  }
}
