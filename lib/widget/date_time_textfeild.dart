import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/colors.dart';

class DateTimeTextfeild extends StatelessWidget {
  const DateTimeTextfeild({
    super.key,
    required this.suffixIcon,
    this.hintText,
    this.onTap,
  });
  final Widget? suffixIcon;
  final String? hintText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextField(
        onTap: onTap,
        readOnly: true,

        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(8),
          fillColor: white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          suffixIcon: suffixIcon,
          iconColor: textcolor,
        ),
      ),
    );
  }
}
