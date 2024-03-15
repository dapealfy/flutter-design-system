import 'package:flutter/material.dart';

class RaisedCenterShape extends ShapeBorder {
  final double radius;

  const RaisedCenterShape({
    required this.radius,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    final startOffset = radius * 4;

    final startX = rect.center.dx - startOffset;
    final stopX = rect.center.dx + startOffset;

    path.moveTo(rect.left, rect.top);
    path.lineTo(startX, rect.top);

    path.cubicTo(
      // Bottom control
      rect.center.dx - startOffset + (radius * 2),
      rect.top,

      // Top control
      rect.center.dx - (radius * 2),
      rect.top - radius,

      // Target point
      rect.center.dx,
      rect.top - radius,
    );

    path.cubicTo(
      // Top control
      rect.center.dx + (radius * 2),
      rect.top - radius,

      // Bottom Control
      rect.center.dx + startOffset - (radius * 2),
      rect.top,
      // Target
      stopX,
      rect.top,
    );
    path.lineTo(rect.right, rect.top);
    path.lineTo(rect.right, rect.bottom);
    path.lineTo(rect.left, rect.bottom);

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getInnerPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPaint(BorderSide.none.toPaint());
  }

  @override
  ShapeBorder scale(double t) {
    return RaisedCenterShape(radius: radius * t);
  }
}
