import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/camera/camera_screen.dart';
import '../../feature/grant_camera_permission/grant_camera_permission_screen.dart';
import 'nav_route.dart';

class NavConfigurator {
  static GoRouter router =
      GoRouter(initialLocation: NavRoute.camera.path, routes: <RouteBase>[
    ShellRoute(
        builder: (context, state, child) => Scaffold(
              body: child,
            ),
        routes: [
          GoRoute(
            path: NavRoute.camera.path,
            builder: (context, state) => const CameraScreen(),
          ),
          GoRoute(
            path: NavRoute.grantCameraPermission.path,
            builder: (context, state) => const GrantCameraPermissionScreen(),
          )
        ])
  ]);
}
