import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternalAccordion extends ImplicitlyAnimatedWidget {
  final String title;
  final String description;
  final bool isExpanded;
  final EdgeInsets? padding;
  final Function()? onTap;

  const InternalAccordion({
    super.key,
    required this.title,
    required this.description,
    this.isExpanded = false,
    this.padding,
    this.onTap,
  }) : super(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);

  @override
  AnimatedWidgetBaseState<InternalAccordion> createState() =>
      _InternalAccordionState();
}

class _InternalAccordionState
    extends AnimatedWidgetBaseState<InternalAccordion> {
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  Tween<double>? _heightFactor;
  Tween<double>? _turns;

  late Animation<double> _iconTurnsAnimation;
  late Animation<double> _heightFactorAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _heightFactor = visitor(_heightFactor, widget.isExpanded ? 1.0 : 0.0,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;

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

    return Material(
      color: FunDsColors.colorWhite,
      child: InkWell(
        onTap: widget.onTap,
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
            Align(
              heightFactor: _heightFactor?.evaluate(animation),
              child: ClipRect(
                child: Align(
                  heightFactor: _heightFactorAnimation.value,
                  alignment: Alignment.centerLeft,
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
              ),
            ),
            Divider(height: 1.h, color: FunDsColors.colorNeutral200)
          ],
        ),
      ),
    );
  }
}
