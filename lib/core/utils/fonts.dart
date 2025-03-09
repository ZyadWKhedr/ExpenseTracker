import 'package:expense_tracker/core/utils/dimentions.dart';
import 'package:flutter/widgets.dart';

class Fonts {
  // Font size based on screen height percentage
  static double fontSize(BuildContext context, double percent) => Dimensions.screenHeight(context) * (percent / 100);
}
