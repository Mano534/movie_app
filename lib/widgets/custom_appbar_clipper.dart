import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final double height = size.height;
    final double width = size.width;
    Path path =Path();
    path.lineTo(0, height-50);
    path.quadraticBezierTo(width/2, height , width , height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
  
}