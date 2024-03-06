import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../utils/test_utils.dart';

void main() {
  var screenUtilWidget = MaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: Builder(
            builder: (BuildContext context) {
              return Container();
            }
        ),
      )
  );

  testWidgets(
    'Divider default basic property shows correctly, ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const FunDsDivider(
            key: Key('FunDsDividerDefault'),
          ),
        ),
      );

      expect(find.byKey(const Key('FunDsDividerDefault')), findsWidgets);
      matchesGoldenFile('golden/default.png');
    },
  );

  testWidgets(
    'Divider thickLine basic property shows correctly, ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsDivider.thickLine(
            key: const Key('FunDsDividerThickLine'),
          ),
        ),
      );

      expect(find.byKey(const Key('FunDsDividerThickLine')), findsWidgets);
      matchesGoldenFile('golden/thick_line.png');
    },
  );

  testWidgets(
    'Divider thickLine basic property shows correctly, ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsDivider.textAndLine(
            key: const Key('FunDsDividerTextAndLine'),
            text: 'Atau',
          ),
        ),
      );

      expect(find.byKey(const Key('FunDsDividerTextAndLine')), findsWidgets);
      expect(find.text('Atau'), findsOneWidget);
      matchesGoldenFile('golden/text_and_line.png');
    },
  );

  testWidgets(
    'Divider Solid Text basic property shows correctly, ',
    (WidgetTester tester) async {
      await tester.pumpWidget(screenUtilWidget);

      await tester.pumpWidget(FunDsDivider.solidText(
        key: const Key('FunDsDividerSolidText'),
        text: 'Atau',
      ));

      expect(find.byKey(const Key('FunDsDividerSolidText')), findsWidgets);
      expect(find.text('Atau'), findsOneWidget);
      matchesGoldenFile('golden/solid_text.png');
    },
  );

  testWidgets(
    'Divider Line With Label basic property shows correctly, ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsDivider.lineWithLabel(
            key: const Key('FunDsDividerLineWithLabel'),
            text: 'Atau',
          ),
        ),
      );

      expect(find.byKey(const Key('FunDsDividerLineWithLabel')), findsWidgets);
      expect(find.text('Atau'), findsOneWidget);
      matchesGoldenFile('golden/line_with_label.png');
    },
  );
}
