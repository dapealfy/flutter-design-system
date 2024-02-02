import 'dart:math';
import 'dart:ui';

import 'package:flutter_design_system/src/components/page_control/effect/scrolling_dots_effect.dart';
import 'package:flutter_design_system/src/components/page_control/painter/indicator_painter.dart';

class ScrollingDotsPainter extends BasicIndicatorPainter {
  /// The painting configuration
  final ScrollingDotsEffect effect;

  List<double> dotScales = [];

  void initDotScales() {
    const smallDotScale = 0.5;
    final switchPoint = (effect.maxVisibleDots / 2).floor();
    // Build list of scale to help us draw
    // Assume smallDotScale = 0.5
    // The center value should be 1.0
    // 0 = smallDotScale
    // 1 = 0.75
    // 2 = 1.0
    // 3 = 0.75
    // 4 = smallDotScale
    // 5 = 0
    dotScales.clear();
    for (var index = 0; index <= effect.maxVisibleDots; index++) {
      if (index <= switchPoint) {
        final scale =
            smallDotScale + (1 - smallDotScale) * (index / switchPoint);

        dotScales.add(scale);
      } else if (index < effect.maxVisibleDots) {
        final scale = smallDotScale +
            (1 - smallDotScale) *
                (((effect.maxVisibleDots - 1) - index) / switchPoint);
        dotScales.add(scale);
      } else {
        const scale = 0.0;
        dotScales.add(scale);
      }
    }
  }

  /// Default constructor
  ScrollingDotsPainter({
    required this.effect,
    required int count,
    required double offset,
  }) : super(offset, count, effect) {
    initDotScales();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final current = super.offset.floor();
    final switchPoint = (effect.maxVisibleDots / 2).floor();
    final firstVisibleDot =
        (current < switchPoint || count - 1 < effect.maxVisibleDots)
            ? 0
            : min(current - switchPoint, count - effect.maxVisibleDots);
    final lastVisibleDot =
        min(firstVisibleDot + effect.maxVisibleDots, count - 1);
    final inPreScrollRange = current < switchPoint;
    final inAfterScrollRange = current >= (count - 1) - switchPoint;

    final dotOffset = offset - offset.toInt();
    final dotPaint = Paint()
      ..strokeWidth = effect.strokeWidth
      ..style = effect.paintStyle;

    final drawingAnchor = (inPreScrollRange || inAfterScrollRange)
        ? -(firstVisibleDot * distance)
        : -((offset - switchPoint) * distance);

    final visibleCenterIndex = ((firstVisibleDot + lastVisibleDot) / 2).floor();
    for (var index = firstVisibleDot; index <= lastVisibleDot; index++) {
      var color = effect.dotColor;
      final normalizedIndex = index - firstVisibleDot;

      var scale = 1.0;

      if (index <= visibleCenterIndex) {
        // Left to center
        final currentScale = dotScales[normalizedIndex];

        // Left to center
        if (current < visibleCenterIndex - 1) {
          // Not yet scrolling
          scale = 1;
        } else if (current > visibleCenterIndex || inAfterScrollRange) {
          // End of scroll
          scale = currentScale;
        } else if (current == visibleCenterIndex) {
          // Start scrolling
          if (normalizedIndex == 0) {
            // First index scale become 0
            scale = lerpDouble(currentScale, 0, dotOffset) ?? 0;
            // scale = targetScale - (targetScale * dotOffset);
          } else {
            // Gradually become newTarget from targetScale
            final newTarget = dotScales[normalizedIndex - 1];
            scale = lerpDouble(currentScale, newTarget, dotOffset) ?? 0;
          }
        } else {
          // Before scolling, lerp to scale from 1
          scale = lerpDouble(1, currentScale, dotOffset) ?? 0;
        }
      }

      if (index > visibleCenterIndex) {
        // Center to right
        if (current > visibleCenterIndex) {
          scale = 1;
        } else {
          final currentScale = dotScales[normalizedIndex];

          if (current == visibleCenterIndex) {
            // Start scrolling
            if (inAfterScrollRange) {
              // End of scroll, lerp to 1
              scale = lerpDouble(currentScale, 1, dotOffset) ?? 0;
            } else {
              // Lerp to next scale
              final nextScale = dotScales[normalizedIndex - 1];
              scale = lerpDouble(currentScale, nextScale, dotOffset) ?? 0;
            }
          } else {
            // Not yet scrolling
            scale = currentScale;
          }
        }
      }

      final scaledWidth = (effect.dotWidth * scale);
      final scaledHeight = effect.dotHeight * scale;
      final yPos = size.height / 2;
      final xPos = effect.dotWidth / 2 + drawingAnchor + (index * distance);

      final rRect = RRect.fromLTRBR(
        xPos - scaledWidth / 2 + effect.spacing / 2,
        yPos - scaledHeight / 2,
        xPos + scaledWidth / 2 + effect.spacing / 2,
        yPos + scaledHeight / 2,
        dotRadius * scale,
      );

      canvas.drawRRect(rRect, dotPaint..color = color);
    }

    // Paint indicator
    final activeDotPainter = Paint()..color = effect.activeDotColor;

    final scaledWidth = effect.dotWidth;
    final scaledHeight = effect.dotHeight;
    final yPos = size.height / 2;
    final xPos = effect.dotWidth / 2 + drawingAnchor + (offset * distance);

    final rRect = RRect.fromLTRBR(
      xPos - scaledWidth / 2 + effect.spacing / 2,
      yPos - scaledHeight / 2,
      xPos + scaledWidth / 2 + effect.spacing / 2,
      yPos + scaledHeight / 2,
      dotRadius * 1.0,
    );

    canvas.drawRRect(rRect, activeDotPainter);
  }
}
