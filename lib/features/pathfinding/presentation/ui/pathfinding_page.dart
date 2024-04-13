import 'package:algo_viz/core/color/app_colors.dart';
import 'package:algo_viz/core/designs/tiles/custom_card.dart';
import 'package:algo_viz/core/model/custom_card_model.dart';
import 'package:flutter/material.dart';

final List<CustomCardModel> _pathfindingList = [
  CustomCardModel(
    imagePath: 'assets/icons/arrow_down_right.png',
    text: 'BFS',
    onTap: () {
      print('BFS');
    },
    color: AppColors.whiteColor,
  ),
  CustomCardModel(
    imagePath: 'assets/icons/arrow_down_right.png',
    text: 'DFS',
    onTap: () {
      print('DFS');
    },
    color: AppColors.blueColor,
  ),
  CustomCardModel(
    imagePath: 'assets/icons/arrow_down_right.png',
    text: 'Dijkstra',
    onTap: () {
      print('Dijkstra');
    },
    color: AppColors.yellowColor,
  ),
];

class PathfindingPage extends StatelessWidget {
  const PathfindingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(color: AppColors.blackColor, fontSize: 20),
            children: [
              TextSpan(
                text: 'Pathfinding ',
                style: TextStyle(color: AppColors.blackColor),
              ),
              TextSpan(
                text: 'Algorithms',
                style: TextStyle(color: AppColors.blueColor),
              ),
            ],
          ),
        ),
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
            itemCount: _pathfindingList.length,
            itemBuilder: (context, index) {
              return CustomCard(
                imagePath: _pathfindingList[index].imagePath,
                text: _pathfindingList[index].text,
                onTap: _pathfindingList[index].onTap,
                color: index % 3 == 0
                    ? AppColors.whiteColor
                    : index % 3 == 1
                        ? AppColors.blueColor
                        : AppColors.yellowColor,
              );
            },
          ),
        ],
      ),
    );
  }
}
