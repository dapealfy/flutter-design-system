import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../utils/test_utils.dart';

void main() {
  group('Single FunDsAvatar Test', () {
    testWidgets(
      'Round FunDsAvatar with backgroundImage from assets',
      (tester) async {
        await tester.pumpWidget(buildTestableWidget(
            child: const FunDsAvatar(
                backgroundImage: AssetImage('assets/images/user_1.jpeg'),
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                size: FunDsAvatarSize.xxl,
                shape: FunDsAvatarShape.round)));

        expect(find.byType(FunDsAvatar), findsOneWidget);
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.backgroundImage, 'backgroundImage',
              const AssetImage('assets/images/user_1.jpeg')),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.backgroundColor, 'backgroundColor',
              FunDsColors.colorPrimary100),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.foregroundColor, 'foregroundColor',
              FunDsColors.colorPrimary500),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.size, 'size', FunDsAvatarSize.xxl),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>()
              .having((t) => t.shape, 'shape', FunDsAvatarShape.round),
        );
      },
    );

    testWidgets(
      'Rectangle FunDsAvatar with backgroundImage from assets',
      (tester) async {
        await tester.pumpWidget(buildTestableWidget(
            child: const FunDsAvatar(
                backgroundImage: AssetImage('assets/images/user_1.jpeg'),
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                size: FunDsAvatarSize.xxl,
                shape: FunDsAvatarShape.rectangle)));

        expect(find.byType(FunDsAvatar), findsOneWidget);
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.backgroundImage, 'backgroundImage',
              const AssetImage('assets/images/user_1.jpeg')),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.backgroundColor, 'backgroundColor',
              FunDsColors.colorPrimary100),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.foregroundColor, 'foregroundColor',
              FunDsColors.colorPrimary500),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.size, 'size', FunDsAvatarSize.xxl),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>()
              .having((t) => t.shape, 'shape', FunDsAvatarShape.rectangle),
        );
      },
    );

    testWidgets(
      'Rectangle FunDsAvatar with backgroundImage from network',
      (tester) async {
        const bgImage = NetworkImage(
          'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
        );

        await mockNetworkImages(() async => tester.pumpWidget(
            buildTestableWidget(
                child: const FunDsAvatar(
                    backgroundImage: bgImage,
                    backgroundColor: FunDsColors.colorPrimary100,
                    foregroundColor: FunDsColors.colorPrimary500,
                    size: FunDsAvatarSize.xxl,
                    shape: FunDsAvatarShape.rectangle))));

        expect(find.byType(FunDsAvatar), findsOneWidget);
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having(
            (t) => t.backgroundImage,
            'backgroundImage',
            bgImage,
          ),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.backgroundColor, 'backgroundColor',
              FunDsColors.colorPrimary100),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.foregroundColor, 'foregroundColor',
              FunDsColors.colorPrimary500),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.size, 'size', FunDsAvatarSize.xxl),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>()
              .having((t) => t.shape, 'shape', FunDsAvatarShape.rectangle),
        );
      },
    );

    testWidgets(
      'Round FunDsAvatar with initialText AMARTHA will be AM',
      (tester) async {
        await tester.pumpWidget(buildTestableWidget(
            child: const FunDsAvatar(
                initialText: 'AMARTHA',
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                size: FunDsAvatarSize.xxl,
                shape: FunDsAvatarShape.round)));

        expect(find.byType(FunDsAvatar), findsOneWidget);

        expect(find.text('AM'), findsOneWidget);

        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.backgroundColor, 'backgroundColor',
              FunDsColors.colorPrimary100),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.foregroundColor, 'foregroundColor',
              FunDsColors.colorPrimary500),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.size, 'size', FunDsAvatarSize.xxl),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>()
              .having((t) => t.shape, 'shape', FunDsAvatarShape.round),
        );
      },
    );

    testWidgets(
      'Round FunDsAvatar with initialText A will be A',
      (tester) async {
        await tester.pumpWidget(buildTestableWidget(
            child: const FunDsAvatar(
                initialText: 'A',
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                size: FunDsAvatarSize.xxl,
                shape: FunDsAvatarShape.rectangle)));

        expect(find.byType(FunDsAvatar), findsOneWidget);
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.initialText, 'initialText', 'A'),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.backgroundColor, 'backgroundColor',
              FunDsColors.colorPrimary100),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.foregroundColor, 'foregroundColor',
              FunDsColors.colorPrimary500),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>().having((t) => t.size, 'size', FunDsAvatarSize.xxl),
        );
        expect(
          tester.widget(find.byType(FunDsAvatar)),
          isA<FunDsAvatar>()
              .having((t) => t.shape, 'shape', FunDsAvatarShape.rectangle),
        );
      },
    );

    testWidgets(
      'Round FunDsAvatar with icon',
      (tester) async {
        await tester.pumpWidget(
          buildTestableWidget(
            child: FunDsAvatar(
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
            ),
          ),
        );

        // Find the FunDsAvatar widget
        final avatarFinder = find.byType(FunDsAvatar);

        // Ensure the widget is present
        expect(avatarFinder, findsOneWidget);

        // Verify properties of the FunDsAvatar
        final FunDsAvatar avatarWidget =
            tester.widget<FunDsAvatar>(avatarFinder);
        expect(avatarWidget.size, equals(FunDsAvatarSize.xxs));
        expect(
            avatarWidget.backgroundColor, equals(FunDsColors.colorNeutral200));
        expect(avatarWidget.shape, equals(FunDsAvatarShape.round));

        // Verify the presence of SvgPicture inside FunDsAvatar
        expect(find.byType(SvgPicture), findsOneWidget);
      },
    );

    testWidgets(
      'Rectangle FunDsAvatar with icon',
      (tester) async {
        await tester.pumpWidget(
          buildTestableWidget(
            child: FunDsAvatar(
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.rectangle,
            ),
          ),
        );

        // Find the FunDsAvatar widget
        final avatarFinder = find.byType(FunDsAvatar);

        // Ensure the widget is present
        expect(avatarFinder, findsOneWidget);

        // Verify properties of the FunDsAvatar
        final FunDsAvatar avatarWidget =
            tester.widget<FunDsAvatar>(avatarFinder);
        expect(avatarWidget.size, equals(FunDsAvatarSize.xxs));
        expect(
            avatarWidget.backgroundColor, equals(FunDsColors.colorNeutral200));
        expect(avatarWidget.shape, equals(FunDsAvatarShape.rectangle));

        // Verify the presence of SvgPicture inside FunDsAvatar
        expect(find.byType(SvgPicture), findsOneWidget);
      },
    );
  });
}
