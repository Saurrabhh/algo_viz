import 'package:algo_viz/constants/algorithm_card_configs/algorithm_card_configs.dart';
import 'package:algo_viz/core/designs/designs.dart';
import 'package:algo_viz/utils/color_utils/color_utils.dart';
import 'package:flutter/material.dart';

class SortingPage extends StatelessWidget {
  const SortingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text1: 'Sorting ',
        text2: 'Algorithms',
      ),
      body: Column(
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 4,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AlgorithmCardConfigs.sortingAlgorithmsList.length,
            itemBuilder: (context, index) {
              return AlgorithmCard(
                algorithmCardConfig:
                    AlgorithmCardConfigs.sortingAlgorithmsList[index],
                backgroundColor: getColorFromIndex(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
