import 'package:flutter/material.dart';

class Schedule {
  final int id;
  final int startTime;
  final int endTime;
  final DateTime date;
  final String content;
  final DateTime settingTime;
  final Color categoryColor;

  Schedule({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.content,
    required this.settingTime,
    required this.categoryColor,
  });
}
