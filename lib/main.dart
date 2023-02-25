import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/home/home_page.dart';
import 'package:me_landing_page/theme/app_theme.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setPathUrlStrategy();

  runApp(const LandingPage());
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenanKanu;',
      theme: AppTheme.darkTheme(),
      home: const HomePage(),
    );
  }
}
