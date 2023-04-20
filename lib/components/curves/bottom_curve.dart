import 'package:flutter/material.dart';

class BottomCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, 0);
    var firstPoint = Offset(size.width / 2, size.height / 5);
    var firstEndPoint = Offset(size.width / 2.1, size.height / 5.5);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondPoint = Offset(size.width / 1.15, size.height / 2.5);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        secondPoint.dx, secondPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
