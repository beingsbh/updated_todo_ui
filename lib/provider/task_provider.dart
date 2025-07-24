import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app_2/model/viewmodel.dart';

class TaskProvider extends ChangeNotifier {
  final List<Tasks> _tasks = [];
  List get tasks => _tasks;
  String? _taskTitle;
  String? _taskCatagory;
  DateTime? _taskDate;
  TimeOfDay? _taskTime;
  bool? _isComplete;

  String? get taskTitle => _taskTitle;
  String? get taskCatagory => _taskCatagory;
  DateTime? get taskDate => _taskDate;
  TimeOfDay? get taskTime => _taskTime;
  bool? get isComplete => _isComplete;

  List<Tasks> get activeTasks =>
      _tasks.where((task) => task.isComplete == false).toList();

  List<Tasks> get completeTasks =>
      _tasks.where((task) => task.isComplete == true).toList();

  setTasktitle(String value) {
    _taskTitle = value;
    log(value.toString());
    notifyListeners();
  }

  setcatagory(String value) {
    _taskCatagory = value;
    log(value.toString());
    notifyListeners();
  }

  setDate(DateTime value) {
    _taskDate = value;
    log(value.toString());
    notifyListeners();
  }

  setTime(TimeOfDay value) {
    _taskTime = value;
    log(value.toString());
    notifyListeners();
  }

  addTask() {
    final newTask = Tasks(
      title: _taskTitle,
      category: _taskCatagory,
      date: _taskDate,
      time: _taskTime,
    );

    _tasks.add(newTask);
    reset();
    notifyListeners();
  }

  void reset() {
    _taskCatagory = "";
    _taskTitle = "";
    _taskDate = null;
    _taskTime = null;
    _isComplete = false;
  }

  void toggleTaskStatus(Tasks task) {
    final index = _tasks.indexWhere(
      (t) =>
          t.title == task.title &&
          t.category == task.category &&
          t.date == task.date &&
          t.time == task.time,
    );

    if (index != -1) {
      _tasks[index].isComplete = !_tasks[index].isComplete;
      log(
        "✅ Task toggled: ${_tasks[index].title} → ${_tasks[index].isComplete}",
      );
      notifyListeners();
    } else {
      debugPrint("❌ Task not found!");
    }
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void clearAllTask(index) {
    _tasks.remove(index);
    notifyListeners();
  }
}
