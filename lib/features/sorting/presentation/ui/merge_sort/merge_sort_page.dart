import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class MergeSortPage extends StatelessWidget {
  const MergeSortPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Merge ',
        text2: 'Sort',
      ),
      body: Center(
        child: Text('Merge Sort'),
      ),
    );
  }
}
