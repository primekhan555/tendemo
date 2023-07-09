
import 'package:flutter/material.dart';
import 'package:tendemo/extensions/sized_box.dart';

import '../../constants/app_colors.dart';
import 'heading.dart';
class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  List<int> days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Heading(heading: 'Date')),
            14.spaceY,
            SizedBox(
              height: 35,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20),
                itemCount: days.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Chip(
                        elevation: 1,
                        shadowColor: AppColors.skyBlue,
                        backgroundColor: AppColors.skyBlue,
                        label: Heading(
                          heading: '${days[index]} May',
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      10.spaceX
                    ],
                  );
                },
              ),
            ),
    ],);
  }
}