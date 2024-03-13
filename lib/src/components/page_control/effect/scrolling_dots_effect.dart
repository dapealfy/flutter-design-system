import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/page_control/painter/indicator_painter.dart';
import 'package:flutter_design_system/src/components/page_control/painter/scrollin_dots_painter.dart';

class ScrollingDotsEffect extends FunDsBasicIndicatorEffect {
  /// The max number of dots to display at a time
  /// if count is <= [maxVisibleDots] [maxVisibleDots] = count
  /// must be an odd number that's >= 5
  final int maxVisibleDots;

  /// Default constructor
  const ScrollingDotsEffect({
    this.maxVisibleDots = 5,
    double dotWidth = 6,
    double dotHeight = 6,
    double spacing = 4,
    double radius = 6,
    Color dotColor = FunDsColors.colorNeutral400,
    Color activeDotColor = FunDsColors.colorPrimary,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  })  : assert(maxVisibleDots >= 5 && maxVisibleDots % 2 != 0),
        super(
          dotWidth: dotWidth,
          dotHeight: dotHeight,
          spacing: spacing,
          radius: radius,
          strokeWidth: strokeWidth,
          paintStyle: paintStyle,
          dotColor: dotColor,
          activeDotColor: activeDotColor,
        );

  @override
  Size calculateSize(int count) {
    /// Add the scaled dot width to our size calculation
    var width = (dotWidth + spacing) * (min(count, maxVisibleDots));

    return Size(width, dotHeight);
  }

  @override
  int hitTestDots(double dx, int count, double current) {
    final switchPoint = (maxVisibleDots / 2).floor();
    final firstVisibleDot =
        (current < switchPoint || count - 1 < maxVisibleDots)
            ? 0
            : min(current - switchPoint, count - maxVisibleDots).floor();
    final lastVisibleDot =
        min(firstVisibleDot + maxVisibleDots, count - 1).floor();
    var offset = 0.0;
    for (var index = firstVisibleDot; index <= lastVisibleDot; index++) {
      if (dx <= (offset += dotWidth + spacing)) {
        return index;
      }
    }
    return -1;
  }

  @override
  BasicIndicatorPainter buildPainter(int count, double offset) {
    return ScrollingDotsPainter(
      count: count,
      offset: offset,
      effect: this,
    );
  }
}
