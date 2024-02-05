import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bottom Sheet Test', (WidgetTester tester) async {
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
    expect(find.text('Test BottomSheet'), findsNothing);

    FunDsBottomSheet.showBottomSheet(
      context: savedContext!,
      title: 'Test BottomSheet',
      desc: 'Test Description',
      image: '',
      type: FunDsBottomSheetType.common,
      groupButton: FunDsGroupButton(
        variant: FunDsGroupButtonVariant.horizontal,
        listButton: [
          FunDsButton(
            key: const Key('btn_bottom_sheet_tutup'),
            type: FunDsButtonType.medium,
            text: 'Tutup',
            variant: FunDsButtonVariant.secondary,
            onPressed: () {},
          ),
          FunDsButton(
            key: const Key('btn_bottom_sheet_lanjutkan'),
            type: FunDsButtonType.medium,
            text: 'Lanjutkan',
            variant: FunDsButtonVariant.primary,
            onPressed: () {},
          ),
        ],
      ),
    );

    await tester.pump(); // bottom sheet show animation starts
    await tester.pump(const Duration(seconds: 1)); // animation done
    expect(find.text('Test BottomSheet'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
    expect(find.text('Tutup'), findsOneWidget);
    expect(find.text('Lanjutkan'), findsOneWidget);
  });
}
