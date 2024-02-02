import 'package:flutter/material.dart';

import 'domain/infrastructure/app_initializer.dart';
import 'domain/navigation/nav_configurator.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
