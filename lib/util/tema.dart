import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData temaPadrao() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(
        255,
        54,
        137,
        0,
      ),
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.openSans(
        fontSize: 12,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.montserrat(),
    ),
  );
}
