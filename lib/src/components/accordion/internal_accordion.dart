import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _duration = Duration(milliseconds: 300);
const _loadingFadeDuration = Duration(milliseconds: 200);
const _curves = Curves.fastOutSlowIn;

class InternalAccordion extends ImplicitlyAnimatedWidget {
  final String title;
  final String description;
  final bool isExpanded;
  final bool isLoading;
  final EdgeInsets? padding;
  final Function()? onTap;

  const InternalAccordion({
    super.key,
    required this.title,
    required this.description,
    this.isExpanded = false,
    this.isLoading = false,
    this.padding,
    this.onTap,
  }) : super(duration: _duration, curve: _curves);

  @override
  AnimatedWidgetBaseState<InternalAccordion> createState() =>
      _InternalAccordionState();
}

class _InternalAccordionState
    extends AnimatedWidgetBaseState<InternalAccordion> {
  final Animatable<double> _easeInTween = CurveTween(curve: _curves);

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

    return AnimatedCrossFade(
      firstChild: _buildSkeleton(),
      secondChild: _accordion(padding),
      crossFadeState: widget.isLoading
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: _loadingFadeDuration,
    );
  }

  _accordion(EdgeInsets padding) {
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
                  style: FunDsTypography.heading14.copyWith(
                      color: FunDsColors.colorNeutral900, height: 1.21),
                )),
                RotationTransition(
                  turns: _iconTurnsAnimation,
                  child: Icon(
                    Icons.expand_less,
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
                    child: FadeTransition(
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.start,
                        style: FunDsTypography.body12.copyWith(
                            color: FunDsColors.colorNeutral600,
                            fontWeight: FontWeight.w400),
                      ),
                      opacity: _heightFactorAnimation,
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

  _buildSkeleton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Shimmer(
          isLoading: widget.isLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: 32.w),
                height: 12.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: FunDsColors.colorWhite,
                ),
              )),
              Container(
                height: 17.1.h,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: FunDsColors.colorWhite,
                ),
              )
            ]),
          ),
        ),
        Divider(height: 1.h, color: FunDsColors.colorNeutral200)
      ],
    );
  }
}
