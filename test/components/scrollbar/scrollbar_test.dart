import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/scrollbar/scrollbar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

// flutter test --update-goldens test/components/scrollbar/scrollbar_test.dart
void main() {
  testWidgets(
    'Right Scrollbar Shown Correctly',
    (tester) async {
      final ScrollController _scrollController1 = ScrollController();
      await tester.pumpWidget(
        buildTestableWidget(
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  child: FunDsScrollbar(
                    scrollController: _scrollController1,
                    orientation: ScrollbarOrientation.right,
                    size: ScrollbarSize.small,
                    child: ListView.builder(
                      controller: _scrollController1,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FunDsScrollbar), findsOneWidget);
      expectLater(
        find.byType(FunDsScrollbar),
        matchesGoldenFile('golden/scrollbar_right.png'),
      );
    },
  );

  testWidgets(
    'Left Scrollbar Shown Correctly',
    (tester) async {
      final ScrollController _scrollController1 = ScrollController();
      await tester.pumpWidget(
        buildTestableWidget(
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  child: FunDsScrollbar(
                    scrollController: _scrollController1,
                    orientation: ScrollbarOrientation.left,
                    size: ScrollbarSize.medium,
                    child: ListView.builder(
                      controller: _scrollController1,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Item $index'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FunDsScrollbar), findsOneWidget);
      expectLater(
        find.byType(FunDsScrollbar),
        matchesGoldenFile('golden/scrollbar_left.png'),
      );
    },
  );

  testWidgets(
    'Top Scrollbar Shown Correctly',
    (tester) async {
      final ScrollController _scrollController1 = ScrollController();
      await tester.pumpWidget(
        buildTestableWidget(
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  child: FunDsScrollbar(
                    scrollController: _scrollController1,
                    orientation: ScrollbarOrientation.top,
                    size: ScrollbarSize.medium,
                    child: ListView.builder(
                      controller: _scrollController1,
                      scrollDirection: Axis.horizontal,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          color: Colors.blue,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FunDsScrollbar), findsOneWidget);
      expectLater(
        find.byType(FunDsScrollbar),
        matchesGoldenFile('golden/scrollbar_top.png'),
      );
    },
  );

  testWidgets(
    'Bottom Scrollbar Shown Correctly',
    (tester) async {
      final ScrollController _scrollController1 = ScrollController();
      await tester.pumpWidget(
        buildTestableWidget(
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  child: FunDsScrollbar(
                    scrollController: _scrollController1,
                    orientation: ScrollbarOrientation.bottom,
                    size: ScrollbarSize.small,
                    child: ListView.builder(
                      controller: _scrollController1,
                      scrollDirection: Axis.horizontal,
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          color: Colors.blue,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FunDsScrollbar), findsOneWidget);
      expectLater(
        find.byType(FunDsScrollbar),
        matchesGoldenFile('golden/scrollbar_bottom.png'),
      );
    },
  );
}
