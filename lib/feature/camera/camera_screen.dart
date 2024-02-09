import 'package:camera/camera.dart';
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
        create: (context) => RedirectionCubit(getIt()),
        child: BlocListener<RedirectionCubit, RedirectionState>(
          listener: (context, state) {
            if (state is RedirectToCameraPermissionScreen) {
              context.push(NavRoute.grantCameraPermission.path);
            } else if (state is RedirectToFlowerDetailsScreen) {
              context.go(NavRoute.camera.path); //TODO: change path
            }
          },
          child: BlocProvider(
              create: (context) => CameraPermissionCubit(getIt(), getIt()),
              child: BlocBuilder<CameraPermissionCubit, CameraPermissionState>(
                builder: (context, state) {
                  if (state is CameraPermissionDenied) {
                    return const CameraDeniedBox();
                  }

                  return CameraAllowedBox(
                    cameras: context.read<CameraPermissionCubit>().getCameras(),
                  );
                },
              )),
        ));
  }
}

class CameraDeniedBox extends StatelessWidget {
  const CameraDeniedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Preparing camera...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class CameraAllowedBox extends StatelessWidget {
  const CameraAllowedBox({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: CameraBox(
          cameras: cameras,
        ),
      ),
    );
  }
}

class CameraBox extends StatefulWidget {
  const CameraBox({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  State<CameraBox> createState() => _CameraBoxState();
}

class _CameraBoxState extends State<CameraBox> {
  late CameraController _cameraController;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    debugPrint('getting cameras: ${widget.cameras}');
    initCamera(widget.cameras.firstOrNull);
  }

  Future initCamera(CameraDescription? cameraDescription) async {
    if(cameraDescription == null) {
      debugPrint('CameraDescription is null!!');
      return;
    }
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        if (_cameraController.value.isInitialized)
          CameraPreview(_cameraController)
        else
          const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      ],
    ));
  }
}
