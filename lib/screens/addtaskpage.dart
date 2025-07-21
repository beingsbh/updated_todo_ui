import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app_2/constant/colors.dart';
import 'package:todo_app_2/constant/fonts.dart';
import 'package:todo_app_2/constant/images.dart';
import 'package:todo_app_2/widget/addtask_button.dart';
import 'package:todo_app_2/widget/catagory_icon.dart';
import 'package:todo_app_2/widget/custom_textfeild.dart';
import 'package:todo_app_2/widget/date_time_textfeild.dart';

class AddtaskPage extends StatelessWidget {
  const AddtaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.sizeOf(context).height;
    final sw = MediaQuery.sizeOf(context).width;

    // Sample icon list
    final List<ImageProvider> icon = [cupIcon, listIcon, claenderIcon];

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
                  const CustomTextfeild(hintText: "Enter Task Title"),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text("Category", style: h2text),
                      SizedBox(width: 20),
                      SizedBox(height: 70),
                      ...List.generate(
                        icon.length,
                        (index) => CatagoryIcon(image: icon[index]),
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

                  AddtaskButton(onTap: () {}, text: "Saved"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
