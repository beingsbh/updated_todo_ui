import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';
import 'package:todo_app_2/constant/images.dart';
import 'package:todo_app_2/provider/task_provider.dart';
import 'package:todo_app_2/widget/addtask_button.dart';
import 'package:todo_app_2/widget/catagory_section.dart';
import 'package:todo_app_2/widget/custom_textfeild.dart';
import 'package:todo_app_2/widget/date_time_textfeild.dart';

class AddtaskPage extends StatelessWidget {
  const AddtaskPage({super.key});

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
    return Scaffold(
      backgroundColor: bgcolor,
      body: Stack(
        children: [
          // Top background image container
          Container(
            height: sh * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: appbarbg, fit: BoxFit.cover),
            ),
          ),
          // Page content wrapped in scrollable view
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(FontAwesomeIcons.arrowLeft, color: white),
                      ),
                      SizedBox(width: sw * 0.25),
                      Text("Add Your Task", style: h2),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text("Enter Task Title", style: h2text),
                  CustomTextfeild(
                    hintText: "Enter Task Title",
                    onChanged: (value) {
                      taskProvider.setTasktitle(value);
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text("Category", style: h2text),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 70,
                        child: Row(
                          children: [
                            CatagorySection(
                              imagePath: cup,
                              onTap: (value) {
                                taskProvider.setcatagory(value);
                              },
                              selectedImage: taskProvider.taskCatagory,
                            ),
                            CatagorySection(
                              imagePath: date,
                              onTap: (value) {
                                taskProvider.setcatagory(value);
                              },
                              selectedImage: taskProvider.taskCatagory,
                            ),
                            CatagorySection(
                              imagePath: list,
                              onTap: (value) {
                                taskProvider.setcatagory(value);
                              },
                              selectedImage: taskProvider.taskCatagory,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 155,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date", style: h2text),
                              DateTimeTextfeild(
                                hintText: taskProvider.taskDate != null
                                    ? DateFormat(
                                        "yyyy-MM-dd",
                                      ).format(taskProvider.taskDate!)
                                    : "Select Date",
                                onTap: () async {
                                  final pickDate = await showDatePicker(
                                    context: (context),
                                    firstDate: DateTime(2025),
                                    lastDate: DateTime(2050),
                                    initialDate: DateTime.now(),
                                  );
                                  if (pickDate != null) {
                                    return taskProvider.setDate(pickDate);
                                  }
                                },
                                suffixIcon: Icon(
                                  FontAwesomeIcons.calendar,
                                  size: 20,
                                  color: textcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 60),
                        SizedBox(
                          height: 100,
                          width: 155,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Time", style: h2text),
                              DateTimeTextfeild(
                                hintText: taskProvider.taskTime != null
                                    ? formatTimeOfDay(
                                        context,
                                        taskProvider.taskTime!,
                                      )
                                    : "Select Time",
                                onTap: () async {
                                  final pickTime = await showTimePicker(
                                    context: (context),
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickTime != null) {
                                    return taskProvider.setTime(pickTime);
                                  }
                                },
                                suffixIcon: Icon(
                                  FontAwesomeIcons.clock,
                                  size: 20,
                                  color: textcolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Notes", style: h2text),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: "Notes",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.all(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),

                  AddtaskButton(
                    onTap: () {
                      if (taskProvider.taskTitle == null ||
                          taskProvider.taskDate == null ||
                          taskProvider.taskTime == null ||
                          taskProvider.taskCatagory == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Please fill all fields before saving.",
                            ),
                            backgroundColor: const Color.fromARGB(
                              255,
                              225,
                              112,
                              0,
                            ),
                          ),
                        );
                        return;
                      }
                      taskProvider.addTask();
                      Navigator.pop(context);
                    },
                    text: "Saved",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
