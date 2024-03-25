import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _desc = '''
Widget name: FunDsDatePicker

Usage:

# Single Picker

FunDsDatePicker.single(
  labelText: labelText,
  descriptionText: descriptionText,
  hintText: 'Placeholder',
  helperText: helperText,
  isError: isError,
  size: size,
  dateFormat:'dd-MM-yyyy',
  firstDay: DateTime(2021, 1, 1),
  lastDay: DateTime(2055, 12, 31),
  selectedDate: selectedDate,
  onChanged: (date) {
    setState(() {
      selectedDate = date;
    });
  },
);

# Range Picker

FunDsDatePicker.range(
  labelText: labelText,
  descriptionText: descriptionText,
  hintText: const ['Placeholder A', 'Placeholder B'],
  helperText: helperText,
  isError: isError,
  size: size,
  dateFormat:'dd-MM-yyyy',
  firstDay: DateTime(2021, 1, 1),
  lastDay: DateTime(2055, 12, 31),
  selectedRange: selectedRange,
  onChanged: (start, end) {
    setState(() {
      selectedRange = [start, end];
    });
  },
);


''';

class DatePickerCatalog extends StatefulWidget {
  const DatePickerCatalog({super.key});

  @override
  State<DatePickerCatalog> createState() => _DatePickerCatalogState();
}

class _DatePickerCatalogState extends State<DatePickerCatalog> {
  DateTime? selectedDate;
  List<DateTime>? selectedRange;

  @override
  Widget build(BuildContext context) {
    final enabled = context.knobs.boolean(label: 'enabled', initial: true);
    final labelText = context.knobs.text(label: 'labelText', initial: 'Label');
    final descriptionText = context.knobs.text(
      label: 'descriptionText',
      initial: 'Description',
    );
    final helperText =
        context.knobs.text(label: 'helperText', initial: 'Helper');
    final isError = context.knobs.boolean(label: 'isError', initial: false);
    final size = context.knobs.options(
      label: 'size',
      initial: FunDsFieldSize.small,
      options: [
        const Option(label: 'small', value: FunDsFieldSize.small),
        const Option(label: 'medium', value: FunDsFieldSize.medium),
      ],
    );

    return CatalogPage(
      title: 'Date Picker',
      description: _desc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Single Date Picker',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          FunDsDatePicker.single(
            labelText: labelText,
            descriptionText: descriptionText,
            hintText: 'Placeholder',
            helperText: helperText,
            enabled: enabled,
            isError: isError,
            size: size,
            dateFormat: 'dd MMMM yyyy',
            selectedDate: selectedDate,
            onChanged: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Range Date Picker',
            style: FunDsTypography.body14B,
            textAlign: TextAlign.center,
          ),
          FunDsDatePicker.range(
            labelText: labelText,
            descriptionText: descriptionText,
            hintText: const ['Placeholder A', 'Placeholder B'],
            helperText: helperText,
            enabled: enabled,
            isError: isError,
            size: size,
            dateFormat: 'dd MMMM yyyy',
            selectedRange: selectedRange,
            onChanged: (start, end) {
              setState(() {
                selectedRange = [start, end];
              });
            },
          ),
        ],
      ),
    );
  }
}
