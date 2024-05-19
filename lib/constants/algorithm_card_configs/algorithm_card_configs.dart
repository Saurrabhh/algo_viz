import 'package:algo_viz/constants/image_assets/image_assets.dart';
import 'package:algo_viz/core/route_handler/route_id.dart';
import 'package:algo_viz/utils/typedefs/typedefs.dart';

final class AlgorithmCardConfigs {
  const AlgorithmCardConfigs._();

  static const searchingAlgorithmsList = <AlgorithmCardConfig>[
    (
      algorithmName: 'Linear Search',
      routeId: RouteId.linearSearch,
      imagePath: ImageAssets.linear,
    ),
    (
      algorithmName: 'Binary Search',
      routeId: RouteId.binarySearch,
      imagePath: ImageAssets.binary,
    ),
  ];

  static const sortingAlgorithmsList = <AlgorithmCardConfig>[
    (
      algorithmName: 'Bubble Sort',
      routeId: RouteId.bubbleSort,
      imagePath: ImageAssets.bubble,
    ),
    (
      algorithmName: 'Selection Sort',
      routeId: RouteId.selectionSort,
      imagePath: ImageAssets.selection,
    ),
    // (
    //   algorithmName: 'Insertion Sort',
    //   routeId: RouteId.insertionSort,
    //   imagePath: ImageAssets.insertion,
    // ),
    // (
    //   algorithmName: 'Quick Sort',
    //   routeId: RouteId.quickSort,
    //   imagePath: ImageAssets.quick,
    // ),
    // (
    //   algorithmName: 'Merge Sort',
    //   routeId: RouteId.mergeSort,
    //   imagePath: ImageAssets.merge,
    // ),
  ];

  static const pathFindingAlgorithmsList = <AlgorithmCardConfig>[
    // (
    //   algorithmName: 'BFS',
    //   routeId: RouteId.bfs,
    //   imagePath: ImageAssets.bfs,
    // ),
    // (
    //   algorithmName: 'DFS',
    //   routeId: RouteId.dfs,
    //   imagePath: ImageAssets.dfs,
    // ),
    // (
    //   algorithmName: 'Dijkstra',
    //   routeId: RouteId.dijkstra,
    //   imagePath: ImageAssets.dijkstra,
    // ),
  ];
}
