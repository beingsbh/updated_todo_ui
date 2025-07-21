import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/colors.dart';

class DateTimeTextfeild extends StatelessWidget {
  const DateTimeTextfeild({super.key, required this.suffixIcon});
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        fillColor: white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        suffixIcon: suffixIcon,
        iconColor: textcolor,
      ),
    );
  }
}
