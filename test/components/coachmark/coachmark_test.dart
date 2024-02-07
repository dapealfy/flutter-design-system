import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  group(
    'Given 1 target coachmark',
    () {
      late GlobalKey singleOverlayKey;

      setUp(() {
        singleOverlayKey = GlobalKey(debugLabel: 'overlay_key');
      });

      testWidgets(
        'When start coachmark should show coachmark',
        (tester) async {
          await _buildOneCoachmark(tester, singleOverlayKey);

          // start the coachmark
          CoachMark.start(singleOverlayKey.currentContext!, [singleOverlayKey]);
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
          await _buildOneCoachmark(tester, singleOverlayKey);

          // start the coachmark
          CoachMark.start(singleOverlayKey.currentContext!, [singleOverlayKey]);
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
          await _buildOneCoachmark(tester, singleOverlayKey);

          // start the coachmark
          CoachMark.start(singleOverlayKey.currentContext!, [singleOverlayKey]);
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
          await _buildOneCoachmark(tester, singleOverlayKey);

          // start the coachmark
          CoachMark.start(singleOverlayKey.currentContext!, [singleOverlayKey]);
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

  group(
    'Given 3 target coachmarks',
    () {
      late GlobalKey one;
      late GlobalKey two;
      late GlobalKey three;

      setUp(() {
        one = GlobalKey(debugLabel: 'key_one');
        two = GlobalKey(debugLabel: 'key_two');
        three = GlobalKey(debugLabel: 'key_three');
      });

      testWidgets(
        'When tap on primary button should move to next coachmark',
        (tester) async {
          await _buildThreeCoachmark(tester, one, two, three);

          CoachMark.start(one.currentContext!, [one, two, three]);
          await tester.pumpAndSettle();

          // coachmark 1 is showing
          expect(find.text('title 1'), findsOneWidget);

          await tester.tap(find.byKey(const Key('btn-primary')));
          await tester.pumpAndSettle();

          // coachmark 2 is showing
          expect(find.text('title 2'), findsOneWidget);

          await tester.tap(find.byKey(const Key('btn-primary')));
          await tester.pumpAndSettle();

          // coachmark 3 is showing
          expect(find.text('title 3'), findsOneWidget);

          await tester.tap(find.byKey(const Key('btn-primary')));
          await tester.pumpAndSettle();

          // no coachmark showing
          expect(find.textContaining('title'), findsNothing);
        },
      );

      testWidgets(
        'When tap on secondary button should finish all coachmarks',
        (tester) async {
          await _buildThreeCoachmark(tester, one, two, three);

          CoachMark.start(one.currentContext!, [one, two, three]);
          await tester.pumpAndSettle();

          // coachmark 1 is showing
          expect(find.text('title 1'), findsOneWidget);

          await tester.tap(find.byKey(const Key('btn-secondary')));
          await tester.pumpAndSettle();

          // no coachmark showing
          expect(find.textContaining('title'), findsNothing);
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
  GlobalKey<State<StatefulWidget>> overlayKey,
) async {
  await tester.pumpWidget(
    buildTestableWidget(
      child: CoachMark.overlayBuilder(
        builder: (context) => Column(
          children: [
            const Text('text 1'),
            CoachMark.overlayTarget(
              context: context,
              key: overlayKey,
              overlayEntry: CoachMark(
                title: 'title',
                description: 'description',
                overflow: 'overflow',
                primaryButtonText: 'primaryButtonText',
                onPressedPrimary: () {
                  CoachMark.next(context);
                },
                secondaryButtonText: 'secondaryButtonText',
                onPressedSecondary: () {
                  CoachMark.dismiss(context);
                },
              ),
              child: const Text('text 2'),
            ),
            const Text('text 3'),
          ],
        ),
      ),
    ),
  );
}

/// * Column
///   * Coachmark
///     * Text
///   * Coachmark
///     * Text
///   * Coachmark
///     * Text
Future<void> _buildThreeCoachmark(
  WidgetTester tester,
  GlobalKey<State<StatefulWidget>> one,
  GlobalKey<State<StatefulWidget>> two,
  GlobalKey<State<StatefulWidget>> three,
) async {
  await tester.pumpWidget(
    buildTestableWidget(
      child: CoachMark.overlayBuilder(
        builder: (context) => Column(
          children: [
            CoachMark.overlayTarget(
              context: context,
              key: one,
              overlayEntry: CoachMark(
                title: 'title 1',
                description: 'description',
                overflow: 'overflow',
                primaryButtonText: 'primaryButtonText',
                onPressedPrimary: () {
                  CoachMark.next(context);
                },
                secondaryButtonText: 'secondaryButtonText',
                onPressedSecondary: () {
                  CoachMark.dismiss(context);
                },
              ),
              child: const Text('text 1'),
            ),
            CoachMark.overlayTarget(
              context: context,
              key: two,
              overlayEntry: CoachMark(
                title: 'title 2',
                description: 'description',
                overflow: 'overflow',
                primaryButtonText: 'primaryButtonText',
                onPressedPrimary: () {
                  CoachMark.next(context);
                },
                secondaryButtonText: 'secondaryButtonText',
                onPressedSecondary: () {
                  CoachMark.dismiss(context);
                },
              ),
              child: const Text('text 2'),
            ),
            CoachMark.overlayTarget(
              context: context,
              key: three,
              overlayEntry: CoachMark(
                title: 'title 3',
                description: 'description',
                overflow: 'overflow',
                primaryButtonText: 'primaryButtonText',
                onPressedPrimary: () {
                  CoachMark.next(context);
                },
                secondaryButtonText: 'secondaryButtonText',
                onPressedSecondary: () {
                  CoachMark.dismiss(context);
                },
              ),
              child: const Text('text 3'),
            ),
          ],
        ),
      ),
    ),
  );
}
