import 'package:algo_viz/core/app_config/i_app_config.dart';
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
        title: Text(
          AppConfig.appName,
        ),
      ),
      body: Center(
        child: Text('Welcome to ${AppConfig.appName}'),
      ),
    );
  }
}
