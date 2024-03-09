import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/infrastructure/object_detection/object_detection_service.dart';
import '../../../domain/model/detected_obj.dart';
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
  Future<DetectedObj?> detectObject(
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
    final recognized = _createDetectedObject(mostConfidentLabel);
    log(recognized.toString());
    return recognized;
  }

  DetectedObj _createDetectedObject(Label label) =>
      DetectedObj(text: label.text, confidence: label.confidence);
}
