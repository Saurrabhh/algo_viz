import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class BFSPage extends StatelessWidget {
  const BFSPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  MyAppBar(
        text1: 'BFS ',
        text2: 'Algorithm',
      ),
      body: Center(
        child: Text('BFS'),
      ),
    );
  }
}
