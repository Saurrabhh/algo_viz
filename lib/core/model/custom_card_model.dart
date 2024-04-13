import 'package:flutter/material.dart';

class CustomCardModel {
  final String imagePath;
  final String text;
  final VoidCallback onTap;
  final Color color;

  const CustomCardModel({
    required this.imagePath,
    required this.text,
    required this.onTap,
    required this.color,
  });
}
