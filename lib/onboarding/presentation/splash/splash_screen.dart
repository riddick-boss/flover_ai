import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/presentation/navigation/nav_route.dart';
import '../../../app/presentation/theme/flover_ai_material.dart';
import '../../../core_ui/assets/graphics.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _launchedEffect(SplashCubit cubit, BuildContext context) {
    cubit.goToIntro.listen((event) {
      context.go(NavRoute.introAllowCamera.path);
    });
    cubit.goToRecognizer.listen((event) {
      context.go(NavRoute.recognizer.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider(
        create: (context) {
          final cubit = SplashCubit();
          _launchedEffect(cubit, context);
          return cubit;
        },
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return Stack(
              children: [
                Image(
                  image: AssetImage(Graphics.splashBackground.path),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        FloverAiMaterial.lightScheme().primary.withAlpha(0),
                        FloverAiMaterial.lightScheme().primary.withAlpha(80),
                        FloverAiMaterial.lightScheme().primary.withAlpha(150),
                        FloverAiMaterial.lightScheme().primary.withAlpha(240),
                        FloverAiMaterial.lightScheme().primary
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36.0, bottom: 78.0),
                    child: Text(
                      'Flover AI',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: FloverAiMaterial.lightScheme().onPrimary,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: FloverAiMaterial.lightScheme().shadow,
                            offset: const Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
