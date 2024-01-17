import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/colors/colors.dart';
import 'package:flutter_design_system/src/typography/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAccordion extends StatefulWidget {
  /// set title, max 2 lines
  final String title;
  final String description;

  /// Show loading state / skeleton
  final bool isLoading;
  final bool isInitiallyExpanded;

  /// content padding.
  /// useful to adjust for a full-width screen accordion
  final EdgeInsets? padding;

  const CustomAccordion(
      {Key? key,
      required this.title,
      required this.description,
      this.isLoading = false,
      this.isInitiallyExpanded = false,
      this.padding})
      : super(key: key);

  @override
  _CustomAccordionState createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion>
    with SingleTickerProviderStateMixin {
  final _expandDuration = const Duration(milliseconds: 200);
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: _expandDuration, vsync: this);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
    _heightFactor = _animationController.drive(_easeInTween);

    if (widget.isInitiallyExpanded) {
      _isExpanded = widget.isInitiallyExpanded;
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _animationController.isDismissed;
    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                textAlign: TextAlign.start,
                style: FunDsTypography.body12.copyWith(
                    color: FunDsColors.colorNeutral600,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );

    final padding = widget.padding ?? EdgeInsets.symmetric(vertical: 12.h);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Material(
          color: FunDsColors.colorWhite,
          child: InkWell(
            onTap: _toggleExpansion,
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
                      turns: _iconTurns,
                      child: Icon(
                        Icons.expand_more,
                        size: 20.r,
                      ),
                    )
                  ]),
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    heightFactor: _heightFactor.value,
                    child: child,
                  ),
                ),
                Divider(height: 1.h, color: FunDsColors.colorNeutral200)
              ],
            ),
          ),
        );
      },
      child: result,
    );
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
    });
  }
}
