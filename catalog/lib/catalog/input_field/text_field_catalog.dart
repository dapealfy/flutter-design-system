import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' hide TextField;
import 'package:flutter_design_system/funds.dart' as funds;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _desc = '''

Widget Name: TextField

Check the knobs for available options. They are located on the right side of the web interface, and under the gear icon on mobile
''';

class TextFieldCatalog extends StatelessWidget {
  const TextFieldCatalog({super.key});

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

    final prefixWidget = GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Prefix tapped'),
          ),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rp',
            style: FunDsTypography.body14,
          ),
          SizedBox(width: 4.w),
          FunDsIcon(
            funDsIconography: FunDsIconography.basicIcChevronDown,
            size: 16.spMin,
          )
        ],
      ),
    );
    final prefix = context.knobs.options<Widget?>(
      label: 'Prefix',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        Option(label: 'Custom', value: prefixWidget),
      ],
    );

    final suffix1 = context.knobs.options<Widget?>(
      label: 'Suffix 1',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        Option(
          label: 'Custom',
          value: Text(
            'Copy',
            style: FunDsTypography.body12B,
          ),
        ),
      ],
    );

    final suffix2Widget = GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Suffix tapped'),
          ),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ',00',
            style: FunDsTypography.body14,
          ),
          SizedBox(width: 4.w),
          FunDsIcon(
            funDsIconography: FunDsIconography.basicIcChevronDown,
            size: 16.spMin,
          )
        ],
      ),
    );

    final suffix2 = context.knobs.options<Widget?>(
      label: 'Suffix 2',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        Option(label: 'Custom', value: suffix2Widget),
      ],
    );

    final hintText = context.knobs.text(
      label: 'Hint Text',
      initial: 'Placeholder',
    );

    final helperText = context.knobs.text(
      label: 'Helper Text',
      initial: '',
    );

    final leftIcon = context.knobs.options<Widget?>(
      label: 'Left Icon',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        Option(
          label: 'Custom',
          value: FunDsIcon(
            funDsIconography: FunDsIconography.actionIcCloud,
            size: 16.spMin,
          ),
        ),
      ],
    );

    final rightIcon1 = context.knobs.options<Widget?>(
      label: 'Right Icon 1',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        Option(
          label: 'Custom',
          value: FunDsIcon(
            funDsIconography: FunDsIconography.actionIcEyeOpen,
            size: 16.spMin,
          ),
        ),
      ],
    );

    final rightIcon2 = context.knobs.options<Widget?>(
      label: 'Right Icon 2',
      initial: null,
      options: [
        const Option(label: 'null', value: null),
        Option(
          label: 'Custom',
          value: FunDsIcon(
            funDsIconography: FunDsIconography.actionIcFilter,
            size: 16.spMin,
          ),
        ),
      ],
    );

    final showClear = context.knobs.boolean(
      label: 'Show Clear',
      initial: true,
    );

    final isError = context.knobs.boolean(
      label: 'Is Error',
      initial: false,
    );

    final enabled = context.knobs.boolean(
      label: 'Enabled',
      initial: true,
    );

    final obscureText = context.knobs.boolean(
      label: 'Obscure Text',
      initial: false,
    );

    final maxLength = context.knobs.text(
      label: 'Max Length',
      initial: '',
    );

    return CatalogPage(
      title: 'Text Field',
      description: _desc,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: funds.TextField(
              labelText: labelText,
              descriptionText: descriptionText.isEmpty ? null : descriptionText,
              hintText: hintText,
              helperText: helperText.isEmpty ? null : helperText,
              prefix: prefix,
              leftIcon: leftIcon,
              suffix1: suffix1,
              suffix2: suffix2,
              rightIcon1: rightIcon1,
              rightIcon2: rightIcon2,
              showClear: showClear,
              isError: isError,
              enabled: enabled,
              obscureText: obscureText,
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
