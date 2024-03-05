import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

abstract class ObjectDetectionService {
  Future<String?> detectObject(
    CameraImage image,
    DeviceOrientation? deviceOrientation,
    int sensorOrientation,
    CameraLensDirection cameraLensDirection,
  );
}
