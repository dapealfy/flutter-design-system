import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';
import 'package:flutter_design_system/funds.dart' as funds;

void main() {
  testWidgets(
    'Empty select show correctly',
    (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: Builder(builder: (context) {
            return funds.FunDsSelect.bottomSheet(
              context: context,
              labelText: 'Test Label',
              descriptionText: 'Test Description',
              hintText: 'Test Hint',
              helperText: 'Test Helper',
              selected: const [],
              sheetConfig: funds.SelectionSheetConfig<String>(
                getItems: (controller) async => [],
                headerBuilder: (context, controller) => const SizedBox(),
                footerBuilder: (context, controller) => const SizedBox(),
                itemBuilder: (context, item, selected, controller) =>
                    const SizedBox(),
              ),
            );
          }),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Test Hint'), findsOneWidget);
      expect(find.text('Test Helper'), findsOneWidget);
    },
  );

  testWidgets('Select one item show correctly', (tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        child: Builder(builder: (context) {
          return funds.FunDsSelect.bottomSheet(
            context: context,
            selected: const ['Item 1'],
            sheetConfig: funds.SelectionSheetConfig<String>(
              getItems: (controller) async => ['Item 1', 'Item 2', 'Item 3'],
              headerBuilder: (context, controller) => const SizedBox(),
              footerBuilder: (context, controller) => const SizedBox(),
              itemBuilder: (context, item, selected, controller) =>
                  const SizedBox(),
            ),
          );
        }),
      ),
    );

    expect(find.text('Item 1'), findsOneWidget);
  });

  testWidgets('Select multiple items show correctly', (tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        child: Builder(builder: (context) {
          return funds.FunDsSelect.bottomSheet(
            context: context,
            selected: const ['Item 1', 'Item 2'],
            sheetConfig: funds.SelectionSheetConfig<String>(
              getItems: (controller) async => ['Item 1', 'Item 2', 'Item 3'],
              headerBuilder: (context, controller) => const SizedBox(),
              footerBuilder: (context, controller) => const SizedBox(),
              itemBuilder: (context, item, selected, controller) =>
                  const SizedBox(),
            ),
          );
        }),
      ),
    );

    expect(find.text('2 terpilih'), findsOneWidget);
  });

  testWidgets('Bottom sheet shown correctly', (tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        child: Builder(builder: (context) {
          return funds.FunDsSelect<String>.bottomSheet(
            context: context,
            selected: const ['Item 1'],
            sheetConfig: funds.SelectionSheetConfig<String>(
              getItems: (controller) async => ['Item 1', 'Item 2', 'Item 3'],
              headerBuilder: (context, controller) => const Text('header'),
              footerBuilder: (context, controller) => const Text('footer'),
              itemBuilder: (context, item, selected, controller) =>
                  GestureDetector(
                onTap: () {
                  if (selected) {
                    controller.deselect(item);
                  } else {
                    controller.select(item);
                  }
                },
                child: Text(
                  item + (selected ? ' selected' : ''),
                ),
              ),
            ),
          );
        }),
      ),
    );

    await tester.tap(find.byType(funds.FunDsSelect<String>));
    await tester.pumpAndSettle();

    expect(find.text('header'), findsOneWidget);
    expect(find.text('footer'), findsOneWidget);

    expect(find.text('Item 1 selected'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Item 3'), findsOneWidget);

    // Select item 2
    await tester.tap(find.text('Item 2'));
    await tester.pumpAndSettle();
    expect(find.text('Item 2 selected'), findsOneWidget);

    // De-select item 2
    await tester.tap(find.text('Item 2 selected'));
    await tester.pumpAndSettle();
    expect(find.text('Item 2'), findsOneWidget);
  });
}
