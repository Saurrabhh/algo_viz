import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class InsertionSortPage extends StatelessWidget {
  const InsertionSortPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Insertion ',
        text2: 'Sort',
      ),
      body: Center(
        child: Text('Insertion Sort'),
      ),
    );
  }
}
