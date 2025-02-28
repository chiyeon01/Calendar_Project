import 'package:flutter/material.dart';
import 'package:myapp/component/schedule_card.dart';
import 'package:myapp/component/today_banner.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/const/colors.dart';
import 'package:myapp/component/calendar.dart';
import 'package:myapp/component/text_field.dart';
import 'package:myapp/component/schedule_bottom_sheet.dart';
import 'package:myapp/model/schedule.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selected = DateTime.now();
  Map<DateTime, List<Schedule>> _events = {
    DateTime.utc(2025, 02, 27): [
      Schedule(
        id: 1,
        startTime: 12,
        endTime: 14,
        date: DateTime.utc(2025, 02, 27),
        content: 'Flutter 공부',
        settingTime: DateTime.now().toUtc(),
        categoryColor: categoryColor[4],
      ),
      Schedule(
        id: 2,
        startTime: 15,
        endTime: 17,
        date: DateTime.utc(2025, 02, 27),
        content: 'CV 공부',
        settingTime: DateTime.now().toUtc(),
        categoryColor: categoryColor[5],
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Schedule resp = await showModalBottomSheet(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(
                SelectedDate: selected,
              );
            },
          );
          setState(() {
            _events = {
              ..._events,
              resp.date : [
                if (_events.containsKey(resp.date))
                  ... _events[resp.date]!,
                resp,
              ]
            };
          });
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              onDaySelected: OnDaySelected,
              selectedDayPredicate: selectedDayPredicate,
              selected: selected,
            ),
            TodayBanner(
              date: DateTime.utc(2025, 02, 25), 
              DateCnt: 0
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ListView.separated(
                  itemCount: _events.containsKey(selected) ? 
                  _events[selected]!.length : 0,
                  itemBuilder: (context, index) {
                    final SelectedData = _events[selected]![index];

                    return ScheduleCard(
                      StartTime: SelectedData.startTime,
                      EndTime: SelectedData.endTime,
                      content: SelectedData.content, 
                      color: SelectedData.categoryColor,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8.0);
                  },
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