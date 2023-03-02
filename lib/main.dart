import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/game/components/npcs/about/about_controller.dart';
import 'package:me_landing_page/pages/game/components/npcs/caution/caution_controller.dart';
import 'package:me_landing_page/pages/game/components/npcs/megaleios/megaleios_controller.dart';
import 'package:me_landing_page/pages/game/components/npcs/sisterra/sisterra_controller.dart';
import 'package:me_landing_page/pages/game/components/npcs/skill/skill_controller.dart';
import 'package:me_landing_page/pages/game/components/orc/orc_controller.dart';
import 'package:me_landing_page/pages/game/player/player_controller.dart';
import 'package:me_landing_page/routes/go_router.dart';
import 'package:me_landing_page/theme/app_theme.dart';
import 'package:url_strategy/url_strategy.dart';

import 'pages/game/components/npcs/intro/intro_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  BonfireInjector().putFactory((i) => MyPlayerController());
  BonfireInjector().putFactory((i) => IntroController());
  BonfireInjector().putFactory((i) => AboutController());
  BonfireInjector().putFactory((i) => SkillController());
  BonfireInjector().putFactory((i) => CautionController());
  BonfireInjector().putFactory((i) => SisterraController());
  BonfireInjector().putFactory((i) => MegaleiosController());
  BonfireInjector().putFactory((i) => OrcController());

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
