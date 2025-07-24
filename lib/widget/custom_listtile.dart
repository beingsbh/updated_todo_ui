import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/fonts.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({
    super.key,
    required this.image,
    required this.date,
    required this.time,
    required this.title,
  });
  final ImageProvider image;
  final String title;
  final String date;
  final String time;
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
      title: Text(title, style: h2text),
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
      trailing: Checkbox(value: false, onChanged: (value) {}),
    );
  }
}
