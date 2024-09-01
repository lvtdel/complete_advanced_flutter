import 'package:complete_advanced_flutter/presentation/resource/routes_manager.dart';
import 'package:complete_advanced_flutter/presentation/resource/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();
  int appState = 0;

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
