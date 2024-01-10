import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

/// A border that combines two borders.
class DoubleBorder extends BoxBorder with EquatableMixin {
  const DoubleBorder({
    required this.innerBorder,
    required this.outerBorder,
    this.outerGap = 0,
  });

  final Border innerBorder;

  final Border outerBorder;

  /// The gap between the inner and outer border.
  final double outerGap;

  @override
  List<Object?> get props => [outerBorder, innerBorder, outerGap];

  @override
  BorderSide get bottom => innerBorder.bottom;

  @override
  BorderSide get top => innerBorder.top;

  @override
  EdgeInsetsGeometry get dimensions => innerBorder.dimensions
      .add(outerBorder.dimensions)
      .add(EdgeInsets.all(outerGap));

  @override
  bool get isUniform => innerBorder.isUniform;

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    final inner = outerBorder.lerpFrom(a, t);
    final outer = innerBorder.lerpFrom(a, t);

    if (inner == null || outer == null) return null;
    return DoubleBorder(
      outerBorder: inner as Border,
      innerBorder: outer as Border,
    );
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    final inner = outerBorder.lerpTo(b, t);
    final outer = innerBorder.lerpTo(b, t);

    if (inner == null || outer == null) return null;
    return DoubleBorder(
      outerBorder: inner as Border,
      innerBorder: outer as Border,
    );
  }

  @override
  ShapeBorder scale(double t) {
    return DoubleBorder(
      outerBorder: outerBorder.scale(t),
      innerBorder: innerBorder.scale(t),
    );
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    innerBorder.paint(
      canvas,
      rect,
      textDirection: textDirection,
      shape: shape,
      borderRadius: borderRadius,
    );

    // Paint outer border
    double innerBorderWidth = [
      innerBorder.bottom.width,
      innerBorder.top.width,
      innerBorder.left.width,
      innerBorder.right.width
    ].max;

    final inflateSize = innerBorderWidth + outerGap;
    final outerRect = rect.inflate(inflateSize);

    outerBorder.paint(
      canvas,
      outerRect,
      textDirection: textDirection,
      shape: shape,
      borderRadius: borderRadius
          ?.add(
            BorderRadius.circular(inflateSize),
          )
          .resolve(textDirection),
    );
  }
}
