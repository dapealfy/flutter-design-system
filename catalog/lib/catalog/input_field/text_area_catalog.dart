import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;

import 'package:storybook_flutter/storybook_flutter.dart';

const _desc = '''

Widget Name: TextArea

Check the knobs for available options. They are located on the right side of the web interface, and under the gear icon on mobile

Usage:

funds.TextArea(
  labelText: 'Label Text',
  descriptionText: 'Description Text',
  hintText: hintText,
  rightIcon1: Text('Icon 1'),
  rightIcon2: Text('Icon 2'),
  helperText: 'Helper Text',
  textAreaSize: funds.extAreaSize.small,
  isError: false,
  enabled: true,
  onSubmitted: (value) {
    // Do mething
  },
  onChanged: (value) {
    // Realtime on changed
  },
  onChangedDebounced: (value) {
    // Debounced version for onChanged
  },
  debounceDuration: const Duration(milliseconds: 500),
),
''';

class TextAreaCatalog extends StatelessWidget {
  const TextAreaCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final labelText = context.knobs.text(
      label: 'Label Text',
      initial: 'Label',
    );

    final descriptionText = context.knobs.text(
      label: 'Description Text',
      initial: '',
    );

    final hintText = context.knobs.text(
      label: 'Hint Text',
      initial: 'Placeholder',
    );

    final helperText = context.knobs.text(
      label: 'Helper Text',
      initial: '',
    );

    final isError = context.knobs.boolean(
      label: 'Is Error',
      initial: false,
    );

    final enabled = context.knobs.boolean(
      label: 'Enabled',
      initial: true,
    );

    final maxLength = context.knobs.text(
      label: 'Max Length',
      initial: '250',
    );

    final textAreaSize = context.knobs.options<funds.TextAreaSize>(
      label: 'Text Area Size',
      initial: funds.TextAreaSize.small,
      options: [
        const Option(
          label: 'Small',
          value: funds.TextAreaSize.small,
        ),
        const Option(
          label: 'Large',
          value: funds.TextAreaSize.large,
        ),
      ],
    );

    final rightIcon1 = context.knobs.options<Widget?>(
      label: 'Right Icon 1',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        const Option(
          label: 'Icon',
          value: funds.FunDsIcon(
            funDsIconography: funds.FunDsIconography.actionIcCloud,
            size: 16,
            color: funds.FunDsColors.colorPrimary,
          ),
        ),
      ],
    );

    final rightIcon2 = context.knobs.options<Widget?>(
      label: 'Right Icon 2',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        const Option(
          label: 'Loading',
          value: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
      ],
    );

    return CatalogPage(
      title: 'Text Area',
      description: _desc,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: funds.TextArea(
              labelText: labelText,
              descriptionText: descriptionText.isEmpty ? null : descriptionText,
              hintText: hintText,
              rightIcon1: rightIcon1,
              rightIcon2: rightIcon2,
              helperText: helperText.isEmpty ? null : helperText,
              textAreaSize: textAreaSize,
              isError: isError,
              enabled: enabled,
              maxLength: maxLength.isEmpty ? null : int.tryParse(maxLength),
              onSubmitted: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Submitted: $value'),
                  ),
                );
              },
              onChanged: (value) {
                debugPrintThrottled('Changed: $value');
              },
              onChangedDebounced: (value) {
                // Debounced version for onChanged
                debugPrint('Changed Debounced: $value');
              },
              debounceDuration: const Duration(milliseconds: 500),
            ),
          ),
        ],
      ),
    );
  }
}
