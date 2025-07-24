import 'package:flutter/material.dart';

class Tasks {
  final String title;
  final String category;
  final DateTime? date;
  final TimeOfDay? time;

  Tasks({required this.title, required this.category, this.date, this.time});
}
