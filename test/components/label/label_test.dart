import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'Label basic property shows correctly, '
    'Label onTap functionality called correctly',
    (WidgetTester tester) async {
      String value = '';

      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsLabel(
            'Label Text',
            key: const Key('label'),
            prefixIcon: FunDsIconography.actionIcCrossNude,
            suffixIcon: FunDsIconography.actionIcCrossNude,
            size: FunDsLabelSize.large,
            color: FunDsLabelColor.purple,
            type: FunDsLabelType.invert,
            onTap: () {
              value = 'clicked';
            },
          ),
        ),
      );
      expect(find.text('Label Text'), findsOneWidget);
      expect(find.byKey(const Key('label')), findsAny);
      expect(value.isEmpty, true);
      await tester.tap(find.byKey(const Key('label')));
      expect(value, equals('clicked'));
    },
  );
}
