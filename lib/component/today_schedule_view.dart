import 'package:flutter/material.dart';
import 'package:myapp/const/colors.dart';

class TodayScheduleView extends StatelessWidget {
  const TodayScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
      ),
      width: double.infinity,
      height: 60.0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '12:00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '13:00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Text('Flutter 공부'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(
                    int.parse(
                      'FF${CategoryColor[0]}',
                      radix: 16,
                    )
                  ),
                  shape: BoxShape.circle,
                ),
                width: 20.0,
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}