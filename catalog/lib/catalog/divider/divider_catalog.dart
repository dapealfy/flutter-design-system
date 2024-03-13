import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class DividerCatalog extends StatelessWidget {
  const DividerCatalog({super.key});

  @override
  Widget build(BuildContext context) {

    var text = context.knobs.text(label: 'Text', initial: 'Atau');

    return CatalogPage(
      title: 'Divider',
      description: 'Widget name: FunDsDivider',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Default', style: FunDsTypography.heading14,),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: FunDsDivider(key: Key('FunDsDividerDefault')),
          ),
          Text('Thick Line', style: FunDsTypography.heading14,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FunDsDivider.thickLine(key: const Key('FunDsDividerThickLine')),
          ),
          Text('Text And Line', style: FunDsTypography.heading14,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FunDsDivider.textAndLine(
              key: const Key('FunDsDividerTextAndLine'),
              text: text,
            ),
          ),
          Text('Solid Text', style: FunDsTypography.heading14,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FunDsDivider.solidText(
              key: const Key('FunDsDividerSolidText'),
              text: text,
            ),
          ),
          Text('Line With Label', style: FunDsTypography.heading14,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FunDsDivider.lineWithLabel(
              key: const Key('FunDsDividerLineWithLabel'),
              text: text,
            ),
          ),
        ],
      ),
    );
  }
}
