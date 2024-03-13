import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system/funds.dart' as funds;

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'Slider continues value show correctly',
    (WidgetTester tester) async {
      double value = 0;
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsSlider.slider(
            value: value,
            onChanged: (newValue) {
              value = newValue;
            },
            min: 0,
            max: 1,
          ),
        ),
      );

      expect(value, equals(0.0));
      await tester.tap(find.findSlider());
      expect(value, equals(0.5));
      final Offset topLeft = tester.getTopLeft(find.findSlider());
      final Offset bottomRight = tester.getBottomRight(find.findSlider());
      final Offset target = topLeft + (bottomRight - topLeft) / 4.0;
      await tester.tapAt(target);
      expect(value, closeTo(0.25, 0.05));
    },
  );

  testWidgets(
    'Slider discrete value show correctly',
    (WidgetTester tester) async {
      double value = 0;
      await tester.pumpWidget(
        buildTestableWidget(
          child: SizedBox(
            width: 200,
            child: funds.FunDsSlider.slider(
              value: value,
              onChanged: (newValue) {
                value = newValue;
              },
              min: 0.0,
              max: 100.0,
              divisions: 10,
            ),
          ),
        ),
      );

      expect(value, equals(0.0));

      // Tap center
      await tester.tap(find.findSlider());
      expect(value, equals(50.0));

      await tester.drag(find.findSlider(), const Offset(5.0, 0.0));
      expect(value, equals(50.0));

      await tester.drag(find.findSlider(), const Offset(30, 0.0));
      expect(value, equals(70.0));
    },
  );

  testWidgets(
    'RangeSlider continues value show correctly',
    (WidgetTester tester) async {
      RangeValues values = const RangeValues(0.4, 0.7);
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsSlider.rangeSlider(
            value: values,
            onChanged: (newValue) {
              values = newValue;
            },
            min: 0,
            max: 1,
          ),
        ),
      );

      expect(values, equals(const RangeValues(0.4, 0.7)));

      final Offset topLeft = tester.getTopLeft(find.findRangeSlider());
      final Offset bottomRight = tester.getBottomRight(find.findRangeSlider());

      // Tap at 1/4 from the left
      final Offset leftTarget = topLeft + (bottomRight - topLeft) / 4;
      await tester.tapAt(leftTarget);
      await tester.pumpAndSettle();
      expect(values.start, closeTo(0.25, 0.05));

      // Tap at 1/4 from the right
      final Offset rightTarget = topLeft + (bottomRight - topLeft) * 3 / 4;
      await tester.tapAt(rightTarget);
      await tester.pumpAndSettle();
      expect(values.end, closeTo(0.75, 0.05));
    },
  );

  testWidgets(
    'RangeSlider discrete value show correctly',
    (WidgetTester tester) async {
      RangeValues values = const RangeValues(30, 70);
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsSlider.rangeSlider(
            value: values,
            onChanged: (newValue) {
              values = newValue;
            },
            min: 0.0,
            max: 100.0,
            divisions: 10,
          ),
        ),
      );

      expect(values, equals(const RangeValues(30, 70)));
      final Offset topLeft = tester.getTopLeft(find.findRangeSlider());
      final Offset bottomRight = tester.getBottomRight(find.findRangeSlider());

      final Offset leftTarget = topLeft + (bottomRight - topLeft) * 0.1;
      await tester.tapAt(leftTarget);
      await tester.pumpAndSettle();
      expect(values.start, equals(10));

      final Offset rightTarget = topLeft + (bottomRight - topLeft) * 0.9;
      await tester.tapAt(rightTarget);
      await tester.pumpAndSettle();
      expect(values.end, equals(90));
    },
  );
}

extension FunDsSliderFinder on CommonFinders {
  Finder findSlider() => find.byKey(const Key('sliderKey'));
  Finder findRangeSlider() => find.byKey(const Key('rangeSliderKey'));
}
