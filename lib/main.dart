import 'package:flutter/material.dart';

import 'domain/infrastructure/app_initializer.dart';
import 'domain/navigation/nav_configurator.dart';
import 'domain/theme/flover_ai_theme.dart';

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
      title: 'Flutter Demo',
      theme: FloverAiTheme.lightTheme,
      darkTheme: FloverAiTheme.darkTheme,
      highContrastTheme: FloverAiTheme.highContrastTheme,
      highContrastDarkTheme: FloverAiTheme.highContrastDarkTheme,
    );
  }
}
