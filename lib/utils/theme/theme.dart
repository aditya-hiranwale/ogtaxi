import 'package:flutter/material.dart';
import 'package:ogtaxi/constants/sizes.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';
import 'package:ogtaxi/utils/theme/text_theme.dart';
import 'package:ogtaxi/utils/theme/textfield_theme.dart';

class KAppTheme {
  //making it private
  // KAppTheme._();

  //
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        elevation: 1,
        enableFeedback: true,
        padding: const EdgeInsets.all(KSizes.k8pad),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(KSizes.k4pad),
          ),
        ),
        backgroundColor: KColors.primeDark,
        foregroundColor: KColors.primeLight,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        alignment: Alignment.center,
        elevation: 1,
        enableFeedback: true,
        padding: const EdgeInsets.all(KSizes.k8pad),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(KSizes.k4pad),
          ),
        ),
        side: const BorderSide(
          color: KColors.primeDark,
        ),
        // backgroundColor: KColors.primeDark,
        foregroundColor: KColors.primeDark,
        textStyle: KTextTheme.lightTextTheme.headlineLarge,
      ),
    ),
    inputDecorationTheme: KtextfieldTheme.light,
  );

  //
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: KTextTheme.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        elevation: 1,
        enableFeedback: true,
        padding: const EdgeInsets.all(KSizes.k8pad),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(KSizes.k4pad),
          ),
        ),
        backgroundColor: KColors.primeLight,
        foregroundColor: KColors.primeDark,
        // textStyle: KTextTheme.lightTextTheme.headlineLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        alignment: Alignment.center,
        elevation: 1,
        enableFeedback: true,
        padding: const EdgeInsets.all(KSizes.k8pad),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(KSizes.k4pad),
          ),
        ),
        side: const BorderSide(
          color: KColors.primeLight,
        ),
        // backgroundColor: KColors.primeLight,
        foregroundColor: KColors.primeLight,
      ),
    ),
    inputDecorationTheme: KtextfieldTheme.dark,
  );
}
