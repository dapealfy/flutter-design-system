import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ExampleCatalog extends StatelessWidget {
  const ExampleCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final textKnob = context.knobs.text(
      label: 'Text Knob',
      initial: 'Text Knob',
    );

    final sliderKnob = context.knobs.sliderInt(
      label: 'Slider Knob',
      initial: 5,
      min: 0,
      max: 10,
    );

    final optionKnobs = context.knobs.options<OptionEnum>(
      label: 'Option Knob',
      description: 'Option Knob description',
      initial: OptionEnum.option1,
      options: [
        const Option(label: 'Option 1', value: OptionEnum.option1),
        const Option(label: 'Option 2', value: OptionEnum.option2),
        const Option(label: 'Option 3', value: OptionEnum.option3),
      ],
    );

    final boolKnob = context.knobs.boolean(
      label: 'Bool Knob',
      initial: false,
    );

    return CatalogPage(
      title: 'Example',
      description: 'Example description that you can put here',
      child: Column(
        children: [
          Text(textKnob),
          Text(
            'Slider value : $sliderKnob',
          ),
          Text(
            'Option value : ${optionKnobs.name}',
          ),
          Text(
            'Bool value : ${boolKnob.toString()}',
          ),
        ],
      ),
    );
  }
}

enum OptionEnum {
  option1,
  option2,
  option3,
}
