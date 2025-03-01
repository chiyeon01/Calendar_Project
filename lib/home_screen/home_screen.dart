import 'package:flutter/material.dart';
import 'package:myapp/component/today_schedule_view.dart';
import 'package:myapp/const/colors.dart';
import 'package:myapp/component/calendar_screen.dart';
import 'package:myapp/component/bottomsheet.dart';
import 'package:myapp/component/today_schedule_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.now().toUtc();
  DateTime focusedDay = DateTime.now().toUtc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.grey[400],
        onPressed: () async {
          await showModalBottomSheet(
            context: context, 
            builder: (context){
              return Bottomsheet();
            },
          );
        },
        child: Icon(
          Icons.add,
          size:35,
        ),
      ),
      body: Column(
        children: [
          CalendarScreen(
            onDaySelected: onDaySelected,
            selectedDayPredicate: selectedDayPredicate,
          ),
          SizedBox(
            height: 8.0,
          ),
          TodayScheduleBar(),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: TodayScheduleView(),
          ),
        ],
      ),
    );
  }

  onDaySelected(DateTime selected, DateTime focussed){
    setState(() {
      selectedDay = selected;
      focusedDay = focussed;
    });
  }

  bool selectedDayPredicate(DateTime date){
    if (selectedDay == null){
      return false;
    }
    return selectedDay.isAtSameMomentAs(date);
  }
}
