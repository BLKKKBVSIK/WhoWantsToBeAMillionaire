import 'package:flutter/material.dart';

/// [HexagonalClipper], can be used with [ClipPath] widget, and clips the widget in Hexagon shape
class HexagonalClipper extends CustomClipper<Path> {
  final bool reverse;

  HexagonalClipper({this.reverse = false});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width * 0.0, size.height * 0.5)
      ..lineTo(size.width * 0.1, size.height * 1)
      ..lineTo(size.width * 0.9, size.height * 1)
      ..lineTo(size.width * 1, size.height * 0.5)
      ..lineTo(size.width * 0.9, size.height * 0)
      ..lineTo(size.width * 0.1, size.height * 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
