import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsProgressCircle basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const funds.FunDsProgressCircle(
            label: 'Test Label',
            progress: 20,
            size: funds.FunDsProgressCircleSize.medium,
            variant: funds.FunDsProgressCircleVariant.circle,
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('20%'), findsOneWidget);

      expect(find.findFunDsProgressCircle(), findsOneWidget);
      expect(find.findLabel(), findsOneWidget);
      expect(find.findPercentage(), findsOneWidget);
    },
  );
}

extension FunDsTextFieldFinder on CommonFinders {
  Finder findFunDsProgressCircle() => find.byType(DashedCircularProgressBar);
  Finder findLabel() => find.byKey(const Key('label'));
  Finder findPercentage() => find.byKey(const Key('percentage'));
}
