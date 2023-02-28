import 'package:bonfire/bonfire.dart';
import 'package:me_landing_page/pages/game/components/game_split_sheet.dart';

class Player extends SimplePlayer {
  Player(Vector2 position)
      : super(
          position: position,
          size: Vector2(32.0, 32.0),
          life: 100,
          speed: 100,
          initDirection: Direction.right,
          animation: SimpleDirectionAnimation(
            idleRight: GameSplitSheet().idleRight,
            runRight: GameSplitSheet().runRight,
            idleLeft: GameSplitSheet().idleLeft,
            runLeft: GameSplitSheet().runLeft,
          ),
        );
}
