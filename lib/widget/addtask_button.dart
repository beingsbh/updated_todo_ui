import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';

class AddtaskButton extends StatelessWidget {
  const AddtaskButton({super.key, required this.onTap, required this.text});
  final void Function()? onTap;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 380,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: Text(text ?? "lebe", style: h2)),
      ),
    );
  }
}
