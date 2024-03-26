import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'AlgoViz',
        ),
      ),
      body: const Center(
        child: Text('Welcome to AlgoViz'),
      ),
    );
  }
}
