import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const _calendarDescription = '''
Widget name: FunDsCalendar

How to Use:

FunDsCalendar.showSheet(
  context,
  titleText: 'Pilih Tanggal',
  minDate: DateTime(2021, 12, 1),
  maxDate: DateTime(2024, 3, 5),
  initialDate: DateTime.now(),
  validation: (date) {
    if (date.year != DateTime.now().year) {
      return 'Pastikan memilih tahun sekarang!';
    }
    return null;
  },
).then((value) {
  if (value != null) {
    // Get the value here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Date: \${value.toString()}',
        ),
      ),
    );
  }
});
''';

class CalendarCatalog extends StatelessWidget {
  const CalendarCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final titleText = context.knobs.text(
      label: 'Title Text',
      initial: 'Pilih Tanggal',
    );

    return CatalogPage(
      title: 'Calendar',
      description: _calendarDescription,
      child: Column(
        children: [
          FunDsButton(
            type: FunDsButtonType.small,
            variant: FunDsButtonVariant.primary,
            text: 'Show',
            onPressed: () {
              FunDsCalendar.showSheet(
                context,
                titleText: titleText,
                minDate: DateTime(2000, 12, 1),
                maxDate: DateTime(2039, 5, 5),
                initialDate: DateTime.now(),
                validation: (date) {
                  if (date.year != DateTime.now().year) {
                    return 'Pastikan memilih tahun sekarang!';
                  }
                  return null;
                },
              ).then((value) {
                if (value != null) {
                  // Get the value here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Date: ${value.toString()}',
                      ),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
