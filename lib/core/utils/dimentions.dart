import 'package:flutter/widgets.dart';

class Dimensions {
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  // Height Percentage
  static double heightPercent(BuildContext context, double percent) => screenHeight(context) * (percent / 100);

  // Width Percentage
  static double widthPercent(BuildContext context, double percent) => screenWidth(context) * (percent / 100);
}
