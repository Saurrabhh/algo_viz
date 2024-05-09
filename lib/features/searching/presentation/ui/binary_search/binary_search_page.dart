import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class BinarySearchPage extends StatelessWidget {
  const BinarySearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Binary ',
        text2: 'Search',
      ),
      body: Center(
        child: Text('Binary Search'),
      ),
    );
  }
}
