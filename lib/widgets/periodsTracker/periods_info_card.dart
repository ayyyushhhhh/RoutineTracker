import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PeriodsInfoCard extends StatelessWidget {
  final String headingText;
  final String date;
  const PeriodsInfoCard(
      {Key key, @required this.headingText, @required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        height: 160,
        width: 300,
        decoration: BoxDecoration(
            color: Color(0xFFF8C3D0), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headingText,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            Icon(
              Icons.calendar_today,
              size: 30,
            ),
            Text(
              DateFormat('dd-MM-yyyy').format(DateTime.parse(date)).toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat('EEEE').format(DateTime.parse(date)).toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
