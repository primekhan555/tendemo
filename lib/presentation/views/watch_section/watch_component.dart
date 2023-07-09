import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendemo/api_resources/api_models/up_coming_movie_model.dart';
import 'package:tendemo/constants/app_colors.dart';
import 'package:tendemo/constants/app_constants.dart';
import 'package:tendemo/constants/app_textstyle.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/navigation/navigation.dart';
import 'package:tendemo/presentation/base_widgets/base_widget.dart';
import 'package:tendemo/presentation/common_widgets/movie_widget.dart';
import 'package:tendemo/presentation/views/watch_section/movie_detail_screen.dart';
import 'package:tendemo/providers/watch_provider.dart';

import '../../common_widgets/search_movie_widget.dart';

class WatchComponent extends StatefulWidget {
  const WatchComponent({super.key});

  @override
  State<WatchComponent> createState() => _WatchComponentState();
}

class _WatchComponentState extends State<WatchComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<WatchProvider>(builder: (context, pro, child) {
      return BaseWidget(
          state: pro.upComingRes,
          builder: (context) {
            UpComingMoviesModel data =
                pro.upComingRes.data as UpComingMoviesModel;
            return (pro.appBarState == AppBarState.searchOpened &&
                    pro.searchController.text.isNotEmpty ) || pro.appBarState==AppBarState.searchSubmit
                ? Column(
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
                          itemCount:pro.filtered.length,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (BuildContext context, int index) {
                            Results item=pro.filtered[index];
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
                  )
                : pro.appBarState == AppBarState.searchOpened
                    ? GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: data.results?.length ?? 0,
                        itemBuilder: (context, index) {
                          Results item = data.results![index];
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
                        })
                    : ListView.builder(
                        itemCount: data.results?.length ?? 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        itemBuilder: (BuildContext context, int index) {
                          Results item = data.results![index];
                          return MovieWidget(
                              onTap: () {
                                Navigation.pushNamed(
                                    MovieDetailScreen.routeName,arguments: item.id);
                              },
                              title: item.title ?? '',
                              imageUrl:
                                  AppConstants.imageUrl(item.posterPath ?? ''));
                        },
                      );
          });
    }));
  }
}
