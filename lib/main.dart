import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/core/config/firebase_config.dart';
import 'app/core/theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: platformOptions,
  );

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
