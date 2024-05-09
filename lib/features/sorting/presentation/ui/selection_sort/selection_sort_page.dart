import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class SelectionSortPage extends StatelessWidget {
  const SelectionSortPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Selection ',
        text2: 'Sort',
      ),
      body: Center(
        child: Text('Selection Sort'),
      ),
    );
  }
}
