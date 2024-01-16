import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// collapsible tile with fancy loading state
class Accordion extends StatefulWidget {
  /// set title, max 2 lines
  final String title;
  final String description;

  /// Show loading state / skeleton
  final bool isLoading;
  final bool isExpanded;

  final Function(bool)? onExpansionChanged;

  final ExpansionTileController? controller;

  const Accordion({
    super.key,
    required this.title,
    required this.description,
    this.isLoading = false,
    this.isExpanded = false,
    this.onExpansionChanged,
    this.controller,
  });

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver  {
  final _expandDuration = const Duration(milliseconds: 200);

  late AnimationController _animationController;
  late Animation<double> _iconTurns;

  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    debugPrint("[LOG] _AccordionState : ${widget.key} ");
    _animationController =
        AnimationController(duration: _expandDuration, vsync: this);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));

    if (widget.isExpanded) {
      _animationController.value = 1;
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant Accordion oldWidget) {
    // TODO: implement didUpdateWidget
    debugPrint("[LOG DidUpdate] [BEFORE] _AccordionState : ${widget.key}, isExpanded: ${widget.isExpanded} ");
    super.didUpdateWidget(oldWidget);
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
        controller: widget.controller,
        collapsedShape: const Border(),
        initiallyExpanded: widget.isExpanded,
        children: [
          InkWell(
            onTap: () {
              if (widget.controller?.isExpanded == true) {
                widget.controller?.collapse();
              } else {
                widget.controller?.expand();
              }
            },
            child: Column(
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
            ),
          )
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
    widget.onExpansionChanged?.call(isExpanded);
    if (isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse().then<void>((void value) {
        if (!mounted) {
          return;
        }
      });
    }
    setState(() {});
  }
}
