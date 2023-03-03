import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_landing_page/pages/game/components/npcs/skill/skill_controller.dart';

import '../../../../../shared/app_colors.dart';
import '../../../utils/dialog.dart';
import '../base_npc_sprite.dart';

class SkillNpc extends SimpleNpc
    with ObjectCollision, UseStateController<SkillController> {
  static final idleLeft = BaseNpcSprite.idleLeft(
    src: 'npcs/skill.png',
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(24, 24),
    texturePosition: Vector2(96, 0),
  );
  SkillNpc(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          initDirection: Direction.left,
          animation: SimpleDirectionAnimation(
            idleRight: BaseNpcSprite.idleRight(
              src: 'npcs/skill.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 0),
            ),
            runRight: BaseNpcSprite.runRight(
              src: 'npcs/skill.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 48),
            ),
            idleLeft: idleLeft,
            runLeft: BaseNpcSprite.runLeft(
              src: 'npcs/skill.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(96, 96),
            ),
          ),
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
                  text: 'Eu sou o NPC de skills, ',
                ),
                const TextSpan(
                  text: 'Kael.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Aqui sao mostradas algumas das ',
                ),
                const TextSpan(
                  text: ' tecnologias ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                const TextSpan(
                  text: ' que o Renan sabe.',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Essas sao as tecnologias: ',
                ),
                const TextSpan(
                  text:
                      'Flutter, Dart, Firebase, Kotlin, React Native, Google Play, App Store, AWS, Docker, Git, JavaScript, TypeScript, PHP, Linux e PostMan.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Essas são as mais importantes que você precisa saber.',
                ),
                const TextSpan(
                  text:
                      ' Agora vá para o próximo NPC. Tome cuidado com os inimigos.',
                  style: TextStyle(),
                ),
              ],
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
