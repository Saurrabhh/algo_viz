import 'package:algo_viz/core/color/app_colors.dart';
import 'package:algo_viz/core/designs/tiles/custom_card.dart';
import 'package:algo_viz/core/model/custom_card_model.dart';
import 'package:flutter/material.dart';

final List<CustomCardModel> _cardList = [
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

class SortingPage extends StatelessWidget {
  const SortingPage({
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
                text: 'Sorting ',
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
            itemCount: _cardList.length,
            itemBuilder: (context, index) {
              return CustomCard(
                imagePath: _cardList[index].imagePath,
                text: _cardList[index].text,
                onTap: _cardList[index].onTap,
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
