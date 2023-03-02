import 'package:bonfire/bonfire.dart';

import 'about_npc.dart';

class AboutController extends StateController<AboutNpc> {
  bool canShowDialog = false;

  @override
  void update(double dt, AboutNpc component) {
    bool seePlayer = component.checkInterval('seePlayer', 150, dt);
    if (seePlayer) {
      component.seePlayer(
          radiusVision: component.width * 3,
          notObserved: _handleNotObservationPlayer,
          observed: (player) => _handleObservationPlayer(player));
    }
  }

  void _handleObservationPlayer(Player player) {
    if (!canShowDialog) {
      canShowDialog = true;
      component?.execShowTalk(player);
    }
  }

  void _handleNotObservationPlayer() {
    canShowDialog = false;
  }
}
