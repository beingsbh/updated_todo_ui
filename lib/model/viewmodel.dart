import 'package:flutter/material.dart';

class Tasks {
  final String? title;
  final String? category;
  final DateTime? date;
  final TimeOfDay? time;
  bool isComplete;

  Tasks({
    this.isComplete = false,
    this.title,
    this.category,
    this.date,
    this.time,
  });
}
