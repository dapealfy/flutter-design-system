import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/radio_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsRadioButton basic property show correctly',
    (WidgetTester tester) async {
      int? selectedValue;
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsRadioButton<int?>(
            key: const Key('Radio Button'),
            label: 'Test Label',
            helper: 'Test Helper',
            value: 1,
            selectedValue: selectedValue,
            onChanged: (value) {
              selectedValue = value;
            },
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Helper'), findsOneWidget);

      await tester.tap(find.byKey(const Key('Radio Button')));
      expect(selectedValue, 1);
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'FunDsRadioButton is disabled, so user cannot changes the selected value',
    (WidgetTester tester) async {
      int? selectedValue = 0;
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsRadioButton<int?>(
            key: const Key('Radio Button Disabled'),
            label: 'Test Label',
            helper: 'Test Helper',
            value: 1,
            disabled: true,
            selectedValue: selectedValue,
            onChanged: (value) {
              selectedValue = value;
            },
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Helper'), findsOneWidget);

      await tester.tap(find.byKey(const Key('Radio Button Disabled')));
      expect(selectedValue, 0);
      await tester.pumpAndSettle();
    },
  );
}

extension FunDsRadioButtonFinder on CommonFinders {
  Finder findFunDsRadioButton() => find.byType(FunDsRadioButton);
  Finder findFunDsRadioButtonLabel() => find.byKey(const Key('label'));
  Finder findFunDsRadioButtonHelper() => find.byKey(const Key('helper'));
}
