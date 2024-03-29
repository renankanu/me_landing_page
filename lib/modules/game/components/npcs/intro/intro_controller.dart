import 'package:bonfire/bonfire.dart';
import 'package:me_landing_page/modules/game/components/npcs/intro/intro_npc.dart';

class IntroController extends StateController<IntroNpc> {
  bool canShowDialog = false;
  @override
  void update(double dt, IntroNpc component) {
    bool seePlayer = component.checkInterval('seePlayer', 250, dt);
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
