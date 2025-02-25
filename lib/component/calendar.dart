import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/const/colors.dart';

class Calendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;
  final DateTime selected;

  const Calendar({
    required this.onDaySelected,
    required this.selectedDayPredicate,
    required this.selected,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration defaultBoxDecoration = BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(10.0),
    );

    TextStyle defaultTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(
      locale: 'ko_KR', /// 한국어로 변경
      focusedDay: selected,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      currentDay: DateTime.now(),
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate,
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        formatButtonVisible: false,
      ),
      calendarStyle: CalendarStyle( 
        defaultDecoration: defaultBoxDecoration,
        defaultTextStyle: defaultTextStyle,
        todayDecoration: defaultBoxDecoration.copyWith(
          color: primaryColor,
        ),
        todayTextStyle: defaultTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
        weekendDecoration: defaultBoxDecoration,
        weekendTextStyle: defaultTextStyle,
        selectedDecoration: defaultBoxDecoration.copyWith(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          )
        ),
        selectedTextStyle: TextStyle(
          color: Colors.black,
        ),
        outsideDecoration: defaultBoxDecoration.copyWith(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.transparent,
          )
        )
      ),
    );
  }
}