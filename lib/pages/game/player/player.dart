import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/game/player/game_split_sheet.dart';
import 'package:me_landing_page/pages/game/player/player_controller.dart';

class MyPlayer extends SimplePlayer
    with ObjectCollision, UseStateController<MyPlayerController> {
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
          speed: 200,
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

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (hasController) {
      controller.onReceiveDamage(damage);
    }
    super.receiveDamage(attacker, damage, identify);
  }

  void execShowEmote() {
    if (hasGameRef) {
      add(
        AnimatedFollowerObject(
          animation: SpriteAnimation.load(
            "players/emote_exclamation.png",
            SpriteAnimationData.sequenced(
              amount: 8,
              stepTime: 0.1,
              textureSize: Vector2(32, 32),
            ),
          ),
          size: Vector2.all(width / 2),
          positionFromTarget: Vector2(
            18,
            -6,
          ),
        ),
      );
    }
  }

  void execShowDamage(double damage) {
    showDamage(
      damage,
      config: const TextStyle(
        fontSize: 8,
        color: Colors.red,
      ),
    );
  }
}
