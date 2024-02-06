import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsCheckbox basic property show correctly',
    (WidgetTester tester) async {
      bool selectedValue = true;
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsCheckbox(
            key: const Key('cb_primary'),
            variant: FunDsCheckboxVariant.primary,
            title: 'Test Title',
            subtitle: 'Test Subtitle',
            defaultValue: selectedValue,
            onChanged: (value) {
              selectedValue = value!;
            },
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);

      await tester.tap(find.text('Test Title'));
      expect(selectedValue, false);
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'FunDsCheckbox tristate property show correctly',
        (WidgetTester tester) async {
      bool? selectedValue = true;
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsCheckbox(
            key: const Key('cb_tristate_primary'),
            variant: FunDsCheckboxVariant.primary,
            title: 'Test Tristate Title',
            subtitle: 'Test Tristate Subtitle',
            defaultValue: selectedValue,
            tristate: true,
            onChanged: (value) {
              selectedValue = value;
            },
          ),
        ),
      );

      expect(find.text('Test Tristate Title'), findsOneWidget);
      expect(find.text('Test Tristate Subtitle'), findsOneWidget);
      await tester.tap(find.text('Test Tristate Title'));
      await tester.pump(const Duration(seconds: 1));
      expect(selectedValue, null);
    },
  );
}
