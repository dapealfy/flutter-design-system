import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

main() {
  group('Test Switcher Functionals', () {
    testWidgets('Make sure FunDsSwitcher functional is working properly',
        (tester) async {
      const tabLength = 3;
      final tabController =
          TabController(length: tabLength, vsync: const TestVSync());

      await tester.pumpWidget(
        buildTestableWidget(
          child: Column(
            children: [
              FunDsSwitcher(
                key: const Key('switcher'),
                tabs: List.generate(tabLength, (index) {
                  return FunDsSwitcherTab(text: 'Tab $index');
                }),
                controller: tabController,
              ),
              SizedBox(
                height: 400,
                width: 400,
                child: TabBarView(
                  controller: tabController,
                  children: List.generate(tabLength, (index) {
                    return Text(
                      'text-$index',
                      key: Key('content-$index'),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      );

      // expect it to render properly
      expect(find.findSwitcher(), findsOne);
      expect(find.text('text-0'), findsOne);
      expect(find.text('text-1'), findsNothing);
      expect(find.findSwitcherTab(0), findsOne);
      expect(find.findSwitcherTab(1), findsOne);
      expect(find.findSwitcherTab(2), findsOne);
      expect(tabController.index == 0, isTrue);

      // expect functional working properly
      await tester.tap(find.findSwitcherTab(1));
      await tester.pumpAndSettle();
      expect(find.text('text-0'), findsNothing);
      expect(find.text('text-1'), findsOne);
      expect(tabController.index == 1, isTrue);
    });
  });

  group('Test Switcher exceptions', () {
    testWidgets('Make sure Switcher throw error when provided tabs more than 3',
        (tester) async {
      const tabLength = 4;
      final tabController =
          TabController(length: tabLength, vsync: const TestVSync());

      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsSwitcher(
            tabs: List.generate(tabLength, (index) {
              return FunDsSwitcherTab(text: 'Tab $index');
            }),
            controller: tabController,
          ),
        ),
      );

      expect(
        tester.takeException(),
        isA<FlutterError>().having(
          (error) => error.toString(),
          'error message',
          'The tabs of this component is not designed to handle more than 3 tabs',
        ),
      );
    });

    testWidgets(
        'Make sure Switcher throw error when no tabController was provided',
        (tester) async {
      await tester.pumpWidget(
        FunDsSwitcher(
          tabs: List.generate(3, (index) {
            return FunDsSwitcherTab(text: 'Tab $index');
          }),
        ),
      );

      expect(tester.takeException(), isA<FlutterError>());
    });
  });
}

extension on CommonFinders {
  Finder findSwitcher() => find.byKey(const Key('switcher'));

  Finder findSwitcherTab(int index) => find.byKey(Key('tab-$index'));
}
