import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AccordionState { skeleton, collapse, expand }

/// collapsible tile with fancy loading state
class Accordion extends StatefulWidget {
  /// set title, max 2 lines
  final String title;
  final String description;

  /// Show loading state / skeleton
  final bool isLoading;

  /// Ignored if [Accordion.isLoading] is true
  final bool isExpanded;

  const Accordion({
    super.key,
    required this.title,
    required this.description,
    this.isLoading = false,
    this.isExpanded = false,
  });

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin {
  final _expandDuration = const Duration(milliseconds: 200);

  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late AccordionState state;

  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: _expandDuration, vsync: this);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));

    if (widget.isLoading) {
      state = AccordionState.skeleton;
    } else if (widget.isExpanded) {
      state = AccordionState.expand;
      _animationController.value = 1;
    } else {
      state = AccordionState.collapse;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAccordion(),
        Container(height: 1.h, color: FunDsColors.colorNeutral200)
      ],
    );
  }

  Widget _buildAccordion() {
    return ListTileTheme(
      data: const ListTileThemeData(
          visualDensity: VisualDensity(horizontal: -2.5, vertical: -2.5),
          contentPadding: EdgeInsets.zero),
      child: ExpansionTile(
        title: Text(
          widget.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: FunDsTypography.heading14
              .copyWith(color: FunDsColors.colorNeutral900),
        ),
        onExpansionChanged: _onExpansionChanged,
        iconColor: FunDsColors.colorNeutral600,
        expandedAlignment: Alignment.topLeft,
        shape: const Border(),
        collapsedShape: const Border(),
        initiallyExpanded: state == AccordionState.expand,
        children: [
          Text(
            widget.description,
            textAlign: TextAlign.start,
            style: FunDsTypography.body12.copyWith(
                color: FunDsColors.colorNeutral600,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 16.h)
        ],
        trailing: RotationTransition(
          turns: _iconTurns,
          child: Icon(
            Icons.expand_more,
            size: 20.r,
          ),
        ),
      ),
    );
  }

  void _onExpansionChanged(bool isExpanded) {
    if (isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse().then<void>((void value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}
