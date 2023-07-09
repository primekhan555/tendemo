import 'package:flutter/material.dart';
import 'package:tendemo/api_resources/api_models/movie_detail_model.dart';
import 'package:tendemo/constants/app_assets.dart';
import 'package:tendemo/constants/app_colors.dart';
import 'package:tendemo/constants/app_textstyle.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/presentation/common_widgets/date_selection.dart';
import 'package:tendemo/presentation/common_widgets/heading.dart';
import 'package:tendemo/presentation/common_widgets/primary_button.dart';
import 'package:tendemo/presentation/common_widgets/secondary_app_bar.dart';
import 'package:tendemo/presentation/common_widgets/theater_selection.dart';
import 'package:tendemo/presentation/views/watch_section/seat_selection_screen.dart';

import '../../../navigation/navigation.dart';

class TheaterSelectionScreen extends StatefulWidget {
  static const String routeName = "theater_selection_screen";
  final MovieDetailModel params;

  const TheaterSelectionScreen({super.key, required this.params});

  @override
  State<TheaterSelectionScreen> createState() => _TheaterSelectionScreenState();
}

class _TheaterSelectionScreenState extends State<TheaterSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size(double.infinity, 77),
        child: SecondaryAppBar(
          title: widget.params.title,
          subTitle: 'In theaters december 22, 2021',
        )),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateSelection(),
            40.spaceY,
            TheaterSelection()
          ]),
      bottomSheet: Container(
          padding: const EdgeInsets.all(26),
          child: PrimaryButton(
              onTap: () => Navigation.pushNamed(SeatSelectionScreen.routeName,
                  arguments: widget.params),
              title: 'Select Seats')),
    );
  }
}
