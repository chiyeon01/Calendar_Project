import 'package:flutter/material.dart';
import 'package:myapp/component/schedule_card.dart';
import 'package:myapp/component/today_banner.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/const/colors.dart';
import 'package:myapp/component/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              onDaySelected: OnDaySelected,
              selectedDayPredicate: selectedDayPredicate,
              selected: selected,
            ),
            TodyBanner(
              date: DateTime(
                2025,
                02,
                25
              ), 
              DateCnt: 0,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ListView(
                  children: [
                    ScheduleCard(
                      StartTime: DateTime(
                        2025,
                        02,
                        25,
                        22,
                      ),
                      EndTime: DateTime(
                        2025,
                        02,
                        25,
                        23,
                      ), 
                      content: 'flutter 공부', 
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void OnDaySelected(DateTime selected, DateTime focused) {
    setState(() {
      this.selected = selected;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (this.selected == null) {
      return false;
    }
    return date.isAtSameMomentAs(this.selected!);
  }
}