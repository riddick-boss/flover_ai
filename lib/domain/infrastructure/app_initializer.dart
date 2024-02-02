import 'package:flutter/material.dart';

import '../../di/inject_config.dart';

class AppInitializer {
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies();
  }
}
