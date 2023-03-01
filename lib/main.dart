import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/routes/go_router.dart';
import 'package:me_landing_page/theme/app_theme.dart';
import 'package:url_strategy/url_strategy.dart';

import 'pages/game/components/npcs/intro/intro_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  BonfireInjector().putFactory((i) => IntroController());

  setPathUrlStrategy();

  runApp(const LandingPage());
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RenanKanu;',
      theme: AppTheme.darkTheme(),
      routerConfig: Routes.router,
    );
  }
}
