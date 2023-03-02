import 'package:bonfire/bonfire.dart';
import 'package:me_landing_page/pages/game/player/player.dart';

class MyPlayerController extends StateController<MyPlayer> {
  @override
  void update(double dt, MyPlayer component) {
    final seeOrcInterval = component.checkInterval('seeEnemy', 150, dt);
    if (seeOrcInterval) {
      component.seeEnemy(
        radiusVision: component.width * 2,
        observed: (_) => _handleShowOrc(),
      );
    }
  }

  void _handleShowOrc() {
    component?.execShowEmote();
  }

  void onReceiveDamage(double damage) {
    component?.execShowDamage(damage);
  }
}
