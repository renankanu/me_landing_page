import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:me_landing_page/pages/game/components/npcs/intro/intro_controller.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import '../../../utils/dialog.dart';
import '../base_npc_sprite.dart';

class IntroNpc extends SimpleNpc
    with ObjectCollision, UseStateController<IntroController> {
  static final idleLeft = BaseNpcSprite.idleLeft(
    src: 'npcs/intro.png',
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(24, 24),
    texturePosition: Vector2(96, 0),
  );
  IntroNpc(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          initDirection: Direction.left,
          animation: SimpleDirectionAnimation(
            idleRight: BaseNpcSprite.idleRight(
              src: 'npcs/intro.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 0),
            ),
            runRight: BaseNpcSprite.runRight(
              src: 'npcs/intro.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 48),
            ),
            idleLeft: idleLeft,
            runLeft: BaseNpcSprite.runLeft(
              src: 'npcs/intro.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(96, 96),
            ),
          ),
          speed: 400,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 10),
            align: Vector2(10, 28),
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
          backgroundColor: AppColors.ebonyClay.withOpacity(0.8),
          speed: 100,
          [
            Ballon.sayBallon(
              text: 'Olá, seja bem vindo ao portfólio do ',
              decorationText: 'Renan !',
              decorationColor: AppColors.blueChill,
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              text:
                  'Encontre os NPCs pelo mapa e converse com eles. Aproveite e cuidado com os inimigos! 🧌',
              person: idleLeft.asWidget(),
            ),
          ],
          onClose: () {
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ],
        );
      },
    );
  }
}
