import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';
import 'package:todo_app_2/provider/task_provider.dart';
import 'package:todo_app_2/widget/custom_listtile.dart';

class TasklistSection extends StatelessWidget {
  const TasklistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.sizeOf(context).height;
    final sw = MediaQuery.sizeOf(context).width;

    String formatTimeOfDay(BuildContext context, TimeOfDay time) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      final format = DateFormat.jm();
      return format.format(dt);
    }

    final taskProvider = Provider.of<TaskProvider>(context, listen: true);
    final pendingTasks = taskProvider.activeTasks; // 🔁 Get pending tasks only

    return Container(
      height: sh * 0.27,
      width: sw * 0.96,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: pendingTasks.isEmpty
          ? Center(child: Text("You don't have any tasks yet!", style: h3text))
          : ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: pendingTasks.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final task = pendingTasks[index];
                return CustomListtile(
                  title: task.title ?? '',
                  image: AssetImage(task.category ?? ''),
                  date: DateFormat('yyyy-MM-dd').format(task.date!),
                  time: formatTimeOfDay(context, task.time!),
                  isComplete: task.isComplete, // ✅ Read from model
                  onChanged: () {
                    taskProvider.toggleTaskStatus(
                      task,
                    ); // ✅ This marks it complete
                  },
                );
              },
            ),
    );
  }
}
