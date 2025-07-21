import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';

class CustomTextfeild extends StatelessWidget {
  const CustomTextfeild({super.key, required this.hintText});
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
      child: TextField(
        style: h2text,
        decoration: InputDecoration(
          fillColor: white,
          filled: true,
          hintText: hintText,
          hintStyle: h3text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
