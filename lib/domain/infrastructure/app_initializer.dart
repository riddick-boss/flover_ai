import 'package:flutter/material.dart';

import '../../di/inject_config.dart';
import 'camera/camera_data_manager.dart';

class AppInitializer {
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies();

    await getIt<CameraDataManager>().initialize();
  }
}
