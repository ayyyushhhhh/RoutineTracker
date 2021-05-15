import 'package:flutter/material.dart';

class ContainerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    Offset controlPoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.height, size.width / 1.5);
    path.lineTo(0, size.height / 1.5);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
