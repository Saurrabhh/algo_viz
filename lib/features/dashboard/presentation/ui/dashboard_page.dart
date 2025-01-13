import 'package:algo_viz/constants/algorithm_card_configs/algorithm_card_configs.dart';
import 'package:algo_viz/core/designs/designs.dart';
import 'package:algo_viz/core/route_handler/route_handler.dart';
import 'package:algo_viz/utils/color_utils/color_utils.dart';
import 'package:algo_viz/utils/typedefs/typedefs.dart';
import 'package:flutter/material.dart';

part 'algorithm_section.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Algo',
        text2: 'Viz',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              _AlgorithmSection(
                title: 'Searching Algorithms',
                viewAllRouteId: RouteId.searching,
                algorithmCardConfigs:
                    AlgorithmCardConfigs.searchingAlgorithmsList,
              ),
              SizedBox(
                height: 20,
              ),
              _AlgorithmSection(
                title: 'Sorting Algorithms',
                viewAllRouteId: RouteId.sorting,
                algorithmCardConfigs:
                    AlgorithmCardConfigs.sortingAlgorithmsList,
              ),
              SizedBox(
                height: 20,
              ),
              // _AlgorithmSection(
              //   title: 'Path Finding Algorithms',
              //   viewAllRouteId: RouteId.pathfinding,
              //   algorithmCardConfigs:
              //       AlgorithmCardConfigs.pathFindingAlgorithmsList,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
