import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsBanner General basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsBanner.general(
            title: 'Test Title',
            description: 'Test Description',
            button: const funds.FunDsButton(
              type: funds.FunDsButtonType.xSmall,
              variant: funds.FunDsButtonVariant.ghost,
              text: 'Button',
            ),
            leftIcon: const Icon(Icons.check_circle),
            showCloseButton: true,
            type: funds.FunDsBannerType.normal,
            version: funds.FunDsBannerVersion.v1,
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
      expect(find.findLeftIcon(), findsOneWidget);
      expect(find.findTitle(), findsOneWidget);
      expect(find.findDescription(), findsOneWidget);
      expect(find.findButton(), findsOneWidget);
      expect(find.findCloseButton(), findsOneWidget);

      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'FunDsBanner Stick basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsBanner.sticky(
            text: 'Test Title',
            button: const funds.FunDsButton(
              type: funds.FunDsButtonType.xSmall,
              variant: funds.FunDsButtonVariant.ghost,
              text: 'Button',
            ),
            showCloseButton: true,
            version: funds.FunDsBannerVersion.v1,
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
      expect(find.findTitle(), findsOneWidget);
      expect(find.findButton(), findsOneWidget);
      expect(find.findCloseButton(), findsOneWidget);

      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'FunDsBanner Marketing basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsBanner.marketing(
            title: 'Test Title',
            description: 'Test Description',
            image: Image.asset(
              'assets/images/user_1.jpeg',
              fit: BoxFit.cover,
            ),
            button: const funds.FunDsButton(
              type: funds.FunDsButtonType.xSmall,
              variant: funds.FunDsButtonVariant.secondary,
              text: 'Button',
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
      expect(find.findTitle(), findsOneWidget);
      expect(find.findButton(), findsOneWidget);
      expect(find.findImage(), findsOneWidget);

      await tester.pumpAndSettle();
    },
  );
}

extension FunDsBannerFinder on CommonFinders {
  Finder findTitle() => find.byKey(const Key('title'));
  Finder findDescription() => find.byKey(const Key('description'));
  Finder findLeftIcon() => find.byKey(const Key('leftIcon'));
  Finder findButton() => find.byKey(const Key('button'));
  Finder findCloseButton() => find.byKey(const Key('closeButton'));
  Finder findImage() => find.byKey(const Key('image'));
}
