import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:me_landing_page/pages/game/components/orc/orc_controller.dart';
import 'package:me_landing_page/pages/game/components/orc/orc_sprite.dart';

class MyOrc extends SimpleEnemy
    with
        ObjectCollision,
        JoystickListener,
        MovementByJoystick,
        AutomaticRandomMovement,
        UseBarLife,
        UseStateController<OrcController> {
  MyOrc(Vector2 position)
      : super(
          animation: OrcSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2(40, 40),
          speed: 50,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 10),
            align: Vector2(8, 28),
          ),
        ],
      ),
    );

    setupBarLife(
      borderRadius: BorderRadius.circular(2),
      borderWidth: 2,
    );
  }

  void execAttack(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) {
      return;
    }
    simpleAttackMelee(
      damage: 0,
      interval: 1000,
      size: Vector2(16, 16),
      sizePush: 8,
    );
  }

  @override
  void removeLife(double life) {
    showDamage(
      life,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.white,
      ),
    );
    super.removeLife(life);
  }

  @override
  void joystickAction(JoystickActionEvent event) {}

  @override
  void moveTo(Vector2 position) {}
}
