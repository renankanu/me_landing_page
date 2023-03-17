import 'package:bonfire/bonfire.dart';

class OrcSpriteSheet {
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        'orcs/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'orcs/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'orcs/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'orcs/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 96),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
      );
}
