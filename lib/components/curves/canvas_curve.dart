import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height - 25);
    var firstPoint = Offset(size.width / 1.25, size.height / 2);
    var firstEndPoint = Offset(size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondPoint = Offset(size.width / 4.5, size.height / 1.8);
    var secondEndPoint = const Offset(0, 0);
    path.quadraticBezierTo(
        secondPoint.dx, secondPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
