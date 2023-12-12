import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/input_field/funds_text_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system/src/components/input_field/text_field.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsTextField basic property show correctly',
    (WidgetTester tester) async {
      const debounceDuration = Duration(milliseconds: 500);
      var userInput = '';
      var userInputDebounced = '';
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsTextField(
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

      expect(find.findPrefix(), findsNothing);
      expect(find.findSuffix1(), findsNothing);
      expect(find.findSuffix2(), findsNothing);
      expect(find.findRightIcon1(), findsNothing);
      expect(find.findRightIcon2(), findsNothing);
      expect(find.findLeftIcon(), findsNothing);

      await tester.enterText(find.findTextField(), 'hello');
      expect(userInput, 'hello');
      await tester.pumpAndSettle();

      // Verify debounce works
      expect(userInputDebounced, '');
      await tester.pump(debounceDuration);
      expect(userInputDebounced, 'hello');

      // Verify clear
      await tester.ensureVisible(find.findClearIcon());
      await tester.tap(find.findClearIcon());
      expect(userInput, '');
    },
  );

  testWidgets(
    'FunDsTextField custom prefix, suffix, icon show correctly',
    (tester) async {
      final controller = FunDsTextController(text: 'Initial Value');

      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsTextField(
            label: const Text('Test Label'),
            description: const Text('Test Description'),
            hintText: 'Test Hint',
            helper: const Text('Test Helper'),
            controller: controller,
            prefix: const Text('Prefix'),
            suffix1: const Text('Suffix 1'),
            suffix2: const Text('Suffix 2'),
            leftIcon: const Icon(Icons.ac_unit),
            rightIcon1: const Icon(Icons.ac_unit),
            rightIcon2: const Icon(Icons.ac_unit),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Test Helper'), findsOneWidget);
      expect(find.text('Initial Value'), findsOneWidget);

      expect(find.findPrefix(), findsOneWidget);
      expect(find.findSuffix1(), findsOneWidget);
      expect(find.findSuffix2(), findsOneWidget);
      expect(find.findRightIcon1(), findsOneWidget);
      expect(find.findRightIcon2(), findsOneWidget);
      expect(find.findLeftIcon(), findsOneWidget);
    },
  );

  testWidgets(
    'FunDsTextField disable cannot be edited',
    (tester) async {
      final controller = FunDsTextController(text: 'Initial Value');

      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsTextField(
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

extension FunDsTextFieldFinder on CommonFinders {
  Finder findFunDsTextField() => find.byType(FunDsTextField);
  Finder findPrefix() => find.byKey(const Key('prefix'));
  Finder findSuffix1() => find.byKey(const Key('suffix1'));
  Finder findSuffix2() => find.byKey(const Key('suffix2'));
  Finder findLeftIcon() => find.byKey(const Key('leftIcon'));
  Finder findRightIcon1() => find.byKey(const Key('rightIcon1'));
  Finder findRightIcon2() => find.byKey(const Key('rightIcon2'));
  Finder findClearIcon() => find.byKey(const Key('clearIcon'));
  Finder findTextField() => find.byKey(const Key('textField'));
}
