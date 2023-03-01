import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/game/components/npcs/about/about_npc.dart';

import 'components/npcs/intro/intro_npc.dart';
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
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Game'),
      ),
      body: BonfireWidget(
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
          },
        ),
        player: MyPlayer(
          Vector2(64, 64),
        ),
      ),
    );
  }
}
