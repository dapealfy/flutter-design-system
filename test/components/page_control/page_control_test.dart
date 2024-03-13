import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

/// This test using golden test.
/// It compare the rendered widget with an image.
///
/// https://medium.com/flutter-community/flutter-golden-tests-compare-widgets-with-snapshots-27f83f266cea
///
/// Generate golden file (All Test)
///
/// ```
/// flutter test --update-goldens
/// ```
/// or this test only
/// ```
/// flutter test --update-goldens test/components/page_control/page_control_test.dart
/// ```
void main() {
  group('AnimatedPageControl with slide effect', () {
    Widget buildTestWidget(int activeIndex) {
      return Center(
        child: FunDsAnimatedPageControl(
          activeIndex: activeIndex,
          effect: const SlideEffect(
            activeDotColor: Colors.red,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 10,
          ),
          count: 10,
        ),
      );
    }

    testWidgets(
      '0 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(0));

        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/slide_0.png'),
        );
      },
    );

    testWidgets(
      '5 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(5));
        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/slide_5.png'),
        );
      },
    );

    testWidgets(
      '9 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(9));
        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/slide_9.png'),
        );
      },
    );
  });

  group('AnimatedPageControl with scrolling dots effect', () {
    Widget buildTestWidget(int activeIndex) {
      return Center(
        child: FunDsAnimatedPageControl(
          activeIndex: activeIndex,
          effect: const ScrollingDotsEffect(
            activeDotColor: Colors.red,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            maxVisibleDots: 5,
            spacing: 10,
          ),
          count: 10,
        ),
      );
    }

    testWidgets(
      '0 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(0));

        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/scrolling_dot_0.png'),
        );
      },
    );

    testWidgets(
      '5 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(5));
        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/scrolling_dot_5.png'),
        );
      },
    );

    testWidgets(
      '9 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(9));
        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/scrolling_dot_9.png'),
        );
      },
    );
  });

  group('AnimatedPageControl with filled effect', () {
    Widget buildTestWidget(int activeIndex) {
      return Center(
        child: FunDsAnimatedPageControl(
          activeIndex: activeIndex,
          effect: const FilledEffect(
            activeDotColor: Colors.red,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 40,
            spacing: 5,
          ),
          count: 10,
        ),
      );
    }

    testWidgets(
      '0 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          buildTestWidget(0),
        );

        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/filled_0.png'),
        );
      },
    );

    testWidgets(
      '5 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(5));
        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/filled_5.png'),
        );
      },
    );

    testWidgets(
      '9 index',
      (WidgetTester tester) async {
        await tester.pumpWidget(buildTestWidget(9));
        await expectLater(
          find.byType(FunDsAnimatedPageControl),
          matchesGoldenFile('golden/filled_9.png'),
        );
      },
    );
  });

  testWidgets('AttachedPageControl follow page position', (tester) async {
    final PageController controller = PageController();

    await tester.pumpWidget(
      buildTestableWidget(
        child: Center(
          child: Column(
            key: const Key('test'),
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (context, index) => Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                  itemCount: 10,
                ),
              ),
              FunDsAttachedPageControl(
                controller: controller,
                effect: const SlideEffect(
                  activeDotColor: Colors.red,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 10,
                ),
                count: 10,
              ),
            ],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    controller.jumpToPage(5);
    await tester.pumpAndSettle();

    await expectLater(
      find.byKey(const Key('test')),
      matchesGoldenFile('golden/attached_slide.png'),
    );
  });
}
