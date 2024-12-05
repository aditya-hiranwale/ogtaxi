import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KAppTheme {
  //
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: Colors.black54,
      ),
    ),
  );

  //
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}
