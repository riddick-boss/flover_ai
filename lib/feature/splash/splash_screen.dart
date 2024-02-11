import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/assets/graphics.dart';
import '../../domain/navigation/nav_route.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider(
        create: (context) => SplashCubit(),
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashRedirect) {
              context.go(NavRoute.camera.path);
            }
          },
          child: Stack(
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
                      Theme.of(context).colorScheme.primary.withAlpha(0),
                      Theme.of(context).colorScheme.primary.withAlpha(80),
                      Theme.of(context).colorScheme.primary.withAlpha(150),
                      Theme.of(context).colorScheme.primary.withAlpha(240),
                      Theme.of(context).colorScheme.primary
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
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Theme.of(context).colorScheme.shadow,
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
