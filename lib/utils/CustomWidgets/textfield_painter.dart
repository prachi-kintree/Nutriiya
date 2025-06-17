import 'package:flutter/material.dart';

class TextFieldShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.45)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);

    Rect shadowRect = Rect.fromPoints(
      Offset(0, 0),
      Offset(size.width, size.height),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(shadowRect, Radius.circular(8.0)),
      shadowPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
