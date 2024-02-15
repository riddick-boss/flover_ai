import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/camera/camera_screen.dart';
import '../../feature/grant_camera_permission/grant_camera_permission_screen.dart';
import '../../feature/intro/allow_camera/intro_allow_camera_screen.dart';
import '../../feature/intro/detailed_explanation/intro_detailed_explanation_screen.dart';
import '../../feature/recognizer/recognizer_screen.dart';
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
      GoRoute(
        path: NavRoute.introAllowCamera.path,
        builder: (context, state) => const IntroAllowCameraScreen(),
      ),
      GoRoute(
        path: NavRoute.introDetailedExplanation.path,
        builder: (context, state) => const IntroDetailedExplanationScreen(),
      ),
      GoRoute(
        path: NavRoute.recognizer.path,
        builder: (context, state) => const RecognizerScreen(),
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
