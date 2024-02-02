import 'package:go_router/go_router.dart';

import '../../feature/camera/camera_screen.dart';
import 'nav_route.dart';

class NavConfigurator {
  static GoRouter router =
      GoRouter(initialLocation: NavRoute.camera.path, routes: <RouteBase>[
    GoRoute(
      path: NavRoute.camera.path,
      builder: (context, state) => const CameraScreen(),
    )
  ]);
}
