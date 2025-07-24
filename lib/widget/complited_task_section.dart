import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';
import 'package:todo_app_2/provider/task_provider.dart';
import 'package:todo_app_2/widget/custom_listtile.dart';

class ComplitedTaskSection extends StatelessWidget {
  const ComplitedTaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.sizeOf(context).height;
    final sw = MediaQuery.sizeOf(context).width;
    String formatTimeOfDay(BuildContext context, TimeOfDay time) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      final format = DateFormat.jm(); // e.g. 6:00 PM
      return format.format(dt);
    }

    final taskProvider = Provider.of<TaskProvider>(context, listen: true);
    final completeTasks = taskProvider.completeTasks;
    return Container(
      height: sh * 0.27,
      width: sw * 0.96,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: completeTasks.isEmpty
          ? Center(child: Text("No tasks completed yet!", style: h3text))
          : ListView.separated(
              itemCount: completeTasks.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final task = completeTasks[index];
                return CustomListtile(
                  title: task.title!,
                  image: AssetImage(task.category!),
                  date: DateFormat('yyyy-MM-dd').format(task.date!),
                  time: formatTimeOfDay(context, task.time!),
                  isComplete: task.isComplete,
                  onChanged: () {
                    taskProvider.toggleTaskStatus(task); // Uncheck to move back
                  },
                );
              },
            ),
    );
  }
}
