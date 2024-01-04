import 'package:flutter/material.dart';

class DCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    final firstBeginCurve = Offset(0, size.height - 20);
    final firstEndCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstBeginCurve.dx, firstBeginCurve.dy,
        firstEndCurve.dx, firstEndCurve.dy);

    path.lineTo(size.width - 30, size.height - 20);

    final secondBeginCurve = Offset(size.width, size.height - 20);
    final secondEndCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(secondBeginCurve.dx, secondBeginCurve.dy,
        secondEndCurve.dx, secondEndCurve.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
