import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets('Tips shown correctly', (tester) async {
    final controller = FunOverlayController();
    await tester.pumpWidget(
      buildTestableWidget(
        child: Builder(
          builder: (BuildContext context) {
            return Tips.overlayTarget(
              context,
              controller: controller,
              title: 'Title',
              description: 'Description',
              child: const Text('Target'),
            );
          },
        ),
      ),
    );

    // Initial condition
    expect(find.text('Title'), findsNothing);

    // Show tips
    controller.show();
    await tester.pumpAndSettle();

    // Tips shown
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);

    // Close
    await tester.tap(find.byKey(const Key('tipsClose')));
    await tester.pumpAndSettle();
    expect(find.text('Title'), findsNothing);
  });
}
