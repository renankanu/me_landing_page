import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_landing_page/pages/game/components/npcs/megaleios/megaleios_controller.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import '../../../utils/dialog.dart';
import '../base_npc_sprite.dart';

class MegaleiosNpc extends SimpleNpc
    with ObjectCollision, UseStateController<MegaleiosController> {
  static final idleRight = BaseNpcSprite.idleRight(
    src: 'npcs/goblinKing_.png',
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(24, 24),
    texturePosition: Vector2(0, 0),
  );
  MegaleiosNpc(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          initDirection: Direction.right,
          animation: SimpleDirectionAnimation(
            idleRight: idleRight,
            runRight: BaseNpcSprite.runRight(
              src: 'npcs/goblinKing_.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 48),
            ),
            idleLeft: BaseNpcSprite.idleLeft(
              src: 'npcs/goblinKing_.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(96, 0),
            ),
            runLeft: BaseNpcSprite.runLeft(
              src: 'npcs/goblinKing_.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(96, 96),
            ),
          ),
          speed: 5,
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

  void execShowTalk(GameComponent player) {
    gameRef.player?.idle();
    gameRef.camera.moveToTargetAnimated(
      player,
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          backgroundColor: AppColors.ebonyClay.withOpacity(0.8),
          speed: 5,
          [
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Sou o ',
                ),
                const TextSpan(
                  text: 'Zephyr!',
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: ' O Renan começou a sua jornada na ',
                ),
                const TextSpan(
                  text: 'Megaleios ',
                  style: TextStyle(
                    color: AppColors.burntSienna,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      ' em 2019, e desde então vem atuando como desenvolvedor mobile, começou trabalhando com React Native e atualmente está trabalhando com ',
                ),
                const TextSpan(
                  text: 'Flutter. ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Aqui ele cria e da manutenção em aplicativos mobile.',
                ),
                const TextSpan(
                  text:
                      'Além do desenvolvimento e manutenção de aplicativos, ele também faz integrações com: ',
                ),
                const TextSpan(
                  text:
                      'Firebase, OneSignal, Google Analytics, Publicação na Play Store e App Store, integração com API\'s, entre outros. ',
                  style: TextStyle(
                    color: AppColors.burntSienna,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'A Megaleios é uma empresa de tecnologia que ',
                ),
                const TextSpan(
                  text: 'desenvolve aplicativos ',
                  style: TextStyle(
                    color: AppColors.burntSienna,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      'para startups e empresas, buscando sempre inovar e trazer o melhor para seus clientes. ',
                ),
              ],
              person: idleRight.asWidget(),
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
