import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

/// Create a group of accordions that can be opened 1 at a time
///
/// this will ignore the [Accordion.isExpanded] property in [Accordion],
/// instead provided with another property
class AccordionGroup extends StatefulWidget {
  final List<Accordion> accordions;

  const AccordionGroup({super.key, required this.accordions});

  @override
  State<AccordionGroup> createState() => _AccordionGroupState();
}

class _AccordionGroupState extends State<AccordionGroup> {
  late int expandedIndex;
  List<ExpansionTileController> controllers = [];

  @override
  void initState() {
    super.initState();
    expandedIndex = -1;
    debugPrint('\naccordion group initiated\n');
  }

  @override
  Widget build(BuildContext context) {
    // return ExpansionPanelList.radio(
    //   materialGapSize: 0.0,
    //   dividerColor: Colors.transparent,
    //   children: widget.accordions.mapIndexed((index, item) {
    //     return ExpansionPanelRadio(
    //         canTapOnHeader: true,
    //         value: index,
    //         headerBuilder: (BuildContext context, bool isExpanded) {
    //           return Column(
    //             children: [
    //               Text(
    //                 item.title,
    //                 maxLines: 2,
    //                 overflow: TextOverflow.ellipsis,
    //                 style: FunDsTypography.heading14
    //                     .copyWith(color: FunDsColors.colorNeutral900),
    //               ),
    //               Divider(height: 1.h, color: FunDsColors.colorNeutral200)
    //             ],
    //           );
    //         },
    //         body: Column(
    //           children: [
    //             Text(
    //               item.description,
    //               textAlign: TextAlign.start,
    //               style: FunDsTypography.body12.copyWith(
    //                   color: FunDsColors.colorNeutral600,
    //                   fontWeight: FontWeight.w400),
    //             ),
    //             SizedBox(height: 16.h),
    //           ],
    //         ));
    //   }).toList(),
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(widget.accordions.length, (index) {
        var _controller = ExpansionTileController();
        controllers.add(_controller);
        return Accordion(
          key: widget.accordions[index].key,
          title: widget.accordions[index].title,
          description: widget.accordions[index].description,
          isLoading: widget.accordions[index].isLoading,
          isExpanded: false,
          controller: _controller,
          onExpansionChanged: (isExpanded) {
            _handleAccordionExpansionChanged(isExpanded, index);
          },
        );
      }),
    );
  }

  void _handleAccordionExpansionChanged(bool isExpanded, int accordionIndex) {
    if (expandedIndex == -1) {
      expandedIndex = accordionIndex;
    }

    if (isExpanded) {
      if (accordionIndex != expandedIndex) {
        controllers[accordionIndex].expand();
        controllers[expandedIndex].collapse();
        setState(() {
          expandedIndex = accordionIndex;
        });
        debugPrint(controllers.toString());
      }
    }
  }
}
