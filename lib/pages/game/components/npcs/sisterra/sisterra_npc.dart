import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_landing_page/pages/game/components/npcs/sisterra/sisterra_controller.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import '../../../utils/dialog.dart';
import '../base_npc_sprite.dart';

class SisterraNpc extends SimpleNpc
    with ObjectCollision, UseStateController<SisterraController> {
  static final idleLeft = BaseNpcSprite.idleLeft(
    src: 'npcs/dragon_.png',
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(24, 24),
    texturePosition: Vector2(96, 0),
  );
  SisterraNpc(Vector2 position)
      : super(
          position: position,
          size: Vector2(40, 40),
          initDirection: Direction.left,
          animation: SimpleDirectionAnimation(
            idleRight: BaseNpcSprite.idleRight(
              src: 'npcs/dragon_.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 0),
            ),
            runRight: BaseNpcSprite.runRight(
              src: 'npcs/dragon_.png',
              amount: 4,
              stepTime: 0.15,
              textureSize: Vector2(24, 24),
              texturePosition: Vector2(0, 48),
            ),
            idleLeft: idleLeft,
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
                  text: 'Merrick! ',
                  style: TextStyle(
                    color: AppColors.blueChill,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      ' Vou contar sobre a jornada do Renan empresa Sisterra.',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text:
                      'O Renan começou a jornada na sisterra, em 2015. Começou trabalhando com  ',
                ),
                const TextSpan(
                  text: 'Java.',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: ' para aplicativos mobile e back-end.',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Logo depois, ele começou a trabalhar com  ',
                ),
                const TextSpan(
                  text: 'Kotlin.',
                  style: TextStyle(
                    color: Colors.lime,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: ' também para aplicativos mobile.',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'Logo depois, ele começou a trabalhar com  ',
                ),
                const TextSpan(
                  text: 'PHP.',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: ' para back-end, utilizando o padrão ',
                ),
                const TextSpan(
                  text: 'DDD e CQRS ',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: 'e aplicando testes unitários com cobertura de 100%.',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text:
                      'Nesse mesmo período, ele começou atuar com alguns serviços da ',
                ),
                const TextSpan(
                  text: 'AWS ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: ', tais como: ',
                ),
                const TextSpan(
                  text: 'EC2, S3, RDS, Lambda, SNS, SQS, SES',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: 'E também trabalhou com ',
                ),
                const TextSpan(
                  text: 'Docker.',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      ' para automatizar a criação de ambientes de desenvolvimento e produção.',
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
