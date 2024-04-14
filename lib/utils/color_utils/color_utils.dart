import 'package:algo_viz/core/designs/color/app_colors.dart';
import 'package:flutter/material.dart';

Color getColorFromIndex(int index) {
  return switch (index % 3) {
    0 => AppColors.whiteColor,
    1 => AppColors.blueColor,
    _ => AppColors.yellowColor,
  };
}
