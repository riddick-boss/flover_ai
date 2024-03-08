import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/infrastructure/object_detection/object_detection_service.dart';
import 'image_converter.dart';
import 'ml_detector_provider.dart';

@Injectable(as: ObjectDetectionService)
class GoogleMLKitObjectDetectionService implements ObjectDetectionService {
  GoogleMLKitObjectDetectionService(
    this._imageConverter,
    this._mlDetectorProvider,
  );

  final ImageConverter _imageConverter;
  final MlDetectorProvider _mlDetectorProvider;

  @override
  Future<String?> detectObject(
    CameraImage image,
    DeviceOrientation? deviceOrientation,
    int sensorOrientation,
    CameraLensDirection cameraLensDirection,
  ) async {
    final inputImage = _imageConverter.convertToInputImage(
      image,
      deviceOrientation,
      sensorOrientation,
      cameraLensDirection,
    );

    if (inputImage == null) {
      return null;
    }

    final detector = await _mlDetectorProvider.getStreamObjetcDetector();
    final detectedObjects = await detector.processImage(inputImage);
    final detectedLabels =
        detectedObjects.expand((detectedObj) => detectedObj.labels).toList();
    detectedLabels.sort((a, b) => a.confidence.compareTo(b.confidence));
    final mostConfidentLabel = detectedLabels.firstOrNull;
    if (mostConfidentLabel == null) {
      return null;
    }
    final recognized =
        '${mostConfidentLabel.text} ${mostConfidentLabel.confidence}';
    return recognized;
  }
}
