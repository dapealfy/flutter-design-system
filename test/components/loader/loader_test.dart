import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsLoader basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const FunDsLoader(
            key: Key('loader'),
            variant: FunDsLoaderVariant.spinner,
            width: 20,
            height: 20,
            position: FunDsLoaderPosition.top,
            desc: 'Test Loader',
          ),
        ),
      );
      expect(find.text('Test Loader'), findsOneWidget);
      expect(find.byKey(const Key('loader')), findsAny);
    },
  );
}
