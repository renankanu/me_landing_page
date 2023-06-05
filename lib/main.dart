import 'package:bonfire/bonfire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:me_landing_page/modules/game/components/interface/bar_life_controller.dart';
import 'package:me_landing_page/modules/game/components/npcs/about/about_controller.dart';
import 'package:me_landing_page/modules/game/components/npcs/caution/caution_controller.dart';
import 'package:me_landing_page/modules/game/components/npcs/config/config_controller.dart';
import 'package:me_landing_page/modules/game/components/npcs/education/education_controller.dart';
import 'package:me_landing_page/modules/game/components/npcs/megaleios/megaleios_controller.dart';
import 'package:me_landing_page/modules/game/components/npcs/sisterra/sisterra_controller.dart';
import 'package:me_landing_page/modules/game/components/npcs/skill/skill_controller.dart';
import 'package:me_landing_page/modules/game/components/orc/orc_controller.dart';
import 'package:me_landing_page/modules/game/player/player_controller.dart';
import 'package:me_landing_page/modules/home/controllers/home_controller.dart';
import 'package:me_landing_page/routes/go_router.dart';
import 'package:me_landing_page/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';
import 'modules/game/components/npcs/intro/intro_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  BonfireInjector().putFactory((i) => MyPlayerController());
  BonfireInjector().putFactory((i) => IntroController());
  BonfireInjector().putFactory((i) => AboutController());
  BonfireInjector().putFactory((i) => SkillController());
  BonfireInjector().putFactory((i) => CautionController());
  BonfireInjector().putFactory((i) => ConfigController());
  BonfireInjector().putFactory((i) => SisterraController());
  BonfireInjector().putFactory((i) => MegaleiosController());
  BonfireInjector().putFactory((i) => EducationController());
  BonfireInjector().putFactory((i) => OrcController());
  BonfireInjector().put((i) => BarLifeController());

  setPathUrlStrategy();

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );

  runApp(const LandingPage());
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeController(),
        ),
      ],
      child: MaterialApp.router(
        title: 'RenanKanu;',
        theme: AppTheme.darkTheme(),
        routerConfig: Routes.router,
      ),
    );
  }
}
