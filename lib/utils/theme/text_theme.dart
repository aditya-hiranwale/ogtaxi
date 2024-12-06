import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';

class KTextTheme {
  //
  static TextTheme lightTextTheme = TextTheme(
    //displays
    displayLarge: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),
    displayMedium: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),
    displaySmall: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),

    //titles
    titleLarge: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),
    titleSmall: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),

    //
    bodyLarge: GoogleFonts.montserrat(
      color: KColors.textLight,
      fontStyle: FontStyle.normal,
      // fontWeight: FontWeight.bold,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),

    //
    headlineLarge: GoogleFonts.montserrat(
      color: KColors.textLight,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: KColors.textLight,
    ),
  );

  //
  static TextTheme darkTextTheme = TextTheme(
    //displays
    displayLarge: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
    displayMedium: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
    displaySmall: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),

    //titles
    titleLarge: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
    titleSmall: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),

    //
    bodyLarge: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
    bodySmall: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),

    //
    headlineLarge: GoogleFonts.montserrat(
      color: KColors.textDark,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: KColors.textDark,
    ),
  );
}
