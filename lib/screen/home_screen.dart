import 'package:flutter/material.dart';
import 'package:test_proj/component/calendar.dart';
import 'package:test_proj/component/custom_text_field.dart';
import 'package:test_proj/component/schedule_card.dart';
import 'package:test_proj/const/color.dart';
import 'package:test_proj/component/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay = DateTime.utc(2024, 03, 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (_){
              return Container(
                color: primaryColor,
                height: 600,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top:16.0,),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                                label: '시작 시간',
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: CustomTextField(
                                label: '종료 시간',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          );
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        )
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(selectedDay: selectedDay!, taskCount: 1),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: ListView(
                  children: [
                    ScheduleCard(
                      StartTime: DateTime(
                        2024,
                        03,
                        13,
                        19,
                      ),
                      EndTime: DateTime(
                        2024,
                        03,
                        13,
                        20,
                      ),
                      Content: 'Flutter 공부',
                      CategoryColor: Colors.blue,
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

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }

    return date.isAtSameMomentAs(selectedDay!);
  }
}