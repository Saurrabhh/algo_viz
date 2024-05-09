import 'package:algo_viz/core/designs/designs.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text1;
  final String text2;

  const MyAppBar({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: AppColors.black, fontSize: 20),
          children: [
            TextSpan(
              text: text1,
              style: const TextStyle(color: AppColors.black),
            ),
            TextSpan(
              text: text2,
              style: const TextStyle(color: AppColors.blue),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
