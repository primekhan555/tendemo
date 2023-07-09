import 'package:flutter/material.dart';
import 'package:tendemo/api_resources/api_models/movie_detail_model.dart';
import 'package:tendemo/constants/app_assets.dart';
import 'package:tendemo/constants/app_colors.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/presentation/common_widgets/seat_analytics.dart';
import 'package:tendemo/presentation/common_widgets/secondary_app_bar.dart';

import '../../common_widgets/primary_button.dart';

class SeatSelectionScreen extends StatefulWidget {
  static const String routeName = "seat_selection_screen";
  final MovieDetailModel params;
  const SeatSelectionScreen({super.key, required this.params});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 77),
          child: SecondaryAppBar(
            title: widget.params.title,
            subTitle: 'In theaters december 22, 2021',
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    AppAssets.theater,
                    fit: BoxFit.contain,
                  ))),
          const SeatAnalytics(),
          150.spaceY
        ],
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.all(26),
          child: Row(
            children: [
              const Flexible(
                  flex: 1,
                  child: PrimaryButton(
                      label: 'Total Price',
                      titleColor: AppColors.darkBlue,
                      title: "\$ 50",
                      bgColor: AppColors.lightGrey,
                      borderColor: AppColors.lightGrey)),
              10.spaceX,
              const Flexible(
                flex: 3,
                child: PrimaryButton(
                    title: 'Proceed to pay'),
              ),
            ],
          )),
    );
  }
}
