// Flutter imports:
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  CirclePainter(this.roundColor);

  final Color roundColor;

  final _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    _paint
      ..color = roundColor
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
