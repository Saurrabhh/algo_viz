import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class DFSPage extends StatelessWidget {
  const DFSPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        text1: 'DFS ',
        text2: 'Algorithm',
      ),
      body: Center(
        child: Text('DFS'),
      ),
    );
  }
}
