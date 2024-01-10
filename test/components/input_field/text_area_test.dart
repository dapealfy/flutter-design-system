import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'TextArea basic property show correctly',
    (WidgetTester tester) async {
      const debounceDuration = Duration(milliseconds: 500);
      var userInput = '';
      var userInputDebounced = '';
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.TextArea(
            labelText: 'Test Label',
            descriptionText: 'Test Description',
            hintText: 'Test Hint',
            helperText: 'Test Helper',
            onChanged: (value) {
              userInput = value;
            },
            onChangedDebounced: (value) {
              userInputDebounced = value;
            },
            debounceDuration: debounceDuration,
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Test Hint'), findsOneWidget);
      expect(find.text('Test Helper'), findsOneWidget);
      expect(find.findCounter(), findsOneWidget);

      expect(find.findRightIcon1(), findsNothing);
      expect(find.findRightIcon2(), findsNothing);

      await tester.enterText(find.findTextField(), 'hello');
      await tester.pumpAndSettle();

      expect(userInput, 'hello');
      expect(find.text('5 / 250'), findsOneWidget);

      // Verify debounce works
      expect(userInputDebounced, '');
      await tester.pump(debounceDuration);
      expect(userInputDebounced, 'hello');
    },
  );

  testWidgets(
    'TextArea custom icon show correctly',
    (tester) async {
      final controller = funds.FunDsTextController(text: 'Initial Value');

      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.TextArea(
            label: const Text('Test Label'),
            description: const Text('Test Description'),
            hintText: 'Test Hint',
            helper: const Text('Test Helper'),
            controller: controller,
            rightIcon1: const Icon(Icons.ac_unit),
            rightIcon2: const Icon(Icons.ac_unit),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Test Helper'), findsOneWidget);
      expect(find.text('Initial Value'), findsOneWidget);

      expect(find.findRightIcon1(), findsOneWidget);
      expect(find.findRightIcon2(), findsOneWidget);
    },
  );

  testWidgets(
    'TextArea disable cannot be edited',
    (tester) async {
      final controller = funds.FunDsTextController(text: 'Initial Value');

      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.TextArea(
            labelText: 'Test Label',
            descriptionText: 'Test Description',
            hintText: 'Test Hint',
            helperText: 'Test Helper',
            controller: controller,
            enabled: false,
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Test Helper'), findsOneWidget);
      expect(find.text('Initial Value'), findsOneWidget);

      // Verify cannot be edited
      await tester.enterText(find.findTextField(), 'hello');
      expect(controller.text, 'Initial Value');
    },
  );
}

extension FunDsTextAreaFinder on CommonFinders {
  Finder findFunDsTextField() => find.byType(funds.TextArea);
  Finder findRightIcon1() => find.byKey(const Key('rightIcon1'));
  Finder findRightIcon2() => find.byKey(const Key('rightIcon2'));
  Finder findTextField() => find.byKey(const Key('textField'));
  Finder findCounter() => find.byKey(const Key('counter'));
}
