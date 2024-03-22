import 'package:go_router/go_router.dart';

import '../../../onboarding/presentation/intro/allow_camera/intro_allow_camera_screen.dart';
import '../../../onboarding/presentation/intro/detailed_explanation/intro_detailed_explanation_screen.dart';
import '../../../onboarding/presentation/splash/splash_screen.dart';
import '../../../recognition/presentation/recognizer/recognizer_screen.dart';
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
    ],
  );
}
