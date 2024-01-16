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
            defaultValue: true,
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
}
