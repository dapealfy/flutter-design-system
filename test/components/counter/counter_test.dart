import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system/funds.dart' as funds;

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'Counter Increase Function Correctly',
    (WidgetTester tester) async {
      int value = 0;
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.Counter(
            label: 'Example Counter',
            onChanged: (newValue) {
              value = newValue;
            },
            initialValue: 10,
            min: 10,
            max: 11,
          ),
        ),
      );

      expect(value, equals(0));
      await tester.tap(find.findCounterAddButton());
      expect(value, equals(11));
    },
  );
  testWidgets(
    'Counter Decrease Function Correctly',
    (WidgetTester tester) async {
      int value = 0;
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.Counter(
            label: 'Example Counter',
            onChanged: (newValue) {
              value = newValue;
            },
            initialValue: 10,
            min: 8,
            max: 11,
          ),
        ),
      );

      expect(value, equals(0));
      await tester.tap(find.findCounterMinusButton());
      expect(value, equals(9));
    },
  );
  testWidgets(
    'Counter Show Correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.Counter(
            label: 'Example Counter',
            onChanged: (newValue) {},
            initialValue: 10,
            min: 8,
            max: 11,
          ),
        ),
      );

      expect(find.text('Example Counter'), findsOneWidget);
      expect(find.findCounterAddButton(), findsOneWidget);
      expect(find.findCounterMinusButton(), findsOneWidget);
      expect(find.findCounterTextField(), findsOneWidget);
    },
  );
}

extension FunDsCounterFinder on CommonFinders {
  Finder findCounterLabel() => find.byKey(
        const Key('counterLabel'),
      );
  Finder findCounterTextField() => find.byKey(
        const Key('counterTextField'),
      );
  Finder findCounterMinusButton() => find.byKey(
        const Key('counterMinusButton'),
      );
  Finder findCounterAddButton() => find.byKey(
        const Key('counterAddButton'),
      );
}
