import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/home/home_page.dart';
import 'package:me_landing_page/theme/app_theme.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenanKanu;',
      theme: AppTheme.darkTheme(),
      home: const HomePage(),
    );
  }
}
