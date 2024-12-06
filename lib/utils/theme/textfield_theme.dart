import 'package:flutter/material.dart';
import 'package:ogtaxi/utils/theme/app_colors.dart';

class KtextfieldTheme {
  //
  static InputDecorationTheme light = const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: KColors.primeDark,
    floatingLabelStyle: TextStyle(color: KColors.secDark),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: KColors.secDark,
      ),
    ),
  );

  static InputDecorationTheme dark = const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: KColors.primeLight,
    floatingLabelStyle: TextStyle(color: KColors.secLight),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: KColors.secLight,
      ),
    ),
  );
}
