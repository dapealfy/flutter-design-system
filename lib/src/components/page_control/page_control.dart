import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/page_control/effect/page_control_effect.dart';

export 'effect/page_control_effect.dart';

/// Page Control Component
///
/// Figma: https://www.figma.com/file/VWK8ra7NhxzTW9iY4MQ9KG/FunDS---Component-Library?type=design&node-id=5700-6734&mode=design&t=WdoV80k2UAiJQnXb-0

typedef OnDotClicked = Function(int index);

/// Page control that attached to a [PageView] and animates with it
class AttachedPageControl extends StatelessWidget {
  /// The page controller to attach to
  final PageController controller;

  /// The effect to use
  /// See [PageControlEffect]
  final PageControlEffect effect;

  /// The number of dots
  final int count;

  /// Callback when a dot is clicked
  final OnDotClicked? onDotClicked;

  const AttachedPageControl({
    super.key,
    required this.controller,
    required this.count,
    required this.effect,
    this.onDotClicked,
  });

  double get _offset {
    try {
      var offset = controller.page ?? controller.initialPage.toDouble();
      final x = offset % count;
      return x;
    } catch (_) {
      return controller.initialPage.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return BasicPageControl(
          effect: effect,
          count: count,
          offset: _offset,
          onDotClicked: onDotClicked,
        );
      },
    );
  }
}

/// A page control widget that animates when the active index changes
class AnimatedPageControl extends StatelessWidget {
  /// The active index
  final int activeIndex;

  /// The animation duration when the active index changes
  final Duration duration;

  /// The effect to use
  /// See [PageControlEffect]
  final PageControlEffect effect;

  /// The number of dots
  final int count;

  /// Callback when a dot is clicked
  final OnDotClicked? onDotClicked;

  const AnimatedPageControl({
    super.key,
    required this.activeIndex,
    required this.effect,
    required this.count,
    this.duration = const Duration(milliseconds: 300),
    this.onDotClicked,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(end: activeIndex.toDouble()),
      duration: duration,
      builder: (context, value, child) {
        return BasicPageControl(
          effect: effect,
          count: count,
          offset: value,
          onDotClicked: onDotClicked,
        );
      },
    );
  }
}

/// Basic page control where you need to provide the offset yourself
class BasicPageControl extends StatelessWidget {
  /// The offset of the page control
  final double offset;

  /// The effect to use
  final PageControlEffect effect;

  /// The number of dots
  final int count;

  /// Callback when a dot is clicked
  final OnDotClicked? onDotClicked;

  /// Default constructor
  const BasicPageControl({
    Key? key,
    required this.offset,
    required this.effect,
    required this.count,
    this.onDotClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = effect.calculateSize(count);

    return GestureDetector(
      onTapUp: _onTap,
      child: CustomPaint(
        size: size,
        // rebuild the painter with the new offset every time it updates
        painter: effect.buildPainter(count, offset),
      ),
    );
  }

  void _onTap(details) {
    if (onDotClicked != null) {
      var index = effect.hitTestDots(details.localPosition.dx, count, offset);
      if (index != -1 && index != offset.toInt()) {
        onDotClicked?.call(index);
      }
    }
  }
}
