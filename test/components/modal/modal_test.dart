import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'When tap button should show Modal dialog',
    (tester) async {
      await pumpTestButton(tester);

      expect(find.text('Modal-Heading'), findsNothing);

      await tester.tap(find.byKey(const Key('test-button')));
      await tester.pump();

      expect(find.text('Modal-Heading'), findsOneWidget);
      expect(find.text('Modal-Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    },
  );

  group('Given modal is showing', () {
    testWidgets(
      'When tap button cross close, should dismiss Modal',
      (tester) async {
        await pumpTestButton(tester);
        expect(find.text('Modal-Heading'), findsNothing);
        await tester.tap(find.byKey(const Key('test-button')));
        await tester.pump();

        expect(find.text('Modal-Heading'), findsOneWidget);
        expect(find.text('Modal-Title'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);

        await tester.tap(find.byKey(const Key('btn-cross-close')));
        await tester.pump();
        expect(find.text('Modal-Heading'), findsNothing);
      },
    );

    testWidgets(
      'When tap button secondary, should dismiss Modal',
      (tester) async {
        await pumpTestButton(tester);
        expect(find.text('Modal-Heading'), findsNothing);
        await tester.tap(find.byKey(const Key('test-button')));
        await tester.pump();

        expect(find.text('Modal-Heading'), findsOneWidget);
        expect(find.text('Modal-Title'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);

        await tester.tap(find.byKey(const Key('btn-secondary')));
        await tester.pump();
        expect(find.text('Modal-Heading'), findsNothing);
      },
    );

    testWidgets(
      'When tap button primary, should dismiss Modal',
      (tester) async {
        await pumpTestButton(tester);
        expect(find.text('Modal-Heading'), findsNothing);
        await tester.tap(find.byKey(const Key('test-button')));
        await tester.pump();

        expect(find.text('Modal-Heading'), findsOneWidget);
        expect(find.text('Modal-Title'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);

        await tester.tap(find.byKey(const Key('btn-primary')));
        await tester.pump();
        expect(find.text('Modal-Heading'), findsNothing);
      },
    );

    testWidgets(
      'When tap barrier, should not dismiss Modal',
      (tester) async {
        await pumpTestButton(tester);
        expect(find.text('Modal-Heading'), findsNothing);
        await tester.tap(find.byKey(const Key('test-button')));
        await tester.pump();

        expect(find.text('Modal-Heading'), findsOneWidget);
        expect(find.text('Modal-Title'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);

        await tester.tapAt(const Offset(0, 0));
        await tester.pump();
        expect(find.text('Modal-Heading'), findsOneWidget);
      },
    );
  });
}

Future<void> pumpTestButton(WidgetTester tester) {
  return tester.pumpWidget(
    buildTestableWidget(
      child: Builder(builder: (context) {
        return ElevatedButton(
          key: const Key('test-button'),
          onPressed: () {
            FunDsModal.show(
              context: context,
              heading: 'Modal-Heading',
              title: 'Modal-Title',
              desc: 'Description',
              image: '',
              groupButton: FunDsGroupButton(
                variant: FunDsGroupButtonVariant.horizontal,
                listButton: [
                  FunDsButton(
                    key: const Key('btn-secondary'),
                    type: FunDsButtonType.medium,
                    text: 'Tutup',
                    variant: FunDsButtonVariant.secondary,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                  FunDsButton(
                    key: const Key('btn-primary'),
                    type: FunDsButtonType.medium,
                    text: 'Lanjutkan',
                    variant: FunDsButtonVariant.primary,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                ],
              ),
            );
          },
          child: const Text('Open modal'),
        );
      }),
    ),
  );
}
