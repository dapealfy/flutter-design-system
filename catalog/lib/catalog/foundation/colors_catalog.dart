import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';

class ColorsCatalog extends StatelessWidget {
  const ColorsCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatalogPage(
      title: 'Colors',
      child: Column(
        children: [
          Text('Add your widgets here!'),
        ],
      ),
    );
  }
}
