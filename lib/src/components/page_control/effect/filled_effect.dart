import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/page_control/painter/filled_painter.dart';
import 'package:flutter_design_system/src/components/page_control/painter/indicator_painter.dart';

class FilledEffect extends BasicIndicatorEffect {
  /// Control the fill behavior when the offset is 0
  /// defaults to [OnZero.fill] which will fill the first dot
  /// if [OnZero.empty] is used, the first dot will be empty
  final OnZero onZero;

  const FilledEffect({
    Color activeDotColor = FunDsColors.colorPrimary,
    double dotWidth = 6,
    double dotHeight = 6,
    double spacing = 4,
    double radius = 6,
    Color dotColor = FunDsColors.colorNeutral400,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
    this.onZero = OnZero.fill,
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
    return FilledPainter(count: count, offset: offset, effect: this);
  }
}

enum OnZero {
  /// When offset is 0, the first dot will be empty
  empty,

  /// When offset is 0, the first dot will be filled
  fill,
}
