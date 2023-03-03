import 'package:bonfire/bonfire.dart';
import 'package:me_landing_page/pages/game/components/npcs/education/education_npc.dart';

class EducationController extends StateController<EducationNpc> {
  bool canShowDialog = false;
  @override
  void update(double dt, EducationNpc component) {
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
