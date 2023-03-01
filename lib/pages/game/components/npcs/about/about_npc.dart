import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:me_landing_page/pages/game/components/npcs/about/about_controller.dart';
import 'package:me_landing_page/pages/game/utils/dialog.dart';

import '../../../../../shared/app_colors.dart';
import '../base_npc_sprite.dart';

class AboutNpc extends SimpleNpc
    with ObjectCollision, UseStateController<AboutController> {
  static final idleRight = BaseNpcSprite.idleRight(
    src: 'npcs/about.png',
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(24, 24),
    texturePosition: Vector2(0, 0),
  );
  AboutNpc(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          animation: SimpleDirectionAnimation(
            idleRight: BaseNpcSprite.idleRight(
              src: 'npcs/about.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 0),
            ),
            runRight: BaseNpcSprite.runRight(
              src: 'npcs/about.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 48),
            ),
          ),
          speed: 400,
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
  }

  void execShowTalk(GameComponent first) {
    gameRef.camera.moveToTargetAnimated(
      first,
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          backgroundColor: AppColors.ebony.withOpacity(0.8),
          speed: 100,
          [
            Ballon.sayBallon(
              text: 'Eu sou Adalyn, vou te contar um pouco sobre o Renan.',
              person: idleRight.asWidget(),
            ),
          ],
          onClose: () => gameRef.camera.moveToPlayerAnimated(zoom: 1),
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ],
        );
      },
    );
  }
}
