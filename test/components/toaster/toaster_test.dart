import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets('Toaster Normal widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(buildTestableWidget(
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              FunDsToaster(
                context: context,
                message: 'Test Message',
                label: 'Test Label',
                type: FunDsToasterType.normal,
              ),
            );
          },
          child: const Text('Show Toaster'),
        );
      }),
    ));

    // Tap the 'Show Toaster' text.
    await tester.tap(find.text('Show Toaster'));
    await tester.pump();

    // Verify that the Toaster shows up with the correct message and label.
    expect(find.text('Test Message'), findsOneWidget);
    expect(find.text('Test Label'), findsOneWidget);

    // Find the SnackBar widget
    final snackBar = find.byType(SnackBar).evaluate().single.widget as SnackBar;

    // Verify that the SnackBar has the correct background color for a normal Toaster
    expect(snackBar.backgroundColor, FunDsColors.colorNeutral900);
  });

  testWidgets('Toaster Error  widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(buildTestableWidget(
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              FunDsToaster(
                context: context,
                message: 'Test Message',
                label: 'Test Label',
                type: FunDsToasterType.error,
              ),
            );
          },
          child: const Text('Show Toaster Error'),
        );
      }),
    ));

    // Tap the 'Show Toaster' text.
    await tester.tap(find.text('Show Toaster Error'));
    await tester.pump();

    // Verify that the Toaster shows up with the correct message and label.
    expect(find.text('Test Message'), findsOneWidget);
    expect(find.text('Test Label'), findsOneWidget);

    // Find the SnackBar widget
    final snackBar = find.byType(SnackBar).evaluate().single.widget as SnackBar;

    // Verify that the SnackBar has the correct background color for a normal Toaster
    expect(snackBar.backgroundColor, FunDsColors.colorRed500);
  });
}
