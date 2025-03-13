import 'package:flutter/material.dart';
import 'package:test_proj/const/color.dart';

class ScheduleCard extends StatelessWidget {
  final DateTime StartTime;
  final DateTime EndTime;
  final String Content;
  final Color CategoryColor;

  const ScheduleCard({
    required this.StartTime,
    required this.EndTime,
    required this.Content,
    required this.CategoryColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: primaryColor,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${StartTime.hour.toString().padLeft(2, '0')}:00',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${EndTime.hour.toString().padLeft(2, '0')}:00',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Text(
                  Content,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CategoryColor,
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
