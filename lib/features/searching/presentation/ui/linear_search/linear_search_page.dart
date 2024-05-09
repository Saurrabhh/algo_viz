import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class LinearSearchPage extends StatelessWidget {
  const LinearSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Linear ',
        text2: 'Search',
      ),
      body: Center(
        child: Text('Linear Search'),
      ),
    );
  }
}
