import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';

class GroupAccordionCatalog extends StatelessWidget {
  const GroupAccordionCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    const accordions = [
      Accordion(key: Key('1'), title: 'title 1', description: 'description'),
      Accordion(
        key: Key('2'),
        title: 'title 2',
        description: 'adadad',
        isExpanded: true,
      ),
      Accordion(key: Key('3'), title: 'title 3', description: 'description'),
    ];
    return const CatalogPage(
        title: 'Accordion Group',
        child: AccordionGroup(accordions: accordions));
  }
}
