import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/images.dart';
import 'package:todo_app_2/widget/custom_listtile.dart';

class TasklistSection extends StatelessWidget {
  const TasklistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.sizeOf(context).height;
    final sw = MediaQuery.sizeOf(context).width;
    return Container(
      height: sh * 0.27,
      width: sw * 0.96,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (context, index) {
          return CustomListtile(image: cupIcon);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 10,
      ),
    );
  }
}
