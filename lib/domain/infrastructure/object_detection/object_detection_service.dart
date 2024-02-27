import 'package:camera/camera.dart';
import 'recognition.dart';

abstract class ObjectDetectionService {
  Future<List<Recognition>> detectObject(CameraImage cameraImage);
}
