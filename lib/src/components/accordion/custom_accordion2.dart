import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _InternalAccordion extends ImplicitlyAnimatedWidget {
  /// set title, max 2 lines
  final String title;
  final String description;

  /// Show loading state / skeleton
  final bool isLoading;
  final bool isExpanded;

  /// content padding.
  /// useful to adjust for a full-width screen accordion
  final EdgeInsets? padding;

  const _InternalAccordion(
      {super.key,
      required this.title,
      required this.description,
      this.isLoading = false,
      this.isExpanded = false,
      this.padding})
      : super(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn);

  @override
  ImplicitlyAnimatedWidgetState<_InternalAccordion> createState() =>
      _CustomAccordionState2();
}

class _CustomAccordionState2
    extends ImplicitlyAnimatedWidgetState<_InternalAccordion> {
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  Tween<double>? _heightFactor;
  Tween<double>? _turns;

  late Animation<double> _iconTurnsAnimation;
  late Animation<double> _heightFactorAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _heightFactor = visitor(_heightFactor, widget.isExpanded ? 1.0 : 0.0,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;

    _turns = visitor(_turns, widget.isExpanded ? 0.0 : 0.5,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _heightFactorAnimation = animation.drive(_heightFactor!);
    _iconTurnsAnimation = animation.drive(_turns!.chain(_easeInTween));
  }

  @override
  Widget build(BuildContext context) {
    final padding = widget.padding ?? EdgeInsets.symmetric(vertical: 12.h);
    final collapsibleContent = ClipRect(
      child: Align(
        heightFactor: _heightFactorAnimation.value,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Text(
            widget.description,
            textAlign: TextAlign.start,
            style: FunDsTypography.body12.copyWith(
                color: FunDsColors.colorNeutral600,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );

    return Material(
      color: FunDsColors.colorWhite,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: padding,
              child: Row(children: [
                Expanded(
                    child: Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FunDsTypography.heading14
                      .copyWith(color: FunDsColors.colorNeutral900),
                )),
                RotationTransition(
                  turns: _iconTurnsAnimation,
                  child: Icon(
                    Icons.expand_more,
                    size: 20.r,
                  ),
                )
              ]),
            ),
            collapsibleContent,
            Divider(height: 1.h, color: FunDsColors.colorNeutral200)
          ],
        ),
      ),
    );
  }
}
