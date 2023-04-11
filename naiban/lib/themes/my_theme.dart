import 'package:flutter/material.dart';

class AppTheme {
  static const Color green = Color.fromRGBO(172, 228, 170, 1),
      dark = Color.fromRGBO(44, 43, 52, 1),
      dark2 = Color.fromRGBO(53, 52, 59, 1),
      white = Colors.white,
      white2 = Color.fromRGBO(243, 243, 243, 1),
      white3 = Color.fromRGBO(183, 183, 181, 1);

  static final ThemeData theme = ThemeData.light().copyWith(
    primaryColor: green,

    // Scaffold
    scaffoldBackgroundColor: white,
  );
}
