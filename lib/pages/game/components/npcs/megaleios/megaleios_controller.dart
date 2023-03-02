import 'package:bonfire/bonfire.dart';

import 'megaleios_npc.dart';

class MegaleiosController extends StateController<MegaleiosNpc> {
  bool canShowDialog = false;
  @override
  void update(double dt, MegaleiosNpc component) {
    bool seePlayer = component.checkInterval('seePlayer', 250, dt);
    if (seePlayer) {
      component.seePlayer(
          radiusVision: component.width * 3,
          observed: (player) => _handleObservationPlayer(player));
    }
  }

  void _handleObservationPlayer(Player player) {
    if (!canShowDialog) {
      canShowDialog = true;
      component?.execShowTalk(player);
    }
  }
}
