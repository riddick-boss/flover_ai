import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../di/inject_config.dart';
import '../../domain/navigation/nav_route.dart';
import 'cubit/camera_permission_cubit.dart';
import 'cubit/redirection_cubit.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RedirectionCubit(),
        child: BlocListener<RedirectionCubit, RedirectionState>(
          listener: (context, state) {
            if (state is RedirectToCameraPermissionScreen) {
              context.go(NavRoute.camera.path); //TODO: change path
            } else if (state is RedirectToFlowerDetailsScreen) {
              context.go(NavRoute.camera.path); //TODO: change path
            }
          },
          child: BlocProvider(
              create: (context) => CameraPermissionCubit(getIt()),
              child: BlocBuilder<CameraPermissionCubit, CameraPermissionState>(
                builder: (context, state) {
                  if (state is CameraPermissionDenied) {
                    return ColoredBox(
                      color: Theme.of(context).colorScheme.background,
                      child: Center(
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text('DENIED'),
                        ),
                      ),
                    );
                  }

                  return ColoredBox(
                    color: Theme.of(context).colorScheme.background,
                    child: const Center(
                      child: Text(
                        'granted',
                        style: TextStyle(),
                      ),
                    ),
                  );
                },
              )),
        ));
  }
}
