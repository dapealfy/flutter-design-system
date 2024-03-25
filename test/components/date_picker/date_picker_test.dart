import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../utils/test_utils.dart';

// flutter test --update-goldens test/components/date_picker/date_picker_test.dart
void main() async {
  await initializeDateFormatting();

  group('Date Picker single select', () {
    testWidgets('show empty field', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsDatePicker.single(
            labelText: 'Date Picker',
            hintText: 'Select a date',
            descriptionText: 'Description',
            helperText: 'Helper text',
            size: FunDsFieldSize.small,
          ),
        ),
      );

      expect(find.byType(FunDsDatePicker), findsOneWidget);
      expect(find.text('Date Picker'), findsOneWidget);
      expect(find.text('Select a date'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Helper text'), findsOneWidget);
    });

    testWidgets('show filled field and sheet', (tester) async {
      testOnPixel7ProScreen(tester);

      DateTime? selectedDate;
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsDatePicker.single(
            key: const Key('date_picker'),
            labelText: 'Date Picker',
            hintText: 'Select a date',
            descriptionText: 'Description',
            helperText: 'Helper text',
            size: FunDsFieldSize.small,
            selectedDate: DateTime(2020, 1, 1),
            onChanged: (date) {
              selectedDate = date;
            },
          ),
        ),
      );

      // Verify filled field
      expect(find.byType(FunDsDatePicker), findsOneWidget);
      expect(find.text('Date Picker'), findsOneWidget);
      expect(find.text('Select a date'), findsNothing);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Helper text'), findsOneWidget);
      expect(find.text('01-01-2020'), findsOneWidget);

      // Tap field
      await tester.tap(find.byKey(const Key('date_picker')));
      await tester.pumpAndSettle();

      // Verify sheet
      expectLater(
        find.byKey(const Key('date_picker_sheet')),
        matchesGoldenFile('golden/date_picker_single.png'),
      );

      // Tap Tap other date
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('confirm_button')));

      await tester.pumpAndSettle();

      expect(selectedDate, DateTime.utc(2020, 1, 15));
    });
  });

  group('Date Picker range select', () {
    testWidgets('show empty field', (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsDatePicker.range(
            labelText: 'Date Picker',
            hintText: const ['Start date', 'End date'],
            descriptionText: 'Description',
            helperText: 'Helper text',
            size: FunDsFieldSize.small,
          ),
        ),
      );

      expect(find.byType(FunDsDatePicker), findsOneWidget);
      expect(find.text('Date Picker'), findsOneWidget);
      expect(find.text('Start date'), findsOneWidget);
      expect(find.text('End date'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Helper text'), findsOneWidget);
    });

    testWidgets('show filled field and sheet', (tester) async {
      testOnPixel7ProScreen(tester);

      DateTime? selectedStart;
      DateTime? selectedEnd;

      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsDatePicker.range(
            key: const Key('date_picker'),
            labelText: 'Date Picker',
            hintText: const ['Start date', 'End date'],
            descriptionText: 'Description',
            helperText: 'Helper text',
            size: FunDsFieldSize.small,
            selectedRange: [
              DateTime(2020, 1, 1),
              DateTime(2020, 1, 10),
            ],
            onChanged: (start, end) {
              selectedStart = start;
              selectedEnd = end;
            },
          ),
        ),
      );

      // Verify filled field
      expect(find.byType(FunDsDatePicker), findsOneWidget);
      expect(find.text('Date Picker'), findsOneWidget);
      expect(find.text('Start date'), findsNothing);
      expect(find.text('End date'), findsNothing);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('Helper text'), findsOneWidget);
      expect(find.text('01-01-2020'), findsOneWidget);
      expect(find.text('10-01-2020'), findsOneWidget);

      // Tap field
      await tester.tap(find.byKey(const Key('date_picker')));
      await tester.pumpAndSettle();

      // Verify sheet
      expectLater(
        find.byKey(const Key('date_picker_sheet')),
        matchesGoldenFile('golden/date_picker_range.png'),
      );

      // Tap Tap other date
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('20'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('confirm_button')));

      await tester.pumpAndSettle();

      expect(selectedStart, DateTime.utc(2020, 1, 15));
      expect(selectedEnd, DateTime.utc(2020, 1, 20));
    });
  });
}
