import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;

    // Path path = Path();
    // path.moveTo(0, 30);
    // path.quadraticBezierTo(width / 7, height * 0.1, width / 5 , 30);
    // path.quadraticBezierTo(width / 1.5, height * 1.2, width, height / 2 - 50);
    // path.lineTo(width, height);
    // path.lineTo(0, height);
    // path.close();
    // return path;

    Path path = Path();
    path.lineTo(0, height - 50);
    path.cubicTo(50, height - 100, width - 50, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
