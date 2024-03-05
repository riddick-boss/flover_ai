import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/infrastructure/object_detection/object_detection_service.dart';
import 'image_converter.dart';

@Injectable(as: ObjectDetectionService)
class GoogleMLKitObjectDetectionService implements ObjectDetectionService {
  GoogleMLKitObjectDetectionService(this._imageConverter);

  final ImageConverter _imageConverter;

  late final ObjectDetectorOptions _streamOptions = ObjectDetectorOptions(
    classifyObjects: true,
    mode: DetectionMode.stream,
    multipleObjects: true,
  );
  late final ObjectDetector _streamObjectDetector =
      ObjectDetector(options: _streamOptions);

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

    final detectedObjects =
        await _streamObjectDetector.processImage(inputImage);
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
