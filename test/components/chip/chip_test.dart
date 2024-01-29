import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsChip basic property show correctly',
        (WidgetTester tester) async {
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
            onPress: (isActive){},
          ),
        ),
      );
      expect(find.text('Chips Label'), findsOneWidget);
      expect(find.byKey(const Key('chip1')), findsAny);
    },
  );
}