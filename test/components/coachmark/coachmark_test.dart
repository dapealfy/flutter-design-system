import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  group(
    'Given 1 target coachmark',
    () {
      late FunDsOverlayController controller;

      setUp(() {
        controller = FunDsOverlayController();
      });

      testWidgets(
        'When start coachmark should show coachmark',
        (tester) async {
          await _buildOneCoachmark(tester, controller);

          // start the coachmark
          controller.show();
          await tester.pumpAndSettle();

          expect(find.text('title'), findsOneWidget);
          expect(find.text('description'), findsOneWidget);
          expect(find.text('overflow'), findsOneWidget);
          expect(find.text('primaryButtonText'), findsOneWidget);
          expect(find.text('secondaryButtonText'), findsOneWidget);
        },
      );

      testWidgets(
        'When tap on anywhere should not finish coachmark',
        (tester) async {
          await _buildOneCoachmark(tester, controller);

          // start the coachmark
          controller.show();
          await tester.pumpAndSettle();

          // coachmark is showing
          expect(find.text('title'), findsOneWidget);

          await tester.tapAt(const Offset(0, 0));
          await tester.pumpAndSettle();

          // coachmark is now hidden
          expect(find.text('title'), findsOneWidget);
        },
      );

      testWidgets(
        'When tap on primary button should finish coachmark',
        (tester) async {
          await _buildOneCoachmark(tester, controller);

          // start the coachmark
          controller.show();
          await tester.pumpAndSettle();

          // coachmark is showing
          expect(find.text('title'), findsOneWidget);

          await tester.tap(find.byKey(const Key('btn-primary')));
          await tester.pumpAndSettle();

          // coachmark is now hidden
          expect(find.text('title'), findsNothing);
        },
      );

      testWidgets(
        'When tap on secondary button should finish coachmark',
        (tester) async {
          await _buildOneCoachmark(tester, controller);

          // start the coachmark
          controller.show();
          await tester.pumpAndSettle();

          // coachmark is showing
          expect(find.text('title'), findsOneWidget);

          await tester.tap(find.byKey(const Key('btn-secondary')));
          await tester.pumpAndSettle();

          // coachmark is now hidden
          expect(find.text('title'), findsNothing);
        },
      );
    },
  );
}

/// * Column
///   * Text
///   * Coachmark
///     * Text
///   * Text
Future<void> _buildOneCoachmark(
  WidgetTester tester,
  FunDsOverlayController controller,
) async {
  await tester.pumpWidget(
    buildTestableWidget(
      child: Builder(builder: (context) {
        return Column(
          children: [
            const Text('text 1'),
            FunDsCoachMark.overlayTarget(
              context,
              controller: controller,
              title: 'title',
              description: 'description',
              overflow: 'overflow',
              primaryButtonText: 'primaryButtonText',
              onClickPrimary: () {
                controller.hide();
              },
              secondaryButtonText: 'secondaryButtonText',
              onClickSecondary: () {
                controller.hide();
              },
              child: const Text('text 2'),
            ),
            const Text('text 3'),
          ],
        );
      }),
    ),
  );
}
