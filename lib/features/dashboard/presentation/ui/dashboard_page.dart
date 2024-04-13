import 'package:algo_viz/core/color/app_colors.dart';
import 'package:algo_viz/core/designs/tiles/custom_card.dart';
import 'package:algo_viz/core/model/custom_card_model.dart';
import 'package:algo_viz/core/route_handler/route_handler.dart';
import 'package:flutter/material.dart';

final List<CustomCardModel> _sortList = [
  CustomCardModel(
    imagePath: 'assets/icons/arrow_down_right.png',
    text: 'Selection Sort',
    onTap: () {
      print('selection');
    },
    color: AppColors.whiteColor,
  ),
  CustomCardModel(
    imagePath: 'assets/icons/arrow_down_right.png',
    text: 'Insertion Sort',
    onTap: () {
      print('Insertion');
    },
    color: AppColors.blueColor,
  ),
  CustomCardModel(
    imagePath: 'assets/icons/arrow_down_right.png',
    text: 'Quick Sort',
    onTap: () {
      print('Quick');
    },
    color: AppColors.yellowColor,
  ),
  CustomCardModel(
    imagePath: 'assets/icons/arrow_down_right.png',
    text: 'Merge Sort',
    onTap: () {
      print('Merge');
    },
    color: AppColors.blueColor,
  ),
];
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

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

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
                text: 'Algo',
                style: TextStyle(color: AppColors.blackColor),
              ),
              TextSpan(
                text: 'Viz',
                style: TextStyle(color: AppColors.blueColor),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Text(
                  'Sorting Algorithms',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: InkWell(
                  onTap: () {
                    RouteHandler.push(context, RouteId.sorting);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.blueColor.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _sortList.length,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 12,
                    ); // Adjust the height as needed
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(
                      imagePath: _sortList[index].imagePath,
                      text: _sortList[index].text,
                      onTap: _sortList[index].onTap,
                      color: index % 3 == 0
                          ? AppColors.whiteColor
                          : index % 3 == 1
                              ? AppColors.blueColor
                              : AppColors.yellowColor,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Text(
                  'Pathfinding Algorithms',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: InkWell(
                  onTap: () {
                    RouteHandler.push(context, RouteId.pathfinding);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.blueColor.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _pathfindingList.length,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 12,
                    ); // Adjust the height as needed
                  },
                  itemBuilder: (BuildContext context, int index) {
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
