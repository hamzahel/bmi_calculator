import 'package:flutter/material.dart';

class SizeConf {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConf.screenHeight;
  // 812 is the layout height that designer use
  if (screenHeight != null)
    return (inputHeight / 812) * screenHeight;
  else
    return (inputHeight);
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConf.screenWidth;
  if(screenWidth != null)
    return (inputWidth / 375) * screenWidth;
  else
    return (inputWidth);
}
