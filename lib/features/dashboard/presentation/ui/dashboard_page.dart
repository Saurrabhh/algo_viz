import 'package:algo_viz/core/designs/tiles/custom_card.dart';
import 'package:algo_viz/core/model/custom_card_model.dart';
import 'package:algo_viz/core/route_handler/route_handler.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({
    super.key,
  });

  final List<CustomCardModel> sortList = [
    CustomCardModel(
      imagePath: 'assets/icons/arrow_down_right.png',
      text: 'Selection Sort',
      onTap: () {
        print('selection');
      },
      color: Colors.white,
    ),
    CustomCardModel(
      imagePath: 'assets/icons/arrow_down_right.png',
      text: 'Insertion Sort',
      onTap: () {
        print('Insertion');
      },
      color: Colors.blue,
    ),
    CustomCardModel(
      imagePath: 'assets/icons/arrow_down_right.png',
      text: 'Quick Sort',
      onTap: () {
        print('Quick');
      },
      color: Colors.yellow,
    ),
    CustomCardModel(
      imagePath: 'assets/icons/arrow_down_right.png',
      text: 'Merge Sort',
      onTap: () {
        print('Merge');
      },
      color: Colors.blueGrey,
    ),
  ];
  final List<CustomCardModel> pathfindingList = [
    CustomCardModel(
      imagePath: 'assets/icons/arrow_down_right.png',
      text: 'BFS',
      onTap: () {
        print('BFS');
      },
      color: Colors.white,
    ),
    CustomCardModel(
      imagePath: 'assets/icons/arrow_down_right.png',
      text: 'DFS',
      onTap: () {
        print('DFS');
      },
      color: Colors.blue,
    ),
    CustomCardModel(
      imagePath: 'assets/icons/arrow_down_right.png',
      text: 'Dijkstra',
      onTap: () {
        print('Dijkstra');
      },
      color: Colors.yellow,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 20),
            children: [
              TextSpan(
                text: 'Algo',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(text: 'Viz', style: TextStyle(color: Colors.blue)),
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
                      color: Colors.blue.withOpacity(0.9),
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
                  itemCount: sortList.length,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 12,
                    ); // Adjust the height as needed
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(
                      imagePath: sortList[index].imagePath,
                      text: sortList[index].text,
                      onTap: sortList[index].onTap,
                      color: sortList[index].color,
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
                      color: Colors.blue.withOpacity(0.9),
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
                  itemCount: pathfindingList.length,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 12,
                    ); // Adjust the height as needed
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(
                      imagePath: pathfindingList[index].imagePath,
                      text: pathfindingList[index].text,
                      onTap: pathfindingList[index].onTap,
                      color: index.isEven ? Colors.white : Colors.blueGrey,
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
