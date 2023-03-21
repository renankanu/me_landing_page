import 'package:flutter/material.dart';

import '../../../../../../model/file_config.dart';

class ItemConfig extends ValueNotifier {
  ItemConfig(super.value);

  static ValueNotifier<List<FileConfig>> listConfigs =
      ValueNotifier<List<FileConfig>>(FileConfig.files);

  static void changeValueExpanded(FileConfig fileConfig) {
    final list = listConfigs.value;
    final index = list.indexOf(fileConfig);
    list[index].isExpanded = !list[index].isExpanded;
    listConfigs.value = list;
    listConfigs.notifyListeners();
  }
}
