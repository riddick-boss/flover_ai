import 'package:flutter/material.dart';

import 'app/domain/initializer/app_initializer.dart';
import 'app/presentation/navigation/nav_configurator.dart';
import 'app/presentation/theme/flover_ai_theme.dart';

void main() async {
  await AppInitializer.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: NavConfigurator.router,
      title: 'Flover AI',
      theme: FloverAiTheme.lightTheme,
      darkTheme: FloverAiTheme.darkTheme,
      highContrastTheme: FloverAiTheme.highContrastTheme,
      highContrastDarkTheme: FloverAiTheme.highContrastDarkTheme,
    );
  }
}
