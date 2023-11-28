import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';

class TypograhpyCatalog extends StatelessWidget {
  const TypograhpyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return const CatalogPage(
      title: 'Typograhpy',
      child: Column(
        children: [
          Text('Add your widgets here!'),
        ],
      ),
    );
  }
}
