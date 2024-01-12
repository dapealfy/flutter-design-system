import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  group('Badge Test', () {
    testWidgets(
      'Badge Info show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: const funds.Badge(
              badgeStatus: funds.BadgeStatus.info,
              label: 'Badge Info',
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('Badge Info'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorBlue600));
      },
    );

    testWidgets(
      'Badge Light show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: const funds.Badge(
              badgeStatus: funds.BadgeStatus.light,
              label: 'Badge Light',
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('Badge Light'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(
            actualBackgroundColor, equals(funds.FunDsColors.colorPrimary500));
      },
    );

    testWidgets(
      'Badge Success show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: const funds.Badge(
              badgeStatus: funds.BadgeStatus.success,
              label: 'Badge Success',
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('Badge Success'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorGreen600));
      },
    );

    testWidgets(
      'Badge Warning show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: const funds.Badge(
              badgeStatus: funds.BadgeStatus.warning,
              label: 'Badge Warning',
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('Badge Warning'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorOrange500));
      },
    );

    testWidgets(
      'Badge Alert show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: const funds.Badge(
              badgeStatus: funds.BadgeStatus.alert,
              label: 'Badge Alert',
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('Badge Alert'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorRed500));
      },
    );
  });

  group('Badge Circled Test', () {
    testWidgets(
      'Badge Circled with count 9 Info show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: funds.Badge.circled(
              badgeStatus: funds.BadgeStatus.info,
              count: 9,
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('9'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorBlue600));
      },
    );

    testWidgets(
      'Badge Circled with count 9 Light show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: funds.Badge.circled(
              badgeStatus: funds.BadgeStatus.light,
              count: 9,
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('9'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(
            actualBackgroundColor, equals(funds.FunDsColors.colorPrimary500));
      },
    );

    testWidgets(
      'Badge Circled with count 9 Success show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: funds.Badge.circled(
              badgeStatus: funds.BadgeStatus.success,
              count: 9,
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('9'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorGreen600));
      },
    );

    testWidgets(
      'Badge Circled with count 9 Warning show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: funds.Badge.circled(
              badgeStatus: funds.BadgeStatus.warning,
              count: 9,
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('9'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorOrange500));
      },
    );

    testWidgets(
      'Badge Circled with count 9 Alert show correctly',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: funds.Badge.circled(
              badgeStatus: funds.BadgeStatus.alert,
              count: 9,
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('9'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
          (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
            container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorRed500));
      },
    );

    testWidgets(
      'Badge Circled with count 100 will show 99 Alert show correctly',
          (widgetTester) async {
        await widgetTester.pumpWidget(
          buildTestableWidget(
            child: funds.Badge.circled(
              badgeStatus: funds.BadgeStatus.alert,
              count: 100,
              inverted: false,
            ),
          ),
        );

        expect(find.byType(funds.Badge), findsOneWidget);
        expect(find.text('99'), findsOneWidget);

        // Find the Container widget using a predicate.
        final Finder containerFinder = find.byWidgetPredicate(
              (Widget widget) => widget is Container,
        );

        // Extract the background color from the Container widget.
        final Container container = widgetTester.widget(containerFinder);
        final ShapeDecoration decoration =
        container.decoration as ShapeDecoration;
        final Color actualBackgroundColor = decoration.color as Color;

        // Verify that the background color matches the expected color.
        expect(actualBackgroundColor, equals(funds.FunDsColors.colorRed500));
      },
    );
  });
}
