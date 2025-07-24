import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app_2/model/viewmodel.dart';

class TaskProvider extends ChangeNotifier {
  final List<Tasks> _tasks = [];
  List get tasks => _tasks;
  String _taskTitle = "";
  String _taskCatagory = "";
  DateTime? _taskDate;
  TimeOfDay? _taskTime;

  String get taskTitle => _taskTitle;
  String get taskCatagory => _taskCatagory;
  DateTime? get taskDate => _taskDate;
  TimeOfDay? get taskTime => _taskTime;

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
    if (_taskTitle.trim().isEmpty &&
        _taskCatagory.trim().isEmpty &&
        _taskDate.toString().isEmpty &&
        _taskTime.toString().isEmpty) {
      return;
    }

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
    _taskDate = DateTime.now();
    _taskTime = null;
  }
}
