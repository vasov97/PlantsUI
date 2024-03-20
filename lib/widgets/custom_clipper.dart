import 'package:flutter/material.dart';

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double curveHeight = 20.0;
    const double controlPointOffset = 20.0;

    path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width / 4,
      size.height - curveHeight - controlPointOffset,
      size.width / 2,
      size.height - curveHeight,
    );

    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height - curveHeight + controlPointOffset,
      size.width + controlPointOffset,
      size.height / 2,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
