import 'package:flutter/material.dart';

import '../constants/themes.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw white background
    final myPaint = Paint();
    myPaint.color = Colors.white;

    final mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, size.width, size.height));
    canvas.drawPath(mainBackground, myPaint);

    // Draw yellow oval
    final ovalPath = Path()
      ..moveTo(120, 0)
      ..quadraticBezierTo(170, 140, 0, 240)
      // Draw remainder
      ..lineTo(0, 0);
    myPaint.color = yellow;
    canvas.drawPath(ovalPath, myPaint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
