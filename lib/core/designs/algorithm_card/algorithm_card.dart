import 'package:algo_viz/core/route_handler/route_handler.dart';
import 'package:algo_viz/utils/typedefs/typedefs.dart';
import 'package:flutter/material.dart';

class AlgorithmCard extends StatelessWidget {
  final AlgorithmCardConfig algorithmCardConfig;
  final Color backgroundColor;

  const AlgorithmCard({
    super.key,
    required this.algorithmCardConfig,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RouteHandler.push(context, algorithmCardConfig.routeId),
      child: Card(
        color: backgroundColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                algorithmCardConfig.imagePath,
                height: 110,
                width: 105,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                algorithmCardConfig.algorithmName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
