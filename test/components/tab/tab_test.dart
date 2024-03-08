import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

main() {
  group('functional test cases', () {
    testWidgets('Make sure FunDsTabBar functional works properly',
        (tester) async {
      TabController controller =
          TabController(length: 3, vsync: const TestVSync());
      var index = controller.index;

      await tester.pumpWidget(buildTestableWidget(
          child: Column(
        children: [
          FunDsTabBar(
            controller: controller,
            key: const Key('FunDsTabBar'),
            tabs: List.generate(
                3,
                (index) => FunDsTab(
                      key: Key('FundsTab_$index'),
                      text: 'content_$index',
                    )),
            onTap: (newIndex) {
              index = newIndex;
            },
          )
        ],
      )));

      expect(controller.index, 0);
      expect(find.findTabBar(), findsOneWidget);
      for (var i = 0; i > 3; i++) {
        expect(find.findTab(i), findsOneWidget);
        expect(find.text('content_$i'), findsOne);
      }

      await tester.tap(find.findTab(1));
      expect(controller.index, 1);
      expect(index == controller.index, isTrue);
    });

    testWidgets('Make sure FunDsTab functional works properly', (tester) async {
      await tester.pumpWidget(buildTestableWidget(
          child: Column(
              children: List.generate(
                  3,
                  (index) => FunDsTab(
                        key: Key('FundsTab_$index'),
                        text: 'content_$index',
                      )))));

      expect(find.findTabIcon(), findsNothing);
      for (var i = 0; i > 3; i++) {
        expect(find.findTab(i), findsOneWidget);
        expect(find.text('content_$i'), findsOne);
      }
    });

    testWidgets('Make sure icon is showing when icon is provided',
        (tester) async {
      await tester.pumpWidget(buildTestableWidget(
          child: Column(
              children: List.generate(
                  3,
                  (index) => FunDsTab(
                        key: Key('FundsTab_$index'),
                        icon: FunDsIconography.actionIcSetting,
                      )))));

      expect(find.findTabIcon(), findsExactly(3));
      expect(find.text('content'), findsNothing);
    });

    testWidgets('Make sure badgeNumber is showing when badge is provided',
        (tester) async {
      await tester.pumpWidget(buildTestableWidget(
          child: Column(
              children: List.generate(
                  3,
                  (index) => FunDsTab(
                        key: Key('FundsTab_$index'),
                        icon: FunDsIconography.actionIcSetting,
                        badgeNumber: 3,
                      )))));

      expect(find.findTabIcon(), findsExactly(3));
      expect(find.text('content'), findsNothing);
      expect(find.findTabBadgeNumber(), findsExactly(3));
      expect(find.text('3'), findsExactly(3));
    });
  });

  group('limitation test cases', () {
    testWidgets(
        'Make sure FunDsTabBar throws an error when no controller is provided',
        (tester) async {
      await tester.pumpWidget(buildTestableWidget(
        child: FunDsTabBar(
          key: const Key('FunDsTabBar'),
          tabs: List.generate(
            3,
            (index) => FunDsTab(
              key: Key('FundsTab_$index'),
              text: 'content_$index',
            ),
          ),
        ),
      ));

      expect(tester.takeException(), isA<FlutterError>());
    });

    testWidgets(
        'Make sure FunDsTab throws an error when no not icon or text is provided.',
        (tester) async {
      expect(() => FunDsTab(), throwsAssertionError);
    });
  });
}

extension on CommonFinders {
  Finder findTabBar() => find.byKey(const Key('FunDsTabBar'));

  Finder findTab(int index) => find.byKey(Key('FundsTab_$index'));

  Finder findTabIcon() => find.byKey(const Key('funDsTabIcon'));

  Finder findTabBadgeNumber() => find.byKey(const Key('funDsTabBadgeNumber'));
}
