import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.8, size.width * 0.5, size.height * 0.9
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.99, size.width, size.height * 0.75
    );
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
  

}