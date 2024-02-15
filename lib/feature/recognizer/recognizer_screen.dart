import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class RecognizerScreen extends StatelessWidget {
  const RecognizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: const Stack(
          children: [
            CameraBox(),
          ],
        ),
      ),
    );
  }
}

class CameraBox extends StatefulWidget {
  const CameraBox({super.key});

  @override
  State<CameraBox> createState() => _CameraBoxState();
}

class _CameraBoxState extends State<CameraBox> {
  CameraController? _cameraController;

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
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
        frontCameraDescription, ResolutionPreset.max,
        enableAudio: false);
    try {
      await _cameraController?.initialize().then((value) {
        if (!mounted) {
          return;
        }
      });
      setState(() {});
    } on Exception catch (e) {
      debugPrint('Failed to initialize camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptativeCameraPreview(cameraController: _cameraController);
  }
}

class AdaptativeCameraPreview extends StatelessWidget {
  const AdaptativeCameraPreview({super.key, this.cameraController});

  final CameraController? cameraController;

  @override
  Widget build(BuildContext context) {
    if (cameraController != null && cameraController!.value.isInitialized) {
      return SizedBox.expand(
        child: CameraPreview(cameraController!),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
  }
}
