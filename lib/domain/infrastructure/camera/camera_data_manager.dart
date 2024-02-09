import 'package:camera/camera.dart';

abstract class CameraDataManager {
  List<CameraDescription> get cameras;

  Future<void> initialize();
}
