import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
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
          speed: 5,
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
    gameRef.player?.idle();
    gameRef.camera.moveToTargetAnimated(
      first,
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          backgroundColor: AppColors.ebony.withOpacity(0.8),
          speed: 5,
          [
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Eu sou o ',
                ),
                const TextSpan(
                  text: 'Adalyn ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const TextSpan(
                  text: ', vou te contar um pouco sobre o Renan.',
                ),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text:
                      'Ele é um desenvolvedor de aplicativos móveis com uma vasta experiência na área, tendo iniciado sua carreira em 2015. Desde então, você tem se dedicado a aprimorar suas habilidades na criação de aplicativos para Android e iOS. ',
                ),
                const TextSpan(
                  text:
                      'Nos últimos anos, ele se especializou no uso do framework ',
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
                  text:
                      ' Mas não se preocupe, ele também tem experiência com outras tecnologias como ',
                ),
                const TextSpan(
                  text: 'Dart, React Native, Docker, Firebase, Git, Linux ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueChill,
                  ),
                ),
                const TextSpan(
                  text: 'e muito mais. ',
                ),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text:
                      'Continue a caminhar entre os NPCs para saber mais sobre ele.',
                ),
              ],
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
