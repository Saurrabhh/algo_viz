import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class DijkstraPage extends StatelessWidget {
  const DijkstraPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'Dijkstra ',
        text2: 'Algorithm',
      ),
      body: Center(
        child: Text('Dijkstra'),
      ),
    );
  }
}
