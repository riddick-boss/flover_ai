import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/infrastructure/camera/camera_data_manager.dart';

@Singleton(as: CameraDataManager)
class CameraDataService implements CameraDataManager {
  List<CameraDescription> _cameras = [];

  @override
  List<CameraDescription> get cameras => _cameras;

  @override
  Future<void> initialize() async {
    _cameras = await availableCameras();
    debugPrint('initialized cameras: $_cameras');
  }
}
