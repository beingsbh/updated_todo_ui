import 'package:flutter/material.dart';
import 'package:todo_app_2/screens/addtaskpage.dart';
import 'package:todo_app_2/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => Homepage(),
        "/addtaskPage": (context) => AddtaskPage(),
      },
    );
  }
}
