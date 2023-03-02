import 'package:bonfire/state_manager/state_controller.dart';
import 'package:me_landing_page/pages/game/player/player.dart';

class MyPlayerController extends StateController<MyPlayer> {
  @override
  void update(double dt, MyPlayer component) {}
  void onReceiveDamage(double damage) {
    component?.execShowDamage(damage);
  }
}
