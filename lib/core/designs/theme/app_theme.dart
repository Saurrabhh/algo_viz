import 'package:flutter/material.dart';

final class AppTheme {
  static ThemeData get lightTheme => ThemeData.light(useMaterial3: true);

  static ThemeData get appTheme => lightTheme.copyWith(
        appBarTheme: lightTheme.appBarTheme.copyWith(
          scrolledUnderElevation: 0,
        ),
      );
}
