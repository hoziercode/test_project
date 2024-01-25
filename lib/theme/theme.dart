import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Colors.green,
        )
        .copyWith(
          background: Colors.white,
        ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.blueAccent,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Colors.amber,
        )
        .copyWith(
          background: Colors.black,
        ),
  );
}
