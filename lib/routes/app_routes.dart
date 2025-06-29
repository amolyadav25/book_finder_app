import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/device_info/presentation/pages/dashboard_page.dart';
import '../features/device_info/presentation/pages/sensor_page.dart';
import '../features/find_book/domain/entity/book_entity.dart';
import '../features/find_book/presentation/pages/detail_page.dart';
import '../features/find_book/presentation/pages/home_page.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        },
      ),
      GoRoute(
        name: 'detail',
        path: '/detail',
        builder: (BuildContext context, GoRouterState state) {
          final book = state.extra as BookEntity;
          return DetailPage(book: book);
        },
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashBoardPage(),
      ),
      GoRoute(
        path: '/sensor',
        name: 'sensor',
        builder: (context, state) => const SensorPage(),
      ),
    ],
  );
  static GoRouter get router => _router;
}
