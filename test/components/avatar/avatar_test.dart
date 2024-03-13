import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../utils/test_utils.dart';

void main() {
  group(
    'Single Avatar with image from asset Test',
    () {
      String imagePath = 'assets/images/user_1.jpeg';
      testWidgets(
        'Round Avatar with image from asset',
        (tester) async {
          await tester.pumpWidget(buildTestableWidget(
              child: FunDsAvatar.asset(
                  imagePath: imagePath,
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: FunDsAvatarSize.xxl,
                  shape: FunDsAvatarShape.round)));

          expect(find.byType(FunDsAvatar), findsOneWidget);
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.imagePath, 'imagePath', imagePath),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.backgroundColor,
                'backgroundColor', FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.foregroundColor,
                'foregroundColor', FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.size, 'size', FunDsAvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.shape, 'shape', FunDsAvatarShape.round),
          );
        },
      );

      testWidgets(
        'Rectangle Avatar with image from asset',
        (tester) async {
          await tester.pumpWidget(buildTestableWidget(
              child: FunDsAvatar(
                  imagePath: imagePath,
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: FunDsAvatarSize.xxl,
                  shape: FunDsAvatarShape.rectangle)));

          expect(find.byType(FunDsAvatar), findsOneWidget);
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.imagePath, 'imagePath', imagePath),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.backgroundColor,
                'backgroundColor', FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.foregroundColor,
                'foregroundColor', FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.size, 'size', FunDsAvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.shape, 'shape', FunDsAvatarShape.rectangle),
          );
        },
      );
    },
  );

  group(
    'Single avatar with image from network test',
    () {
      testWidgets(
        'Round Avatar with image from network',
        (tester) async {
          const bgImage =
              'https://images.unsplash.com/photo-1547721064-da6cfb341d50';

          await mockNetworkImages(() async => tester.pumpWidget(
              buildTestableWidget(
                  child: FunDsAvatar.network(
                      imageUrl: bgImage,
                      backgroundColor: FunDsColors.colorPrimary100,
                      foregroundColor: FunDsColors.colorPrimary500,
                      size: FunDsAvatarSize.xxl,
                      shape: FunDsAvatarShape.rectangle))));

          expect(find.byType(FunDsAvatar), findsOneWidget);
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having(
              (t) => t.imageUrl,
              'backgroundImage',
              bgImage,
            ),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.backgroundColor,
                'backgroundColor', FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.foregroundColor,
                'foregroundColor', FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.size, 'size', FunDsAvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.shape, 'shape', FunDsAvatarShape.rectangle),
          );
        },
      );
    },
  );

  group(
    'Single avatar with text',
    () {
      testWidgets(
        'Round Avatar with text Amartha Microfinance will be AM',
        (tester) async {
          await tester.pumpWidget(
            buildTestableWidget(
              child: FunDsAvatar.network(
                  imageUrl: '',
                  name: 'Amartha Microfinance',
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: FunDsAvatarSize.xxl,
                  shape: FunDsAvatarShape.round),
            ),
          );

          expect(find.byType(FunDsAvatar), findsOneWidget);

          expect(find.text('AM'), findsOneWidget);

          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.backgroundColor,
                'backgroundColor', FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.foregroundColor,
                'foregroundColor', FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.size, 'size', FunDsAvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.shape, 'shape', FunDsAvatarShape.round),
          );
        },
      );

      testWidgets(
        'Round Avatar with text Amartha will be A',
        (tester) async {
          await tester.pumpWidget(buildTestableWidget(
              child: FunDsAvatar.network(
                  imageUrl: '',
                  name: 'A',
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: FunDsAvatarSize.xxl,
                  shape: FunDsAvatarShape.rectangle)));

          expect(find.byType(FunDsAvatar), findsOneWidget);
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.name, 'avatarText', 'A'),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.backgroundColor,
                'backgroundColor', FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>().having((t) => t.foregroundColor,
                'foregroundColor', FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.size, 'size', FunDsAvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(FunDsAvatar)),
            isA<FunDsAvatar>()
                .having((t) => t.shape, 'shape', FunDsAvatarShape.rectangle),
          );
        },
      );
    },
  );
}
