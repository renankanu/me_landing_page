import 'package:bonfire/bonfire.dart';

class AboutNpc extends SimpleNpc {
  AboutNpc(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              'npcs/about.png',
              SpriteAnimationData.sequenced(
                amount: 4,
                textureSize: Vector2(24, 24),
                stepTime: 0.15,
                texturePosition: Vector2(0, 0),
              ),
            ),
            runRight: SpriteAnimation.load(
              'npcs/about.png',
              SpriteAnimationData.sequenced(
                amount: 4,
                textureSize: Vector2(24, 24),
                stepTime: 0.15,
                texturePosition: Vector2(0, 48),
              ),
            ),
          ),
          speed: 400,
        );
}
