import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class AccordionCatalog extends StatelessWidget {
  const AccordionCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
        title: 'Catalog',
        child: Container(
          child: const Accordion(
              title: 'Title max 2 line',
              description:
                  'Sed lorem ut tempor morbi nec amet. Consequat viverra amet '
                  'parturient tellus quam semper arcu. '
                  'Est euismod nulla habitasse.'),
        ));
  }
}
