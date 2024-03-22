import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

import '../../model/detected_obj.dart';

abstract class ObjectDetectionService {
  Future<DetectedObj?> detectObject(
    CameraImage image,
    DeviceOrientation? deviceOrientation,
    int sensorOrientation,
    CameraLensDirection cameraLensDirection,
  );
}
