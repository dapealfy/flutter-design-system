import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';

class GroupAccordionCatalog extends StatelessWidget {
  const GroupAccordionCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    const accordions = [
      Accordion(title: 'title 1', description: 'description'),
      Accordion(
        title: 'title 2',
        description: 'description',
        isInitiallyExpanded: true, // ignored
      ),
      Accordion(
          title: 'Can be initially opened',
          description: 'using [initiallyOpenedAt] property'),
    ];
    return const CatalogPage(
        title: 'Accordion Group',
        child: AccordionGroup(
          accordions: accordions,
          initiallyOpenedAt: 2,
        ));
  }
}
