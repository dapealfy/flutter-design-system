import 'package:catalog/catalog/example/example_component.dart';
import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ExampleCatalog extends StatelessWidget {
  const ExampleCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.knobs.text(
      label: 'title',
      description: 'Text knob for title',
      initial: 'Your title',
    );

    final numberKnob = context.knobs.sliderInt(
      label: 'number',
      description: 'Slider knob for number',
      initial: 5,
      min: 0,
      max: 10,
    );

    final optionKnobs = context.knobs.options<OptionEnum>(
      label: 'option',
      description: 'Option knob',
      initial: OptionEnum.option1,
      options: [
        const Option(label: 'Option 1', value: OptionEnum.option1),
        const Option(label: 'Option 2', value: OptionEnum.option2),
        const Option(label: 'Option 3', value: OptionEnum.option3),
      ],
    );

    final toogleKnob = context.knobs.boolean(
      label: 'toogle',
      description: 'Boolean knob for toogle',
      initial: false,
    );

    return CatalogPage(
      title: 'Example',
      description: 'Example description that you can put here',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ExampleComponent(
              title: title,
              number: numberKnob,
              toogle: toogleKnob,
              option: optionKnobs,
            ),
          ),
        ],
      ),
    );
  }
}
