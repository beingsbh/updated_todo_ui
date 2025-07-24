import 'package:flutter/material.dart';

import 'package:todo_app_2/constant/fonts.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({
    super.key,
    required this.image,
    required this.date,
    required this.time,
    required this.title,
    required this.isComplete,
    required this.onChanged,
  });
  final ImageProvider image;
  final String title;
  final String date;
  final String time;
  final bool isComplete;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
      ),
      title: Text(
        title,
        style: h2text.copyWith(
          decoration: isComplete
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: SizedBox(
        height: 20,
        width: double.infinity,
        child: Row(
          children: [
            Text(date, style: h3text),
            Text(" \n  "),
            Text(time, style: h3text),
          ],
        ),
      ),
      trailing: Checkbox(value: isComplete, onChanged: (_) => onChanged()),
    );
  }
}
