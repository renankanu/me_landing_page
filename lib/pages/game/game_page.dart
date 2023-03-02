import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/game/components/interface/my_player_interface.dart';
import 'package:me_landing_page/pages/game/components/npcs/about/about_npc.dart';
import 'package:me_landing_page/pages/game/components/npcs/education/education_npc.dart';
import 'package:me_landing_page/pages/game/components/npcs/sisterra/sisterra_npc.dart';
import 'package:me_landing_page/pages/game/components/npcs/skill/skill_npc.dart';
import 'package:me_landing_page/pages/game/components/orc/orc.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import 'components/npcs/caution/caution_npc.dart';
import 'components/npcs/config/config_npc.dart';
import 'components/npcs/intro/intro_npc.dart';
import 'components/npcs/megaleios/megaleios_npc.dart';
import 'player/player.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ebonyClay,
      appBar: AppBar(
        backgroundColor: AppColors.ebonyClay,
        elevation: 3,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BonfireWidget(
        backgroundColor: AppColors.ebonyClay,
        joystick: Joystick(
          keyboardConfig: KeyboardConfig(
            enable: true,
          ),
          directional: JoystickDirectional(),
        ),
        map: WorldMapByTiled(
          'map/map.json',
          forceTileSize: Vector2(
            32,
            32,
          ),
          objectsBuilder: {
            'npc': (properties) => AboutNpc(
                  properties.position,
                ),
            'intro': (properties) => IntroNpc(
                  properties.position,
                ),
            'skill': (properties) => SkillNpc(
                  properties.position,
                ),
            'caution': (properties) => CautionNpc(
                  properties.position,
                ),
            'config': (properties) => ConfigNpc(
                  properties.position,
                ),
            'job_one': (properties) => SisterraNpc(
                  properties.position,
                ),
            'job_two': (properties) => MegaleiosNpc(
                  properties.position,
                ),
            'education': (properties) => EducationNpc(
                  properties.position,
                ),
            'orc': (properties) => MyOrc(
                  properties.position,
                ),
          },
        ),
        interface: MyPlayerInterface(),
        player: MyPlayer(
          Vector2(64, 64),
        ),
      ),
    );
  }
}
