import 'package:hive_flutter/adapters.dart';

import '../constants/app_boxes.dart';

class AppLocal {
  static final AppLocal instance = AppLocal._internal();
  AppLocal._internal();

  Future initStorage() async {
    await Hive.initFlutter();
    for (var box in AppBoxes.boxList) {
      await Hive.openBox(box);
    }
  }

  Box box(String box) => Hive.box(box);
}
