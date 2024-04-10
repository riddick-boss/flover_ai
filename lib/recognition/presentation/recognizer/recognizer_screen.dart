import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/domain/initializer/inject_config.dart';
import '../../../app/presentation/theme/flover_ai_material.dart';
import '../../../core_ui/assets/graphics.dart';
import 'cubit/recognizer_cubit.dart';

class RecognizerScreen extends StatelessWidget {
  const RecognizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider(
        create: (context) => RecognizerCubit(getIt()),
        child: BlocBuilder<RecognizerCubit, RecognizerState>(
          builder: (context, state) {
            return ColoredBox(
              color: Theme.of(context).colorScheme.background,
              child: Stack(
                children: [
                  CameraBox(
                    recognizerCubit: context.read<RecognizerCubit>(),
                  ),
                  const TopHint(),
                  RecognizerBottomBox(state: state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TopHint extends StatelessWidget {
  const TopHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              FloverAiMaterial.lightScheme().primary,
              FloverAiMaterial.lightScheme().primary.withAlpha(200),
              FloverAiMaterial.lightScheme().primary.withAlpha(120),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32.0,
            left: 32.0,
            right: 32.0,
            bottom: 8.0,
          ),
          child: Center(
            child: Text(
              'Point your camera at the flower',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class CameraBox extends StatefulWidget {
  const CameraBox({super.key, required this.recognizerCubit});

  @override
  State<CameraBox> createState() => _CameraBoxState();

  final RecognizerCubit recognizerCubit;
}

class _CameraBoxState extends State<CameraBox> with WidgetsBindingObserver {
  CameraController? _cameraController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      _disposeCamera();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      return SizedBox.expand(
        child: CameraPreview(_cameraController!),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
  }

  @override
  void dispose() {
    _disposeCamera();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final frontCameraDescription = cameras.firstOrNull;
    if (frontCameraDescription == null) {
      debugPrint('frontCameraDescription is null!! (cameras: $cameras)');
      return;
    }
    _cameraController = CameraController(
      frontCameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21 //for Android
          : ImageFormatGroup.bgra8888, //for iOS
    );
    try {
      await _cameraController?.initialize();
      if (mounted) {
        setState(() {});
      }
      _cameraController?.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
      _cameraController?.startImageStream((image) {
        widget.recognizerCubit.onNextImage(
            image,
            _cameraController?.value.deviceOrientation,
            frontCameraDescription.sensorOrientation,
            frontCameraDescription.lensDirection);
      });
    } on Exception catch (e) {
      debugPrint('Failed to initialize camera: $e');
    }
  }

  void _stopImageStream() {
    try {
      _cameraController?.stopImageStream();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _disposeCamera() {
    _stopImageStream();
    _cameraController?.dispose();
    _cameraController = null;
  }
}

class RecognizerBottomBox extends StatelessWidget {
  const RecognizerBottomBox({super.key, required this.state});

  final RecognizerState state;

  @override
  Widget build(BuildContext context) {
    final flowerName = state.recognizedFlowerName;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: AnimatedCrossFade(
          firstChild: _loadingBox(context),
          secondChild: _floweNameBox(context, flowerName),
          crossFadeState: flowerName == null
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }

  Widget _loadingBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Recognizing',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            width: 16,
          ),
          const SizedBox(
            width: 24.0,
            height: 24.0,
            child: CircularProgressIndicator.adaptive(),
          ),
        ],
      ),
    );
  }

  Widget _floweNameBox(BuildContext context, String? flowerName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Graphics.flowerIcon.path,
                height: 24.0,
                width: 24.0,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onBackground,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                flowerName ?? '',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextButton(
            onPressed: () {
              if (flowerName == null) {
                return;
              }
              _launchInBrowserView(flowerName);
            },
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary),
            child: const Text('Read more'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchInBrowserView(String flower) async {
    final flowerNameToPass = flower.trim().replaceAll(' ', '_');
    final uri = Uri(
      scheme: 'https',
      host: 'en.wikipedia.org',
      path: 'wiki/$flowerNameToPass',
    );
    if (!await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) {
      debugPrint('Could not launch $uri');
    }
  }
}
