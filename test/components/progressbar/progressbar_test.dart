import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../utils/test_utils.dart';

void main() {
  Widget getWidget(FunDsProgressBarSize size){
    return FunDsProgressBar(
      key: const Key('progressbar'),
      size: size,
      color: FunDsProgressBarColor.purple,
      value: 50,
    );
  }

  testWidgets(
    'FunDsProgressBar basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: getWidget(FunDsProgressBarSize.large) ,
        ),
      );
      expect(find.byKey(const Key('progressbar')), findsAny);
      matchesGoldenFile('golden/large.png');
    },
  );

  testWidgets(
    'FunDsProgressBar basic property show correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: getWidget(FunDsProgressBarSize.medium) ,
        ),
      );
      matchesGoldenFile('golden/medium.png');
    },
  );

  testWidgets(
    'FunDsProgressBar basic property show correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: getWidget(FunDsProgressBarSize.small) ,
        ),
      );
      matchesGoldenFile('golden/small.png');
    },
  );
}
