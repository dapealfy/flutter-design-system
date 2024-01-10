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
    required this.isLoading,
    required this.isExpanded,
  });

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin {
  final _expandDuration = const Duration(milliseconds: 200);

  late AnimationController _animationController;
  late Animation<double> _iconTurns;

  AccordionState state = AccordionState.collapse;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: _expandDuration, vsync: this);
    _iconTurns = _animationController.drive(Tween<double>(begin: 0.0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeIn)));

    setState(() {
      if (widget.isLoading) {
        state = AccordionState.skeleton;
      } else if (widget.isExpanded) {
        state = AccordionState.expand;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        state == AccordionState.skeleton ? _buildAccordion() : _buildSkeleton(),
        const Divider()
      ],
    );
  }

  Widget _buildAccordion() {
    return ExpansionTile(
      title: Text(
        widget.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: FunDsTypography.heading14
            .copyWith(color: FunDsColors.colorNeutral900),
      ),
      onExpansionChanged: _onExpansionChanged,
      iconColor: FunDsColors.colorNeutral600,
      initiallyExpanded: state == AccordionState.expand,
      trailing: RotationTransition(
        turns: _iconTurns,
        child: Icon(
          Icons.keyboard_arrow_up_outlined,
          size: 20.r,
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    return Container();
  }

  void _onExpansionChanged(bool isExpanded) {
    // taken from ExpansionTile source code
    if (isExpanded) {
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
  }
}
