import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_landing_page/pages/game/game_page.dart';

import '../pages/home/home_page.dart';

abstract class Routes {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'game',
            builder: (BuildContext context, GoRouterState state) {
              return const GamePage();
            },
          ),
        ],
      ),
    ],
  );
}
