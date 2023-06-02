import 'package:bonfire/bonfire.dart';

import 'orc.dart';

class OrcController extends StateController<MyOrc> {
  double attack = 20;
  bool enableBehaviors = true;

  @override
  void update(double dt, MyOrc component) {
    if (!enableBehaviors) return;

    if (!gameRef.sceneBuilderStatus.isRunning) {
      component.seeAndMoveToPlayer(
        closePlayer: (player) {
          component.execAttack(attack);
        },
        radiusVision: component.width * 2,
      );
    }
  }
}
