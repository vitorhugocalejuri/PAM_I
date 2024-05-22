import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Estilização do tema do projeto Quitanda
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
        fontSize: 13,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12,
      ),

      headlineMedium: GoogleFonts.montserrat(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      //Fonte do Titulo: "HOME" com negrito, usando o fontWieght.
      titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
