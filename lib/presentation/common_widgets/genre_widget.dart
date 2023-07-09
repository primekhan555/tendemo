import 'package:flutter/material.dart';
import 'package:tendemo/api_resources/api_models/movie_detail_model.dart';
import 'package:tendemo/extensions/sized_box.dart';

import '../../constants/app_colors.dart';
import 'heading.dart';

class GenreWidget extends StatelessWidget {
  final List<Genres> genres;
  const GenreWidget({super.key, this.genres = const []});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Heading(heading: 'Genres'),
      14.spaceY,
      Wrap(
        children: (genres)
            .map((e) => FittedBox(
                  child: Row(
                    children: [
                      Chip(
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        label: Heading(
                          heading: e.name ?? '',
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        backgroundColor: AppColors.aqua,
                      ),
                      5.spaceX
                    ],
                  ),
                ))
            .toList(),
      ),
    ]);
  }
}
