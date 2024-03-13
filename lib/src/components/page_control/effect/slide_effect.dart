import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/page_control/painter/indicator_painter.dart';
import 'package:flutter_design_system/src/components/page_control/painter/slide_painter.dart';

class SlideEffect extends FunDsBasicIndicatorEffect {
  final SlideType type;

  const SlideEffect({
    this.type = SlideType.normal,
    Color activeDotColor = FunDsColors.colorPrimary,
    double dotWidth = 6,
    double dotHeight = 6,
    double spacing = 4,
    double radius = 6,
    Color dotColor = FunDsColors.colorNeutral400,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  }) : super(
            dotWidth: dotWidth,
            dotHeight: dotHeight,
            spacing: spacing,
            radius: radius,
            strokeWidth: strokeWidth,
            paintStyle: paintStyle,
            dotColor: dotColor,
            activeDotColor: activeDotColor);

  @override
  IndicatorPainter buildPainter(int count, double offset) {
    return SlidePainter(count: count, offset: offset, effect: this);
  }
}

/// The Slide effect variants
enum SlideType {
  /// Paints regular dot sliding animation
  normal,

  /// Paints masked (under-layered) dot sliding animation
  slideUnder
}
