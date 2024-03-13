import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsChip basic property show correctly',
    (WidgetTester tester) async {
      var isActive = false;
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsChip(
            key: const Key('chip1'),
            text: 'Chips Label',
            type: FunDsChipType.large,
            enable: true,
            leading: const FunDsIcon(
              funDsIconography: FunDsIconography.basicIcSortFilter,
              size: 20,
            ),
            trailing: const FunDsIcon(
              funDsIconography: FunDsIconography.basicIcChevronDown,
              size: 20,
            ),
            label: const FunDsLabel(
              'Label',
              type: FunDsLabelType.outline,
              color: FunDsLabelColor.red,
            ),
            onPress: () {
              isActive = !isActive;
            },
          ),
        ),
      );
      expect(find.text('Chips Label'), findsOneWidget);
      expect(find.text('Label'), findsOneWidget);
      expect(find.byKey(const Key('chip1')), findsAny);
      await tester.tap(find.text('Chips Label'));
      expect(isActive, true);
    },
  );
}
