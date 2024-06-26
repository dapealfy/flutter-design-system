import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

import 'internal_accordion.dart';

/// Create a group of accordions that can be opened 1 at a time
///
/// this will ignore the [FunDsAccordion.isInitiallyExpanded] property in [FunDsAccordion],
/// instead provided with another property
class FunDsAccordionGroup extends StatefulWidget {
  final int initiallyOpenedAt;
  final List<FunDsAccordion> accordions;
  final bool isLoading;

  const FunDsAccordionGroup({
    super.key,
    required this.accordions,
    this.initiallyOpenedAt = -1,
    this.isLoading = false,
  });

  @override
  State<FunDsAccordionGroup> createState() => _FunDsAccordionGroupState();
}

class _FunDsAccordionGroupState extends State<FunDsAccordionGroup> {
  late int previousOpenedIndex;
  late List<bool> expandedAccordion;

  @override
  void initState() {
    previousOpenedIndex = widget.initiallyOpenedAt;
    expandedAccordion = List.generate(widget.accordions.length, (index) {
      if (index == previousOpenedIndex) {
        return true;
      } else {
        return false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(widget.accordions.length, (index) {
        return InternalAccordion(
          key: widget.accordions[index].key,
          title: widget.accordions[index].title,
          description: widget.accordions[index].description,
          isExpanded: expandedAccordion[index],
          isLoading: widget.isLoading,
          onTap: () {
            _handleAccordionExpansionChanged(index);
          },
        );
      }),
    );
  }

  void _handleAccordionExpansionChanged(int accordionIndex) {
    setState(() {
      if (previousOpenedIndex == -1) previousOpenedIndex = accordionIndex;

      expandedAccordion[accordionIndex] = !expandedAccordion[accordionIndex];
      if (previousOpenedIndex != accordionIndex) {
        expandedAccordion[previousOpenedIndex] = false;
      }

      previousOpenedIndex = accordionIndex;
    });
  }
}
