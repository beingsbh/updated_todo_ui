import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';

class CustomTextfeild extends StatelessWidget {
  const CustomTextfeild({super.key, required this.hintText, this.onChanged});
  final String? hintText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
      child: TextField(
        onChanged: onChanged,
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
