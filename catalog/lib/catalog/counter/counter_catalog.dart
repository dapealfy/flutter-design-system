import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _counterDescription = '''
Widget name: Counter
Check knobs for more control (right side panel in web, gear icon in mobile)

How to Use:

// Counter

final exampleValue = 0;

funds.Counter(
  label: labelValue,
  enabled: enabled, // Optional , default value is true
  onChanged: (int value) {
    setState(() {
      exampleValue = value;
    });
  },
  range : 1, // Optional, default value is 1
  error : exampleValue > 20 ? 'This is error message' : null, // Optional, this error will shown if you set the errorMessage , set null if you want to hide error
  min: 1, // Optional, default value is 1
  max: 30, // Optional, default value is 999
  initialValue: 12, // Optional if you want to set initial value 
);
''';

class CounterCatalog extends StatefulWidget {
  const CounterCatalog({super.key});

  @override
  State<CounterCatalog> createState() => _CounterCatalogState();
}

class _CounterCatalogState extends State<CounterCatalog> {
  double sliderValue = 0;
  RangeValues rangeValue = const RangeValues(0, 10);
  int? result = 12;

  @override
  Widget build(BuildContext context) {
    final enabled = context.knobs.boolean(label: 'enabled', initial: true);
    final labelOption = context.knobs.options<int?>(
      label: 'label',
      initial: 1,
      options: [
        const Option(label: 'None', value: null),
        const Option(
          label: 'Example',
          value: 1,
        ),
      ],
    );

    final labelSingle = switch (labelOption) {
      1 => 'Example Label',
      _ => '',
    };

    final labelRange = context.knobs.text(label: 'range', initial: '1');
    final labelMin = context.knobs.text(label: 'min', initial: '1');
    final labelMax = context.knobs.text(label: 'max', initial: '999');
    final initialValue =
        context.knobs.text(label: 'initialValue', initial: '12');
    return CatalogPage(
        title: 'Counter',
        description: _counterDescription,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            funds.FunDsCounter(
              label: labelSingle,
              enabled: enabled,
              onChanged: (value) {
                setState(() {
                  result = value;
                });
              },
              errorMessage: (result ?? 0) > 20 ? 'This is error message' : null,
              min: int.tryParse(labelMin) ?? 0,
              max: int.tryParse(labelMax) ?? 30,
              range: int.tryParse(labelRange) ?? 1,
              initialValue: int.tryParse(initialValue) ?? 12,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Result : ${result ?? ''}',
              style: FunDsTypography.body16,
            )
          ],
        ));
  }
}
