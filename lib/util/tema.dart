import 'package:flutter/material.dart';

ThemeData tema() {
  return ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 49, 97, 245)),
  );
}

TextTheme temaTextoFrom(BuildContext context) => Theme.of(context).textTheme;
