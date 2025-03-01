import 'package:flutter/material.dart';

class TodayScheduleBar extends StatelessWidget {
  const TodayScheduleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.0,
      color: Colors.grey[600],
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '2025.03.01',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '0개',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        )
      )
    );
  }
}