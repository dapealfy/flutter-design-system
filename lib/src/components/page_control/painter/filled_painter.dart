import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/page_control/effect/filled_effect.dart';
import 'package:flutter_design_system/src/components/page_control/painter/indicator_painter.dart';

class FilledPainter extends BasicIndicatorPainter {
  final FilledEffect effect;

  /// Default constructor
  FilledPainter({
    required this.effect,
    required int count,
    required double offset,
  }) : super(offset, count, effect);

  @override
  void paint(Canvas canvas, Size size) {
    // paint still dots

    paintStillDots(canvas, size);
    final activeDotPainter = Paint()..color = effect.activeDotColor;
    final dotOffset = offset - offset.toInt();
    canvas.saveLayer(Rect.largest, Paint());

    // Paint fills
    final usedOffset = effect.onZero == OnZero.empty ? offset : offset + 1;
    final activePos = usedOffset.toInt();
    for (var i = 0; i < count; i++) {
      if (i < usedOffset) {
        final xPos = (i * distance);
        final yPos = size.height / 2;

        var right = xPos + effect.dotWidth;

        if (activePos == i) {
          right = xPos + (effect.dotWidth * dotOffset);
        }

        final bounds = Rect.fromLTRB(
          xPos,
          yPos - effect.dotHeight / 2,
          right,
          yPos + effect.dotHeight / 2,
        );

        var rect = RRect.fromRectAndRadius(bounds, dotRadius);

        canvas.drawRRect(rect, activeDotPainter);
      }
    }

    maskStillDots(size, canvas);
    canvas.restore();

    // final xPos = offset * distance;
    // final yPos = size.height / 2;
    // final rRect = RRect.fromLTRBR(
    //   xPos,
    //   yPos - effect.dotHeight / 2,
    //   xPos + effect.dotWidth,
    //   yPos + effect.dotHeight / 2,
    //   dotRadius,
    // );

    // canvas.saveLayer(Rect.largest, Paint());
    // canvas.drawRRect(rRect, activeDotPainter);
    // maskStillDots(size, canvas);
    // canvas.restore();
  }
}
