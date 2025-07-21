import 'package:flutter/material.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';
import 'package:todo_app_2/constant/images.dart';
import 'package:todo_app_2/widget/addtask_button.dart';
import 'package:todo_app_2/widget/complited_task_section.dart';
import 'package:todo_app_2/widget/tasklist_section.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.sizeOf(context).height;
    final sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: bgcolor,

      body: Stack(
        children: [
          Container(
            height: sh * 0.25,
            width: sw * 1,
            decoration: BoxDecoration(
              image: DecorationImage(image: bg, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: sh * 0.06),
                Text("September 28,2003", style: h2),
                SizedBox(height: sw * 0.09),
                Text("My To Do List", style: h1),
                TasklistSection(),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Completed", style: h1text),
                  ),
                ),
                SizedBox(height: 30),
                ComplitedTaskSection(),
                SizedBox(height: 20),
                AddtaskButton(
                  onTap: () {
                    Navigator.pushNamed(context, "/addtaskPage");
                  },
                  text: "Add Task",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
