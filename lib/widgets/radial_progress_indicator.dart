import 'package:flutter/material.dart';

class RadialProgressIndicator extends CustomPainter {
  final double intakeVal;
  final double goalVal;
  RadialProgressIndicator({@required this.goalVal, @required this.intakeVal});
  @override
  void paint(Canvas canvas, Size size) {
    double pi = 3.14;
    final double percent = (intakeVal / goalVal) * 2 * pi;
    Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 16.0;
    Offset radialPosition = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(radialPosition, size.width / 4, paint);

    Paint radialProgress = Paint();
    radialProgress.color = Colors.purple;
    radialProgress.strokeCap = StrokeCap.round;
    radialProgress.style = PaintingStyle.stroke;
    radialProgress.strokeWidth = 8.0;

    Offset arcPosition = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(Rect.fromCircle(center: arcPosition, radius: size.width / 4),
        -pi / 2, percent, false, radialProgress);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
