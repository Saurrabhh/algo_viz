import 'package:algo_viz/core/app_config/app_config.dart';
import 'package:algo_viz/core/designs/theme/app_theme.dart';
import 'package:algo_viz/core/route_handler/route_handler.dart';
import 'package:algo_viz/core/route_handler/route_observer.dart';
import 'package:algo_viz/di/injection.dart';
import 'package:flutter/material.dart';

// demo feature/demo

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: AppTheme.appTheme,
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: RouteId.splash.name,
      navigatorObservers: [
        CustomNavigatorObserver(),
      ],
    );
  }
}
