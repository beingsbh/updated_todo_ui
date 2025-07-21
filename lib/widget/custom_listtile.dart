import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/fonts.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({super.key, required this.image});
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(image: image),
      title: Text("Task", style: h2text),
      subtitle: Text("10 PM", style: h3text),
      trailing: Checkbox(value: false, onChanged: (value) {}),
    );
  }
}
