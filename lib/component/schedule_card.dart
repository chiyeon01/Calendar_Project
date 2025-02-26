import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final int StartTime;
  final int EndTime;
  final String content;
  final Color color;

  const ScheduleCard({
    required this.StartTime,
    required this.EndTime,
    required this.content,
    required this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, 
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(
          8.0
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${StartTime.toString().padLeft(2, '0')}:00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '${EndTime.toString().padLeft(2, '0')}:00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 16.0
              ),
              Expanded(
                child: Text(
                  content,
                )
              ),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                width: 16.0,
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}