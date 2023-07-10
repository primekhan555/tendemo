import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendemo/api_resources/api_models/up_coming_movie_model.dart';
import 'package:tendemo/presentation/base_widgets/base_widget.dart';
import 'package:tendemo/presentation/common_widgets/movie_common.dart';
import 'package:tendemo/presentation/common_widgets/search_opened.dart';
import 'package:tendemo/presentation/common_widgets/search_submitted.dart';
import 'package:tendemo/providers/watch_provider.dart';

class WatchComponent extends StatefulWidget {
  const WatchComponent({super.key});

  @override
  State<WatchComponent> createState() => _WatchComponentState();
}

class _WatchComponentState extends State<WatchComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WatchProvider>(builder: (context, pro, child) {
      return BaseWidget(
      state: pro.upComingRes,
      builder: (context) {
        UpComingMoviesModel data =
            pro.upComingRes.data as UpComingMoviesModel;
        return (pro.appBarState == AppBarState.searchOpened &&
                    pro.searchController.text.isNotEmpty) ||
                pro.appBarState == AppBarState.searchSubmit
            ? SearchSubmitted(moviesList: pro.filtered)
           
            : pro.appBarState == AppBarState.searchOpened
                ? SearchOpened(moviesList: data.results ?? [])
                : MovieCommon(moviesList: data.results ?? []);
       
      });
    });
  }
}
