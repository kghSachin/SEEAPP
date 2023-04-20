import 'package:flutter/material.dart';

class CurveClipperRev extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    var firstPoint = Offset(size.width / 1.15, size.height / 3.8);
    var firstEndPoint = Offset(size.width / 1.5, size.height / 3.5);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondPoint = Offset(size.width / 4.5, size.height / 3);
    var secondEndPoint = const Offset(0, 0);
    path.quadraticBezierTo(
        secondPoint.dx, secondPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
