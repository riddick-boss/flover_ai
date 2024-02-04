import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../di/inject_config.dart';
import 'cubit/permission_state_cubit.dart';

class GrantCameraPermissionScreen extends StatelessWidget {
  const GrantCameraPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PermissionStateCubit(getIt()),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: BlocListener<PermissionStateCubit, PermissionStateState>(
            listener: (context, state) {
              debugPrint('state is: $state');
              if (state is CameraPermissionDenied) {
                const snackBar = SnackBar(
                  content: Text(
                      "Camera permission denied, app won't be able to work properly. Visit setting to allow camera usage."),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return;
              }
              if (state is CameraPermissionGranted) {
                context.pop();
                return;
              }
            },
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    child: Text(
                      'In order to recognize flowers, app needs access to camera.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Builder(builder: (context) {
                      return FilledButton(
                        onPressed: () async {
                          await context
                              .read<PermissionStateCubit>()
                              .onAllowCameraPermissionClicked();
                        },
                        child: const Text('Click to allow camera usage'),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
