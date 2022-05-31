import 'package:flutter/cupertino.dart';

class Dimension {
  static var device =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  // static Size size = WidgetsBinding.instance!.window.physicalSize;
  static double screenHeight = device.size.height;
  static double screenWidth = device.size.width;

  //height of screen
  static double height8 = screenHeight / 85.42;
  static double height200 = screenHeight / 3.41;
  static double height10 = screenHeight / 68.34;
  static double height30 = screenHeight / 22.78;
  static double height25 = screenHeight / 27.33;
  static double height24 = screenHeight / 28.47;
  static double height50 = screenHeight / 13.66;
  static double height20 = screenHeight / 34.17;
  static double height15 = screenHeight / 45.56;
  static double height300 = screenHeight / 2.28;
  static double height150 = screenHeight / 4.55;
  static double height130 = screenHeight / 5.25;
  static double height70 = screenHeight / 9.76;
  static double height18 = screenHeight / 37.96;
  static double height80 = screenHeight / 8.54;

  //width of screen
  static double width8 = screenWidth / 82.28;
  static double width200 = screenWidth / 2.05;
  static double width10 = screenWidth / 41.14;
  static double width12 = screenWidth / 34.28;
  static double width60 = screenWidth / 6.85;
  static double width30 = screenWidth / 13.71;
  static double width100 = screenWidth / 4.11;
  static double width50 = screenWidth / 8.22;
  static double width70 = screenWidth / 5.87;
  static double width5 = screenWidth / 82.28;
  static double width20 = screenWidth / 20.57;

  //circular radius
  static double radius5 = screenHeight / 136.68;
  static double radius10 = screenHeight / 68.38;
  static double radius15 = screenHeight / 45.56;
}
