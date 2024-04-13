import 'package:algo_viz/core/route_handler/route_id.dart';
import 'package:algo_viz/features/dashboard/presentation/ui/dashboard_page.dart';
import 'package:algo_viz/features/pathfinding/presentation/ui/pathfinding_page.dart';
import 'package:algo_viz/features/sorting/presentation/ui/sorting_page.dart';
import 'package:algo_viz/features/splash/presentation/ui/splash_page.dart';
import 'package:algo_viz/utils/utils.dart';
import 'package:flutter/material.dart';

export 'route_id.dart';

class RouteHandler {
  const RouteHandler._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeId = RouteId.values.fromString(settings.name);

    if (routeId == null) {
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('ERROR'),
          ),
        ),
      );
    }

    final args = settings.arguments as Map<String, dynamic>?;

    return MaterialPageRoute(
      settings: settings,
      builder: (_) => switch (routeId) {
        RouteId.splash => const SplashPage(),
        RouteId.dashboard => const Dashboard(),
        RouteId.sorting => const SortingPage(),
        RouteId.pathfinding => const PathfindingPage(),
      },
    );
  }

  static Future<Map<String, dynamic>?> push(
    BuildContext context,
    RouteId routeId, {
    Map<String, dynamic>? args,
  }) async {
    if (!context.mounted) {
      return null;
    }

    final returnedArgs = await Navigator.pushNamed(
      context,
      routeId.name,
      arguments: args,
    );

    return returnedArgs as Map<String, dynamic>?;
  }

  static Future<Map<String, dynamic>?> pushReplacement(
    BuildContext context,
    RouteId routeId, {
    Map<String, dynamic>? args,
  }) async {
    if (!context.mounted) {
      return null;
    }

    final returnedArgs = await Navigator.pushReplacementNamed(
      context,
      routeId.name,
      arguments: args,
    );

    return returnedArgs as Map<String, dynamic>?;
  }

  static Future<Map<String, dynamic>?> pushAndRemoveUntil(
    BuildContext context,
    RouteId routeId,
    bool Function(Route<dynamic>) predicate, {
    Map<String, dynamic>? args,
  }) async {
    if (!context.mounted) {
      return null;
    }

    final returnedArgs = await Navigator.pushNamedAndRemoveUntil(
      context,
      routeId.name,
      predicate,
      arguments: args,
    );

    return returnedArgs as Map<String, dynamic>?;
  }
}
