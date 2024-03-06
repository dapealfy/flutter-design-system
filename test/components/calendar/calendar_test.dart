import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/calendar_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsCalendar show correctly',
    (WidgetTester tester) async {
      DateTime? selectedDate;
      final initialDate = DateTime(2024, 5, 5);
      const errorText = 'Pastikan memilih tahun sekarang!';
      await tester.pumpWidget(
        buildTestableWidget(
          child: Builder(
            builder: (BuildContext context) => ElevatedButton(
              onPressed: () {
                Calendar.showSheet(
                  context,
                  titleText: 'Title',
                  minDate: DateTime(2000, 12, 1),
                  maxDate: DateTime(2039, 5, 5),
                  initialDate: initialDate,
                  validation: (date) {
                    if (date.year != initialDate.year) {
                      return errorText;
                    }
                    return null;
                  },
                ).then((value) {
                  if (value != null) {
                    selectedDate = value;
                  }
                });
              },
              child: const Text('Show'),
            ),
          ),
        ),
      );

      // Show sheets
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      // Verify content
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Simpan'), findsOneWidget);
      expect(find.text('Batal'), findsOneWidget);
      expect(find.calendarError(), findsNothing);

      // Verify initial date
      expect(find.text(initialDate.year.toString()), findsOneWidget);
      expect(find.text(initialDate.day.toString()), findsOneWidget);
      expect(find.text(CalendarUtils.getMonthName(initialDate.month)),
          findsOneWidget);

      // Tap to previous year
      await tester.tap(find.text((initialDate.year - 1).toString()));
      await tester.pumpAndSettle();
      expect(find.text((initialDate.year - 1).toString()), findsOneWidget);

      // Error shown
      expect(find.calendarError(), findsOne);

      // Scroll back to current year
      await tester.drag(
        find.calendarYearList(),
        Offset(0, -Calendar.itemExtent),
      );
      await tester.pumpAndSettle();
      expect(find.calendarError(), findsNothing);

      // Close
      await tester.tap(find.calendarCancel());
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsNothing);

      // Re open
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      // Change month to previous
      await tester.drag(
        find.calendarMonthList(),
        Offset(0, Calendar.itemExtent),
      );
      await tester.pumpAndSettle();

      // Change day to previous
      await tester.drag(
        find.calendarDayList(),
        Offset(0, Calendar.itemExtent),
      );
      await tester.pumpAndSettle();

      // Save
      await tester.tap(find.calendarSave());

      // Verify selected date
      expect(
        selectedDate,
        DateTime(
          initialDate.year,
          initialDate.month - 1,
          initialDate.day - 1,
        ),
      );
    },
  );
}

extension FunDsCaledarFinder on CommonFinders {
  Finder calendarDayList() => find.byKey(const Key('calendar-day'));
  Finder calendarMonthList() => find.byKey(const Key('calendar-month'));
  Finder calendarYearList() => find.byKey(const Key('calendar-year'));
  Finder calendarSave() => find.byKey(const Key('calendar-save'));
  Finder calendarCancel() => find.byKey(const Key('calendar-cancel'));
  Finder calendarError() => find.byKey(const Key('calendar-error'));
}
