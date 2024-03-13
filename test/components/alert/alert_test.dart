import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

main() {
  group('Given present state,', () {
    testWidgets('Alert with single action works properly',
        (widgetTester) async {
      await _buildTestableWidget(widgetTester, isSingle: true);
      expect(find.byKey(const Key('btn-cross-close')), findsOne);
      expect(find.byKey(const Key('btn-primary')), findsOne);
      expect(find.byKey(const Key('btn-secondary')), findsNothing);
    });

    testWidgets('Alert with multi action works properly', (widgetTester) async {
      await _buildTestableWidget(widgetTester, isSingle: false);
      expect(find.byKey(const Key('btn-cross-close')), findsOne);
      expect(find.byKey(const Key('btn-primary')), findsOne);
      expect(find.byKey(const Key('btn-secondary')), findsOne);
    });
  });

  testWidgets('Test clickables', (tester) async {
    var isCloseClicked = false;
    var isPrimaryClicked = false;
    var isSecondaryClicked = false;

    await tester.pumpWidget(buildTestableWidget(
        child: FunDsAlert(
      key: const Key('test-alert'),
      type: FunDsAlertType.danger,
      title: 'Main',
      description: 'description',
      primaryActionText: 'Main',
      secondaryActionText: 'Secondary',
      onCloseTap: () {
        isCloseClicked = true;
      },
      onPrimaryActionTap: () {
        isPrimaryClicked = true;
      },
      onSecondaryActionTap: () {
        isSecondaryClicked = true;
      },
    )));

    expect([isCloseClicked, isPrimaryClicked, isSecondaryClicked],
        [false, false, false]);
    await tester.tap(find.byKey(const Key('btn-primary')));
    expect(isPrimaryClicked, isTrue);

    await tester.tap(find.byKey(const Key('btn-secondary')));
    expect(isSecondaryClicked, isTrue);

    await tester.tap(find.byKey(const Key('btn-cross-close')));
    expect(isCloseClicked, isTrue);
  });
}

Future<void> _buildTestableWidget(
  WidgetTester tester, {
  required bool isSingle,
}) {
  return tester.pumpWidget(
    buildTestableWidget(
      child: FunDsAlert(
        key: const Key('test-alert'),
        type: FunDsAlertType.danger,
        title: 'Main',
        description: 'description',
        primaryActionText: 'Main',
        secondaryActionText: isSingle ? null : 'Secondary',
        onCloseTap: () {},
      ),
    ),
  );
}
