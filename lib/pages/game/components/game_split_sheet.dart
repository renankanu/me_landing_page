import 'package:bonfire/bonfire.dart';

class GameSplitSheet {
  Future<SpriteAnimation> get idleRight async => SpriteAnimation.load(
        'players/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(32, 32),
          stepTime: 0.15,
          texturePosition: Vector2(96, 0),
        ),
      );

  Future<SpriteAnimation> get runRight async => SpriteAnimation.load(
        'players/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          textureSize: Vector2(32, 32),
          stepTime: 0.15,
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get idleLeft async => SpriteAnimation.load(
        'players/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(32, 32),
          stepTime: 0.15,
          texturePosition: Vector2(96, 32),
        ),
      );

  Future<SpriteAnimation> get runLeft async => SpriteAnimation.load(
        'players/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          textureSize: Vector2(32, 32),
          stepTime: 0.15,
          texturePosition: Vector2(0, 32),
        ),
      );
}
