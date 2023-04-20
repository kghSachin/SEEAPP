import 'package:flutter/material.dart';

class BottomCurveRev extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    var firstPoint = Offset(size.width / 1.4, 0);
    var firstEndPoint = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondPoint = Offset(size.width / 4, size.height);
    var secondEndPoint = Offset(0, size.height);
    path.quadraticBezierTo(
        secondPoint.dx, secondPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
