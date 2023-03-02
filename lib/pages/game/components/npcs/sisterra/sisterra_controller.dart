import 'package:bonfire/bonfire.dart';
import 'package:me_landing_page/pages/game/components/npcs/sisterra/sisterra_npc.dart';

class SisterraController extends StateController<SisterraNpc> {
  bool canShowDialog = false;
  @override
  void update(double dt, SisterraNpc component) {
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
