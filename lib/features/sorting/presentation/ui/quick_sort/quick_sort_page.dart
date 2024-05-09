import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class QuickSortPage extends StatelessWidget {
  const QuickSortPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Quick ',
        text2: 'Sort',
      ),
      body: Center(
        child: Text('Quick Sort'),
      ),
    );
  }
}
