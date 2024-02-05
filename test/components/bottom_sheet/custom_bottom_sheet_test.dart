import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Custom Bottom Sheet Test', (WidgetTester tester) async {
    BuildContext? savedContext;
    await tester.pumpWidget(MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(360, 690),
          child: Builder(
              builder: (BuildContext context) {
                savedContext = context;
                return Container();
              }
          ),
        )
    ));
    await tester.pump();
    expect(find.text('ini custom bottom sheet'), findsNothing);

    FunDsCustomBottomSheet.showBottomSheet(
      context: savedContext!,
      child: const Text('ini custom bottom sheet'),
    );


    await tester.pump(); // bottom sheet show animation starts
    await tester.pump(const Duration(seconds: 1)); // animation done
    expect(find.text('ini custom bottom sheet'), findsOneWidget);
  });
}
