import 'package:bonfire/bonfire.dart';
import 'package:me_landing_page/pages/game/components/game_split_sheet.dart';

class MyPlayer extends SimplePlayer with ObjectCollision {
  MyPlayer(Vector2 position)
      : super(
          position: position,
          size: Vector2(64, 64),
          animation: SimpleDirectionAnimation(
            idleRight: GameSplitSheet().idleRight,
            runRight: GameSplitSheet().runRight,
            idleLeft: GameSplitSheet().idleLeft,
            runLeft: GameSplitSheet().runLeft,
          ),
          speed: 400,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(24, 16),
            align: Vector2(20, 38),
          ),
        ],
      ),
    );
  }
}
