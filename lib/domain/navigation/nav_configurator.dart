import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/camera/camera_screen.dart';
import '../../feature/grant_camera_permission/grant_camera_permission_screen.dart';
import '../../feature/splash/splash_screen.dart';
import 'nav_route.dart';

class NavConfigurator {
  static GoRouter router = GoRouter(
    initialLocation: NavRoute.splash.path,
    routes: <RouteBase>[
      GoRoute(
        path: NavRoute.splash.path,
        builder: (context, state) => const SplashScreen(),
      ),
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
          ),
        ],
      ),
    ],
  );
}
