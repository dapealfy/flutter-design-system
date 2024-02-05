import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';

class GroupAccordionCatalog extends StatefulWidget {
  const GroupAccordionCatalog({super.key});

  @override
  State<GroupAccordionCatalog> createState() => _GroupAccordionCatalogState();
}

class _GroupAccordionCatalogState extends State<GroupAccordionCatalog> {
  bool _isLoading = false;

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
          title: 'Can be initially opened\nWith [initiallyOpenedAt] property',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
              'Nunc nec erat ex. Mauris ullamcorper lectus sed est '
              'consectetur, vitae condimentum elit efficitur. '
              'Praesent ultricies fringilla felis, et tempor ex '
              'sagittis sed. Etiam dignissim arcu justo, et iaculis'
              'nisi dapibus non. Maecenas cursus sapien et libero'
              'varius viverra. Sed maximus felis id malesuada '),
    ];
    return CatalogPage(
      title: 'Accordion Group',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccordionGroup(
            accordions: accordions,
            initiallyOpenedAt: 2,
            isLoading: _isLoading,
          ),
          const SizedBox(height: 20),
          FunDsButton(
            type: FunDsButtonType.small,
            variant: FunDsButtonVariant.primary,
            text: 'Toggle isLoading : $_isLoading',
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
          )
        ],
      ),
    );
  }
}
