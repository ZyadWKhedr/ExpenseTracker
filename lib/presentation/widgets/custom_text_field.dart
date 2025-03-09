import 'package:expense_tracker/core/utils/dimentions.dart';
import 'package:expense_tracker/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.heightPercent(context, 1.5), // 1.5% of screen height
        horizontal: Dimensions.widthPercent(context, 5), // 5% of screen width
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: Fonts.fontSize(context, 2)), // 2% of screen height
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.widthPercent(context, 3)), // 3% of width
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimensions.heightPercent(context, 2), // 2% of height
            horizontal: Dimensions.widthPercent(context, 4), // 4% of width
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
