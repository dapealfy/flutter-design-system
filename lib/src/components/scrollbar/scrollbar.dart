import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsScrollbar extends StatelessWidget {
  const FunDsScrollbar({
    super.key,
    required this.scrollController,
    this.orientation = ScrollbarOrientation.right,
    this.size = ScrollbarSize.small,
    required this.child,
  });

  final ScrollController scrollController;

  final ScrollbarOrientation orientation;

  final ScrollbarSize size;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final thickness = size == ScrollbarSize.small ? 4.w : 6.w;
    const scrollbarSpace = 8.0;

    // To avoid the content being hidden by the scrollbar, we need to add padding
    final contentPadding = switch (orientation) {
      ScrollbarOrientation.right =>
        EdgeInsets.only(right: thickness + scrollbarSpace * 2),
      ScrollbarOrientation.left =>
        EdgeInsets.only(left: thickness + scrollbarSpace * 2),
      ScrollbarOrientation.bottom =>
        EdgeInsets.only(bottom: thickness + scrollbarSpace * 2),
      ScrollbarOrientation.top =>
        EdgeInsets.only(top: thickness + scrollbarSpace * 2),
    };

    final scrollbarPadding = switch (orientation) {
      ScrollbarOrientation.right => const EdgeInsets.only(
          right: scrollbarSpace,
          top: scrollbarSpace,
          bottom: scrollbarSpace,
        ),
      ScrollbarOrientation.left => const EdgeInsets.only(
          left: scrollbarSpace,
          top: scrollbarSpace,
          bottom: scrollbarSpace,
        ),
      ScrollbarOrientation.bottom => const EdgeInsets.only(
          bottom: scrollbarSpace,
          left: scrollbarSpace,
          right: scrollbarSpace,
        ),
      ScrollbarOrientation.top => const EdgeInsets.only(
          top: scrollbarSpace,
          left: scrollbarSpace,
          right: scrollbarSpace,
        ),
    };

    return RawScrollbar(
      thumbColor: FunDsColors.colorNeutral500,
      trackColor: FunDsColors.colorNeutral200,
      trackBorderColor: FunDsColors.colorNeutral200,
      thickness: thickness,
      radius: const Radius.circular(24),
      trackRadius: const Radius.circular(24),
      interactive: true,
      trackVisibility: true,
      thumbVisibility: true,
      minThumbLength: 48,
      controller: scrollController,
      scrollbarOrientation: orientation,
      padding: scrollbarPadding,
      child: Padding(
        padding: contentPadding,
        child: child,
      ),
    );
  }
}

enum ScrollbarSize {
  small,
  medium,
}
