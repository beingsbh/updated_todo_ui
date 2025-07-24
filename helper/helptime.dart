import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimeOfDay(BuildContext context, TimeOfDay time) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  final format = DateFormat.jm(); // e.g. 6:00 PM
  return format.format(dt);
}
