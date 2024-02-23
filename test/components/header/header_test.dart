import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'Header basic property show correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsHeader(
            key: const Key('header1'),
            useDarkBg: false,
            automaticallyImplyBack: true,
            onClickBack: (){},
            title: 'Title Here',
            link: 'Download',
            onClickLink: (){},
            rightIcon1: const FunDsIcon(
              funDsIconography: FunDsIconography.actionIcFilter,
              size: 24.0,
            ),
            onClickRightIcon1: (){},
            rightIcon2: const FunDsIcon(
              funDsIconography: FunDsIconography.actionIcScan,
              size: 24.0,
            ),
            onClickRightIcon2: (){},
          ),
        ),
      );
      expect(find.text('Title Here'), findsOneWidget);
      expect(find.text('Download'), findsOneWidget);
      expect(find.byKey(const Key('header1')), findsAny);
    },
  );
}