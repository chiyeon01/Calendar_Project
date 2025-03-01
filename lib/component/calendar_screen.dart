import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day)? selectedDayPredicate;
  
  const CalendarScreen({
    required this.onDaySelected,
    required this.selectedDayPredicate,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: DateTime(2025,03,01), 
      firstDay: DateTime(1800), 
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.grey[500],
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        defaultTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        holidayTextStyle: TextStyle(
          color: Colors.grey,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      currentDay: DateTime.now().toUtc(),
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate
    );
  }
}