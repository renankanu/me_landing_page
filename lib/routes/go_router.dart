import 'package:go_router/go_router.dart';
import 'package:me_landing_page/modules/game/game_page.dart';

abstract class Routes {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const GamePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'game',
            builder: (context, state) {
              return const GamePage();
            },
          ),
        ],
      ),
    ],
  );
}
