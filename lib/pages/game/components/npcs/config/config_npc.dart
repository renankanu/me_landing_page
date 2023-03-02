import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_landing_page/pages/game/components/npcs/config/config_controller.dart';
import 'package:me_landing_page/shared/app_colors.dart';

import '../../../utils/dialog.dart';
import '../base_npc_sprite.dart';

class ConfigNpc extends SimpleNpc
    with ObjectCollision, UseStateController<ConfigController> {
  static final idleLeft = BaseNpcSprite.idleLeft(
    src: 'npcs/intro.png',
    amount: 4,
    stepTime: 0.15,
    textureSize: Vector2(24, 24),
    texturePosition: Vector2(96, 0),
  );
  ConfigNpc(Vector2 position)
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
                  text: 'Olá, sou o ',
                ),
                const TextSpan(
                  text: 'Elowen! ',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      'Para agilizar o desenvolvimento com Flutter no macOS, o Renan utiliza algumas configurações e ferramentas adicionais:',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: '• Makefile: ',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      ' O Makefile é um arquivo que automatiza tarefas repetitivas no terminal. É possível criar um Makefile para compilar o projeto Flutter, rodar testes e executar outras tarefas. Isso pode economizar tempo e reduzir erros manuais.',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: '• VSCode extension: ',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      'Ele utiliza algumas extensões para facilitar o desenvolvimento com Flutter no VSCode. Uma delas é a ',
                ),
                const TextSpan(
                  text:
                      'Awesome Flutter Snippets, Flutter, Dart, GitLens, Tokyo Night Theme, Material Icon Theme, Bloc ',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      'entre outras. Para saber mais sobre as extensões, volte ao site e verifique a seção ',
                ),
                const TextSpan(
                  text: 'Config.',
                  style: TextStyle(
                    color: AppColors.blueChill,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: '• VSCode settings: ',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      'As configurações do Visual Studio Code podem ser personalizadas para atender às necessidades específicas do desenvolvedor. É possível adicionar atalhos de teclado personalizados, definir configurações de formatação de código e ajustar as configurações de depuração',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: '• Git config: ',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      'O Git é uma ferramenta importante para o controle de versão de projetos. É possível configurar o Git para melhorar o fluxo de trabalho do desenvolvedor, incluindo a configuração de aliases para comandos frequentemente usados e a configuração de merge e diferenças padrão.',
                ),
              ],
              person: idleLeft.asWidget(),
            ),
            Ballon.sayBallon(
              messages: [
                const TextSpan(
                  text: '• .zshrc: ',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text:
                      'O arquivo .zshrc é um arquivo de configuração do terminal que pode ser personalizado para adicionar atalhos de terminal personalizados, exportar variáveis de ambiente e definir funções personalizadas. Isso pode tornar o fluxo de trabalho do desenvolvedor mais eficiente e produtivo.',
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
