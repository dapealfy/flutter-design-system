import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class RadioButtonCatalog extends StatefulWidget {
  const RadioButtonCatalog({super.key});

  @override
  State<RadioButtonCatalog> createState() => _RadioButtonCatalogState();
}

class _RadioButtonCatalogState extends State<RadioButtonCatalog> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    final toogleKnob = context.knobs.boolean(
      label: 'Use Helper Text',
      description: 'Enable/Disable helper text by this knobs',
      initial: true,
    );
    return CatalogPage(
      title: 'Radio Button',
      description: 'Widget name: FunDsRadioButton',
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text('~~Disabled', style: FunDsTypography.heading24),
          ),
          FunDsRadioButton(
            key: const Key('Disabled Radio Button'),
            value: 1,
            selectedValue: 0,
            enabled: false,
            label: 'Label',
            helper: toogleKnob ? 'Help text goes here' : null,
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text('~~Selected', style: FunDsTypography.heading24),
          ),
          FunDsRadioButton(
            key: const Key('Selected Group Button2'),
            value: 2,
            selectedValue: 2,
            label: 'Label',
            helper: toogleKnob ? 'Help text goes here' : null,
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child:
                Text('~~Disabled Selected', style: FunDsTypography.heading24),
          ),
          FunDsRadioButton(
            key: const Key('Disabled Selected Radio Button'),
            value: 3,
            selectedValue: 3,
            enabled: false,
            label: 'Label',
            helper: toogleKnob ? 'Help text goes here' : null,
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text('~~Testing', style: FunDsTypography.heading24),
          ),
          FunDsRadioButton(
            value: 1,
            selectedValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            label: 'Yes',
            helper: toogleKnob ? 'I Believe it\'s works' : null,
          ),
          FunDsRadioButton(
            value: 2,
            selectedValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            label: 'No',
            helper: toogleKnob ? 'It\'s not working' : null,
          ),
          FunDsRadioButton(
            value: 3,
            selectedValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            label: 'Not Sure',
            helper: toogleKnob ? 'I don\'t know' : null,
          ),
        ],
      ),
    );
  }
}
