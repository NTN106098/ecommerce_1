import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

//get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  //812 is the layout height that design user

  return (inputHeight / 812) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  //375 is the layout height that design user

  return (inputWidth / 375) * screenWidth;
}

// extension GetOrientation on BuildContext {
//   Orientation get orientation => MediaQuery.of(this).orientation;// }
const zeroPadding = EdgeInsets.all(0);
const halfCircleRadius = Radius.circular(50.0);
const halfCircleBorderRadius = BorderRadius.all(halfCircleRadius);
