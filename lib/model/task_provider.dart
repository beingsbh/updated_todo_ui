import 'package:flutter/material.dart';
import 'package:todo_app_2/model/viewmodel.dart';

class TaskProvider extends ChangeNotifier {
  List<Taskmodel> tasks = [];
}
