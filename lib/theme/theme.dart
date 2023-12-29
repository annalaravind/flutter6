import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade500,
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade300,
    onPrimary: const Color.fromARGB(255, 255, 255, 255),
    onSecondary: Colors.grey.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 48, 48, 48),
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    onPrimary: Colors.grey.shade700,
    onSecondary: const Color.fromARGB(255, 235, 235, 235),
  ),
);
