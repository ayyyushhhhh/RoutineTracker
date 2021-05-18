import 'package:flutter/material.dart';
import 'package:routinetracker/settings/prefrences.dart';

class RadialPeriodTracker extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double pi = -3.14;
    DateTime firstDay = DateTime.parse(Prefrences.getPeriodFirstDayDate());
    DateTime periodDay = DateTime.parse(Prefrences.getPeriodDayDate());
    final int difference = periodDay.difference(firstDay).inDays;
    final int todayDate = periodDay.difference(DateTime.now()).inDays;
    final percent = ((difference - todayDate) / difference) * 2 * pi;

    Paint backPaint = Paint();
    backPaint.color = Color(0xFFFFE5E4);
    backPaint.strokeCap = StrokeCap.round;
    backPaint.strokeWidth = 32;
    backPaint.style = PaintingStyle.stroke;
    Offset center = Offset(size.height / 2, size.width / 2);
    canvas.drawCircle(center, size.width / 2.75, backPaint);

    Paint progressPaint = Paint();
    progressPaint.color = Color(0xFFFD679C);
    progressPaint.style = PaintingStyle.stroke;
    progressPaint.strokeCap = StrokeCap.round;
    progressPaint.strokeWidth = 24;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2.75),
        pi / 2, -percent, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
