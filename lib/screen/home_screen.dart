import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/const/colors.dart';
import 'package:myapp/component/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selected;

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
            ),
          ],
        ),
      ),
    );
  }

  void OnDaySelected (DateTime selected, DateTime focused) {
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