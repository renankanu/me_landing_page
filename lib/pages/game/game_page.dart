import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

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
        body: BonfireWidget(
          joystick: Joystick(
            directional: JoystickDirectional(),
          ), // required
          map: WorldMapByTiled(
            'map/map.json',
            forceTileSize: Vector2(
              32,
              32,
            ),
          ),
        ));
  }
}
