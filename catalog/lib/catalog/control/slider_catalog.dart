import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:storybook_flutter/storybook_flutter.dart';

const _sliderDescription = '''
Widget name: Slider
Check knobs for more control (right side panel in web, gear icon in mobile)

How to Use:

// Slider
funds.Slider.slider(
  value: sliderValue,
  enabled: enabled,
  min: 0,
  max: 100,
  divisions: 5, // Optional if you want to make discrete slider
  label: sliderLabel, // Optional if you want to show label when division is not null
  onChanged: (value) {
    setState(() {
      sliderValue = value;
    });
  },
);

// Range Slider
funds.Slider.rangeSlider(
  value: rangeValue,
  enabled: enabled,
  divisions: 5, // Optional if you want to make discrete slider
  labels: rangeLabels, // Optional if you want to show label when division is not null
  onChanged: (value) {
    setState(() {
      rangeValue = value;
    });
  },
  min: 0,
  max: 100,
);
''';

class SliderCatalog extends StatefulWidget {
  const SliderCatalog({super.key});

  @override
  State<SliderCatalog> createState() => _SliderCatalogState();
}

class _SliderCatalogState extends State<SliderCatalog> {
  double sliderValue = 0;
  RangeValues rangeValue = const RangeValues(0, 10);

  @override
  Widget build(BuildContext context) {
    final enabled = context.knobs.boolean(label: 'enabled', initial: true);
    final division = context.knobs.text(label: 'division', initial: '');
    final labelOption = context.knobs.options<int?>(
      label: 'label',
      description: 'Label displayed if division is not null',
      initial: null,
      options: [
        const Option(label: 'None', value: null),
        const Option(
          label: 'Value',
          value: 1,
        ),
      ],
    );

    final labelSingle = switch (labelOption) {
      1 => sliderValue.toInt().toString(),
      _ => null,
    };

    final labelRange = switch (labelOption) {
      1 => RangeLabels(
          rangeValue.start.toInt().toString(),
          rangeValue.end.toInt().toString(),
        ),
      _ => null,
    };

    return CatalogPage(
      title: 'Slider',
      description: _sliderDescription,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          funds.FunDsSlider.slider(
            value: sliderValue,
            enabled: enabled,
            min: 0,
            max: 100,
            divisions: division.isNotEmpty
                ? int.tryParse(division)?.clamp(1, 100)
                : null,
            label: labelSingle,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          const SizedBox(height: 8),
          Text('Value: $sliderValue (min: 0, max: 100)'),
          const SizedBox(height: 16),
          funds.FunDsSlider.rangeSlider(
            value: rangeValue,
            enabled: enabled,
            divisions: division.isNotEmpty
                ? int.tryParse(division)?.clamp(1, 100)
                : null,
            labels: labelRange,
            onChanged: (value) {
              setState(() {
                rangeValue = value;
              });
            },
            min: 0,
            max: 100,
          ),
          const SizedBox(height: 8),
          Text(
            'Value: ${rangeValue.start} - ${rangeValue.end} (min: 0, max: 100)',
          ),
        ],
      ),
    );
  }
}
