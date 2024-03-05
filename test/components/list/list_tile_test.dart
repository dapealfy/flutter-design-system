import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsListTile basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsListTile(
            title: 'Test Title',
            badge: const funds.Badge(
              label: 'Test Badge',
              badgeStatus: funds.BadgeStatus.light,
            ),
            subtitle: 'Test Subtitle',
            alertText: 'Test Alert',
            leading: const funds.Avatar(
              name: 'Avatar',
              size: funds.AvatarSize.large,
              backgroundColor: funds.FunDsColors.colorNeutral200,
            ),
            label: const funds.Label(
              'Test Label',
              color: funds.LabelColor.purple,
            ),
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Alert'), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.byType(funds.Avatar), findsOneWidget);

      await tester.pumpAndSettle();
    },
  );
  testWidgets(
    'FunDsListTile variant Chevron  basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsListTile.chevron(
            title: 'Test Title',
            badge: const funds.Badge(
              label: 'Test Badge',
              badgeStatus: funds.BadgeStatus.light,
            ),
            subtitle: 'Test Subtitle',
            alertText: 'Test Alert',
            leading: const funds.Avatar(
              name: 'Avatar',
              size: funds.AvatarSize.large,
              backgroundColor: funds.FunDsColors.colorNeutral200,
            ),
            label: const funds.Label(
              'Test Label',
              color: funds.LabelColor.purple,
            ),
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Alert'), findsOneWidget);
      expect(
          find.byKey(
            const Key(
              'trailing_chevron',
            ),
          ),
          findsOneWidget);

      await tester.pumpAndSettle();
    },
  );
  testWidgets(
    'FunDsListTile variant Radio  basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsListTile.radio(
            title: 'Test Title',
            badge: const funds.Badge(
              label: 'Test Badge',
              badgeStatus: funds.BadgeStatus.light,
            ),
            subtitle: 'Test Subtitle',
            alertText: 'Test Alert',
            leading: const funds.Avatar(
              name: 'Avatar',
              size: funds.AvatarSize.large,
              backgroundColor: funds.FunDsColors.colorNeutral200,
            ),
            label: const funds.Label(
              'Test Label',
              color: funds.LabelColor.purple,
            ),
            value: 1,
            onRadioChanged: (p0) {},
            selectedValue: 2,
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Alert'), findsOneWidget);
      expect(
          find.byKey(
            const Key(
              'trailing_radio',
            ),
          ),
          findsOneWidget);

      await tester.pumpAndSettle();
    },
  );
  testWidgets(
    'FunDsListTile variant label  basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsListTile.label(
            title: 'Test Title',
            badge: const funds.Badge(
              label: 'Test Badge',
              badgeStatus: funds.BadgeStatus.light,
            ),
            subtitle: 'Test Subtitle',
            alertText: 'Test Alert',
            leading: const funds.Avatar(
              name: 'Avatar',
              size: funds.AvatarSize.large,
              backgroundColor: funds.FunDsColors.colorNeutral200,
            ),
            subTitlelabel: const funds.Label(
              'Test Label',
              color: funds.LabelColor.purple,
            ),
            label: const funds.Label(
              'Label',
              color: funds.LabelColor.orange,
            ),
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Alert'), findsOneWidget);
      expect(
          find.byKey(
            const Key(
              'trailing_label',
            ),
          ),
          findsOneWidget);

      await tester.pumpAndSettle();
    },
  );
  testWidgets(
    'FunDsListTile variant checkbox  basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsListTile.checkbox(
            title: 'Test Title',
            badge: const funds.Badge(
              label: 'Test Badge',
              badgeStatus: funds.BadgeStatus.light,
            ),
            subtitle: 'Test Subtitle',
            alertText: 'Test Alert',
            leading: const funds.Avatar(
              name: 'Avatar',
              size: funds.AvatarSize.large,
              backgroundColor: funds.FunDsColors.colorNeutral200,
            ),
            label: const funds.Label(
              'Test Label',
              color: funds.LabelColor.purple,
            ),
            onCheckedChanged: (p0) {},
            value: true,
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Alert'), findsOneWidget);
      expect(
          find.byKey(
            const Key(
              'trailing_checkbox',
            ),
          ),
          findsOneWidget);

      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'FunDsListTile variant button  basic property show correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: funds.FunDsListTile.button(
            title: 'Test Title',
            badge: const funds.Badge(
              label: 'Test Badge',
              badgeStatus: funds.BadgeStatus.light,
            ),
            subtitle: 'Test Subtitle',
            alertText: 'Test Alert',
            leading: const funds.Avatar(
              name: 'Avatar',
              size: funds.AvatarSize.large,
              backgroundColor: funds.FunDsColors.colorNeutral200,
            ),
            label: const funds.Label(
              'Test Label',
              color: funds.LabelColor.purple,
            ),
            onTap: () {},
            button: funds.FunDsButton(
              text: 'Test Button',
              type: funds.FunDsButtonType.xSmall,
              variant: funds.FunDsButtonVariant.primary,
              enabled: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Alert'), findsOneWidget);
      expect(
          find.byKey(
            const Key(
              'trailing_button',
            ),
          ),
          findsOneWidget);

      await tester.pumpAndSettle();
    },
  );
}
