import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendemo/api_resources/api_models/movie_detail_model.dart';
import 'package:tendemo/constants/app_colors.dart';
import 'package:tendemo/constants/app_constants.dart';
import 'package:tendemo/extensions/build_context.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/navigation/navigation.dart';
import 'package:tendemo/presentation/base_widgets/base_widget.dart';
import 'package:tendemo/presentation/common_widgets/genre_widget.dart';
import 'package:tendemo/presentation/common_widgets/heading.dart';
import 'package:tendemo/presentation/common_widgets/primary_button.dart';
import 'package:tendemo/presentation/views/watch_section/theater_selection_screen.dart';
import 'package:tendemo/presentation/views/watch_section/trailer_screen.dart';

import '../../../providers/watch_provider.dart';

class MovieDetailScreen extends StatefulWidget {
  static const String routeName = "movie_detail_screen";
  final int params;
  const MovieDetailScreen({super.key,required this.params});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WatchProvider>().getMovieDetail(widget.params.toString());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Watch'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<WatchProvider>(
        builder: (context,pro,child) {
          return BaseWidget(
            state: pro.movieDetailRes,
            builder: (context) {
              MovieDetailModel detail=pro.movieDetailRes.data as MovieDetailModel;
              return Container(
                child: SingleChildScrollView(
                  child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      height: context.mediaQuery.size.height / 1.7,
                      decoration:  BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(AppConstants.imageUrl(detail.posterPath??'')))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 66),
                        child:
                            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                          const Heading(heading: 'In theaters december 22, 2021',color: AppColors.white),
                          15.spaceY,
                           PrimaryButton(
                            onTap: ()=>Navigation.pushNamed(TheaterSelectionScreen.routeName,arguments: detail),
                            
                            title: 'Get Tickets'),
                          10.spaceY,
                           PrimaryButton(
                            onTap: ()=>Navigation.pushNamed(TrailerScreen.routeName,arguments: detail.id),
                              title: 'Watch Trailer',
                              bgColor: Colors.transparent,
                              prefixIcon: Icons.play_arrow),
                          34.spaceY
                        ]),
                      ),
                    ),
                    27.spaceY,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         GenreWidget(genres:detail.genres??[]),
                          22.spaceY,
                          const Divider(),
                          15.spaceY,
                          const Heading(heading: 'Overview'),
                          14.spaceY,
                           Heading(heading: detail.overview??'',
                          color: AppColors.lightGrey,fontWeight: FontWeight.w400,fontSize: 12,
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              );
            }
          );
        }
      ),
    );
  }
}
