import 'package:flutter/material.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFB90F48),
    Color(0xFF020101),
    Color(0xFFB90F48),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

/// taken from https://docs.flutter.dev/cookbook/effects/shimmer-loading
class ShimmerContainer extends StatefulWidget {
  static ShimmerContainerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerContainerState>();
  }

  const ShimmerContainer({
    super.key,
    this.linearGradient = _shimmerGradient,
    this.child,
  });

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  ShimmerContainerState createState() => ShimmerContainerState();
}

class ShimmerContainerState extends State<ShimmerContainer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

// code-excerpt-closing-bracket

  LinearGradient get gradient => LinearGradient(
    colors: widget.linearGradient.colors,
    stops: widget.linearGradient.stops,
    begin: widget.linearGradient.begin,
    end: widget.linearGradient.end,
    transform:
    _SlidingGradientTransform(slidePercent: _shimmerController.value),
  );

  bool get isSized => (context.findRenderObject() as RenderBox).hasSize;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}