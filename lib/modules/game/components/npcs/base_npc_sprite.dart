import 'package:bonfire/bonfire.dart';

class BaseNpcSprite {
  BaseNpcSprite._();

  static Future<SpriteAnimation> idleLeft({
    required String src,
    required int amount,
    required double stepTime,
    required Vector2 textureSize,
    required Vector2 texturePosition,
  }) =>
      SpriteAnimation.load(
        src,
        SpriteAnimationData.sequenced(
          amount: amount,
          stepTime: stepTime,
          textureSize: textureSize,
          texturePosition: texturePosition,
        ),
      );

  static Future<SpriteAnimation> idleRight({
    required String src,
    required int amount,
    required double stepTime,
    required Vector2 textureSize,
    required Vector2 texturePosition,
  }) =>
      SpriteAnimation.load(
        src,
        SpriteAnimationData.sequenced(
          amount: amount,
          stepTime: stepTime,
          textureSize: textureSize,
          texturePosition: texturePosition,
        ),
      );

  static Future<SpriteAnimation> runRight({
    required String src,
    required int amount,
    required double stepTime,
    required Vector2 textureSize,
    required Vector2 texturePosition,
  }) =>
      SpriteAnimation.load(
        src,
        SpriteAnimationData.sequenced(
          amount: amount,
          stepTime: stepTime,
          textureSize: textureSize,
          texturePosition: texturePosition,
        ),
      );

  static Future<SpriteAnimation> runLeft({
    required String src,
    required int amount,
    required double stepTime,
    required Vector2 textureSize,
    required Vector2 texturePosition,
  }) =>
      SpriteAnimation.load(
        src,
        SpriteAnimationData.sequenced(
          amount: amount,
          stepTime: stepTime,
          textureSize: textureSize,
          texturePosition: texturePosition,
        ),
      );
}
