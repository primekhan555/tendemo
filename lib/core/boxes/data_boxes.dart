import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/app_boxes.dart';

class DataBoxes {
  static final DataBoxes ins = DataBoxes._internal();
  DataBoxes._internal();
  final Box _box = Hive.box(AppBoxes.dataBox);
  setData(String key, var value) => _box.put(key, value);
  getData(String key) => _box.get(key);
  clearData(String key) => _box.delete(key);
}
