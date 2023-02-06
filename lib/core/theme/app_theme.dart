import 'package:flutter/material.dart';

abstract class AppTheme {
  static lightTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
    );
  }
}
