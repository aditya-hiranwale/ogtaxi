import 'package:flutter/material.dart';

extension Esb on SizedBox {
  // Create a fixed size SizedBox with only height
  static SizedBox height(double height) {
    return SizedBox(height: height);
  }

  // Create a fixed size SizedBox with only width
  static SizedBox width(double width) {
    return SizedBox(width: width);
  }

  // Create a square SizedBox with equal width and height
  static SizedBox square(double dimension) {
    return SizedBox(width: dimension, height: dimension);
  }

  // Create a SizedBox with width and height set to the same value
  static SizedBox fromSize(double size) {
    return SizedBox(width: size, height: size);
  }

  // Create a SizedBox with padding around it
  static Widget padded(
      {double width = 0, double height = 0, double padding = 0}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(width: width, height: height),
    );
  }
}
