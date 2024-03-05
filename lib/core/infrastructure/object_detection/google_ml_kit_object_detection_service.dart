import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/infrastructure/object_detection/object_detection_service.dart';

@Injectable(as: ObjectDetectionService)
class GoogleMLKitObjectDetectionService implements ObjectDetectionService {
  @override
  Future<String?> detectObject(
    CameraImage image,
    DeviceOrientation? deviceOrientation,
    int sensorOrientation,
    CameraLensDirection cameraLensDirection,
  ) async {
    final inputImage = _inputImageFromCameraImage(
      image,
      deviceOrientation,
      sensorOrientation,
      cameraLensDirection,
    );

    if (inputImage == null) {
      return null;
    }

    final options = ObjectDetectorOptions(
      classifyObjects: true,
      mode: DetectionMode.stream,
      multipleObjects: true,
    );
    final objectDetector = ObjectDetector(options: options);
    final detectedObjects = await objectDetector.processImage(inputImage);
    final label = detectedObjects.firstOrNull?.labels.firstOrNull;
    if (label == null) {
      return null;
    }
    final recognized = '${label.text} ${label.confidence}';
    return recognized;
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(
      CameraImage image,
      DeviceOrientation? deviceOrientation,
      int sensorOrientation,
      CameraLensDirection cameraLensDirection) {
    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          deviceOrientation == null ? 0 : _orientations[deviceOrientation];
      if (rotationCompensation == null) {
        return null;
      }
      if (cameraLensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    if (rotation == null) {
      return null;
    }

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) {
      return null;
    }
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }
}
