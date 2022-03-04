import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/core/theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RenanKanu;',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: Themes.lightTheme,
    ),
  );
}
