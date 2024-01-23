import 'package:flutter/material.dart';

import 'internal_accordion.dart';

/// collapsible tile with fancy loading state
class Accordion extends StatefulWidget {
  /// set title, max 2 lines
  final String title;
  final String description;

  /// Show loading state / skeleton
  final bool isLoading;
  final bool isInitiallyExpanded;

  final Function(bool)? onExpansionChanged;

  const Accordion({
    super.key,
    required this.title,
    required this.description,
    this.isLoading = false,
    this.isInitiallyExpanded = false,
    this.onExpansionChanged,
  });

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver  {

  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.isInitiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InternalAccordion(
      title: widget.title,
      description: widget.description,
      isExpanded: _isExpanded,
      isLoading: widget.isLoading,
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
          widget.onExpansionChanged?.call(_isExpanded);
        });
      },
    );
  }
}
