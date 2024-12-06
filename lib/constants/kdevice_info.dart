import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool getThemeMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark
      ? true
      : false;
}
