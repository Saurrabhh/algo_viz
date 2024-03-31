import 'package:algo_viz/core/designs/tiles/custom_card.dart';
import 'package:algo_viz/core/model/custom_card_model.dart';
import 'package:flutter/material.dart';

class SortingPage extends StatelessWidget {
  SortingPage({
    super.key,
  });

  final List<CustomCardModel> cardList = [
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
                text: 'Sorting ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                  text: 'Algorithms', style: TextStyle(color: Colors.blue)),
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
            itemCount: cardList.length,
            itemBuilder: (context, index) {
              return CustomCard(
                imagePath: cardList[index].imagePath,
                text: cardList[index].text,
                onTap: cardList[index].onTap,
                color: cardList[index].color,
              );
            },
          ),
        ],
      ),
    );
  }
}
