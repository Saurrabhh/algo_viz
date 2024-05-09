import 'package:algo_viz/core/route_handler/route_id.dart';
import 'package:algo_viz/features/dashboard/presentation/ui/dashboard_page.dart';
import 'package:algo_viz/features/pathfinding/presentation/ui/bfs/bfs_page.dart';
import 'package:algo_viz/features/pathfinding/presentation/ui/dfs/dfs_page.dart';
import 'package:algo_viz/features/pathfinding/presentation/ui/dijkstra/dijkstra_page.dart';
import 'package:algo_viz/features/pathfinding/presentation/ui/pathfinding_page.dart';
import 'package:algo_viz/features/searching/presentation/ui/binary_search/binary_search_page.dart';
import 'package:algo_viz/features/searching/presentation/ui/linear_search/linear_search_page.dart';
import 'package:algo_viz/features/searching/presentation/ui/searching_page.dart';
import 'package:algo_viz/features/sorting/presentation/ui/bubble_sort/bubble_sort_page.dart';
import 'package:algo_viz/features/sorting/presentation/ui/insertion_sort/insertion_sort_page.dart';
import 'package:algo_viz/features/sorting/presentation/ui/merge_sort/merge_sort_page.dart';
import 'package:algo_viz/features/sorting/presentation/ui/quick_sort/quick_sort_page.dart';
import 'package:algo_viz/features/sorting/presentation/ui/selection_sort/selection_sort_page.dart';
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

    return MaterialPageRoute(
      settings: settings,
      builder: (_) => switch (routeId) {
        RouteId.splash => const SplashPage(),
        RouteId.dashboard => const DashboardPage(),
        RouteId.sorting => const SortingPage(),
        RouteId.pathfinding => const PathfindingPage(),
        RouteId.selectionSort => const SelectionSortPage(),
        RouteId.insertionSort => const InsertionSortPage(),
        RouteId.quickSort => const QuickSortPage(),
        RouteId.mergeSort => const MergeSortPage(),
        RouteId.bubbleSort => const BubbleSortPage(),
        RouteId.bfs => const BFSPage(),
        RouteId.dfs => const DFSPage(),
        RouteId.dijkstra => const DijkstraPage(),
        RouteId.linearSearch => const LinearSearchPage(),
        RouteId.binarySearch => const BinarySearchPage(),
        RouteId.searching => const SearchingPage(),
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
