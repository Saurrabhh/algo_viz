import 'package:algo_viz/constants/image_assets/image_assets.dart';
import 'package:algo_viz/core/route_handler/route_id.dart';
import 'package:algo_viz/utils/typedefs/typedefs.dart';

final class AlgorithmCardConfigs {
  const AlgorithmCardConfigs._();

  static const sortingAlgorithmsList = <AlgorithmCardConfig>[
    (
      algorithmName: 'Selection Sort',
      routeId: RouteId.selectionSort,
      imagePath: ImageAssets.arrowDownRight,
    ),
    (
      algorithmName: 'Insertion Sort',
      routeId: RouteId.insertionSort,
      imagePath: ImageAssets.arrowDownRight,
    ),
    (
      algorithmName: 'Quick Sort',
      routeId: RouteId.quickSort,
      imagePath: ImageAssets.arrowDownRight,
    ),
    (
      algorithmName: 'Merge Sort',
      routeId: RouteId.mergeSort,
      imagePath: ImageAssets.arrowDownRight,
    ),
  ];

  static const pathFindingAlgorithmsList = <AlgorithmCardConfig>[
    (
      algorithmName: 'BFS',
      routeId: RouteId.bfs,
      imagePath: ImageAssets.arrowDownRight,
    ),
    (
      algorithmName: 'DFS',
      routeId: RouteId.dfs,
      imagePath: ImageAssets.arrowDownRight,
    ),
    (
      algorithmName: 'Dijkstra',
      routeId: RouteId.dijkstra,
      imagePath: ImageAssets.arrowDownRight,
    ),
  ];
}
