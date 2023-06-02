import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_landing_page/modules/game/components/npcs/education/education_controller.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import '../../../utils/dialog.dart';
import '../base_npc_sprite.dart';

class EducationNpc extends SimpleNpc
    with ObjectCollision, UseStateController<EducationController> {
  static final idleRight = BaseNpcSprite.idleRight(
    src: 'npcs/dragon_.png',
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(24, 24),
    texturePosition: Vector2(0, 0),
  );
  EducationNpc(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          initDirection: Direction.right,
          animation: SimpleDirectionAnimation(
            idleRight: idleRight,
            runRight: BaseNpcSprite.runRight(
              src: 'npcs/dragon_.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 48),
            ),
            idleLeft: BaseNpcSprite.idleRight(
              src: 'npcs/dragon_.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(96, 0),
            ),
            runLeft: BaseNpcSprite.runLeft(
              src: 'npcs/dragon_.png',
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
      zoom: 1,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          backgroundColor: AppColors.ebonyClay.withOpacity(0.8),
          speed: 5,
          [
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Ola, eu sou o ',
                ),
                const TextSpan(
                  text: 'Smaug ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                const TextSpan(
                  text:
                      'vou te contar um pouco sobre a formação acadêmica do Renan.',
                ),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(text: 'Renan é formado em '),
                const TextSpan(
                  text: 'Análise e Desenvolvimento de Sistemas ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const TextSpan(text: 'pela '),
                const TextSpan(
                  text: 'UNIPAR ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const TextSpan(text: '(Universidade Paranaense).'),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(text: 'Renan é formado em '),
                const TextSpan(
                  text: 'Análise e Desenvolvimento de Sistemas ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const TextSpan(text: 'pela '),
                const TextSpan(
                  text: 'UNIPAR ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const TextSpan(text: '(Universidade Paranaense).'),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(text: 'Ele começou a estudar em '),
                const TextSpan(
                  text: '2013 ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const TextSpan(text: 'e se formou em '),
                const TextSpan(
                  text: '2015',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const TextSpan(text: '. Ele também fez um curso de '),
                const TextSpan(
                  text: 'Clean Architecture ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const TextSpan(text: 'na Udemy.'),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                    text:
                        'Neste curso ele aprendeu a usar TDD, Design Patterns, Clean Code, Clean Architecture, SOLID da melhor forma possível.'),
              ],
              person: idleRight.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                    text:
                        'E aqui se encerra a história do Renan neste jogo, espero que tenha gostado. E volte sempre! Até mais!'),
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
