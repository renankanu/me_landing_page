import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'components/player.dart';

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
          directional: JoystickDirectional(),
        ),
        map: WorldMapByTiled(
          'map/map.json',
          forceTileSize: Vector2(
            32,
            32,
          ),
        ),
        player: MyPlayer(
          Vector2(64, 64),
        ),
        showCollisionArea: true,
      ),
    );
  }
}
