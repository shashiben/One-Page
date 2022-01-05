import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    double lineWidth = 60;

    Paint redPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    Path topRightArc = Path()
      ..moveTo(w, h)
      ..lineTo(w - lineWidth, h);

    Path bottomLeftArc = Path()
      ..moveTo(w, h)
      ..lineTo(w, h - lineWidth);
    Path c = Path()
      ..moveTo(0, 0)
      ..lineTo(lineWidth, 0);

    Path d = Path()
      ..moveTo(0, 0)
      ..lineTo(0, lineWidth);

    canvas.drawPath(topRightArc, redPaint);
    canvas.drawPath(bottomLeftArc, redPaint);
    canvas.drawPath(c, redPaint);
    canvas.drawPath(d, redPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
