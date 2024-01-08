import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CheckboxCatalog extends StatefulWidget {
  const CheckboxCatalog({super.key});

  @override
  State<CheckboxCatalog> createState() => _CheckboxCatalogState();
}

class _CheckboxCatalogState extends State<CheckboxCatalog> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {

    final variant = context.knobs.options<FunDsCheckboxVariant>(
      label: 'FunDsCheckboxVariant',
      description: 'Pick one variant',
      initial: FunDsCheckboxVariant.primary,
      options: [
        const Option(label: 'Primary', value: FunDsCheckboxVariant.primary),
        const Option(label: 'Secondary', value: FunDsCheckboxVariant.secondary),
        const Option(label: 'Tertiary', value: FunDsCheckboxVariant.tertiary),
        const Option(label: 'Alert', value: FunDsCheckboxVariant.alert),
        const Option(label: 'Disabled', value: FunDsCheckboxVariant.disabled),
      ],
    );

    return CatalogPage(
      title: 'Checkbox',
      description: 'Widget name: FunDsCheckbox',
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            FunDsCheckbox(
              key: const Key('cb_primary'),
              variant: variant,
              defaultValue: true,
              onChanged: (value){},
            ),
            FunDsCheckbox(
              key: const Key('cb_primary_label'),
              variant: variant,
              label: 'Label',
              defaultValue: true,
              onChanged: (value){},
            ),
            FunDsCheckbox(
              key: const Key('cb_primary_label_desc'),
              variant: variant,
              label: 'Label',
              desc: 'Desc',
              defaultValue: true,
              onChanged: (value){},
            ),
          ],
        ),
      ),
    );
  }

}
