import 'package:expense_tracker/core/utils/dimentions.dart';
import 'package:expense_tracker/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double widthPercent;
  final double heightPercent;
  final double borderRadiusPercent;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.widthPercent = 80, // Default width is 80% of screen
    this.heightPercent = 7, // Default height is 7% of screen
    this.borderRadiusPercent = 3, // Default radius is 3% of screen width
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.widthPercent(context, widthPercent),
      height: Dimensions.heightPercent(context, heightPercent),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.widthPercent(context, borderRadiusPercent),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ?? TextStyle(
            fontSize: Fonts.fontSize(context, 2.5), // Default font size 2.5% of height
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
