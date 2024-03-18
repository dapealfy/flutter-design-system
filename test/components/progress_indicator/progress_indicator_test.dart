import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../utils/test_utils.dart';

void main() {
  Widget getWidget(FunDsProgressIndicatorType type) {
    List<FunDsProgressIndicatorData> exampleContext = [
      FunDsProgressIndicatorData(
        label: 'Label 1',
        description: 'Label 1 Desc',
        state: FunDsProgressIndicatorState.complete,
      ),
      FunDsProgressIndicatorData(
        label: 'Label 2',
        description: 'Label 2 Desc',
        state: FunDsProgressIndicatorState.active,
      ),
      FunDsProgressIndicatorData(
        label: 'Label 3',
        description: 'Label 3 Desc',
        state: FunDsProgressIndicatorState.error,
      ),
      FunDsProgressIndicatorData(
        label: 'Label 4',
        description: 'Label 4 Desc',
        state: FunDsProgressIndicatorState.incomplete,
      ),
    ];
    return FunDsProgressIndicator(
      key: const Key('progressbar'),
      data: exampleContext,
      type: type,
    );
  }

  testWidgets(
    'FunDsProgressIndicator Horizontal basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: getWidget(FunDsProgressIndicatorType.horizontal),
        ),
      );
      expect(find.byKey(const Key('progressIndicatorHorizontal')), findsAny);
      expect(find.byKey(const Key('dot-0')), findsAny);
      expect(find.byKey(const Key('label-0')), findsAny);
      expect(find.byKey(const Key('separator-0')), findsAny);
    },
  );

  testWidgets(
    'FunDsProgressIndicator Vertical basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: getWidget(FunDsProgressIndicatorType.vertical),
        ),
      );
      expect(find.byKey(const Key('progressIndicatorVertical')), findsAny);
      expect(find.byKey(const Key('dot-0')), findsAny);
      expect(find.byKey(const Key('label-0')), findsAny);
      expect(find.byKey(const Key('separator-0')), findsAny);
      expect(find.byKey(const Key('description-0')), findsAny);
    },
  );
}
