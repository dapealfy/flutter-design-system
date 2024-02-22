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
              child: Avatar.asset(
                  imagePath: imagePath,
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: AvatarSize.xxl,
                  shape: AvatarShape.round)));

          expect(find.byType(Avatar), findsOneWidget);
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.imagePath, 'imagePath', imagePath),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.backgroundColor, 'backgroundColor',
                FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.foregroundColor, 'foregroundColor',
                FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.size, 'size', AvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.shape, 'shape', AvatarShape.round),
          );
        },
      );

      testWidgets(
        'Rectangle Avatar with image from asset',
        (tester) async {
          await tester.pumpWidget(buildTestableWidget(
              child: Avatar(
                  imagePath: imagePath,
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: AvatarSize.xxl,
                  shape: AvatarShape.rectangle)));

          expect(find.byType(Avatar), findsOneWidget);
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.imagePath, 'imagePath', imagePath),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.backgroundColor, 'backgroundColor',
                FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.foregroundColor, 'foregroundColor',
                FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.size, 'size', AvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>()
                .having((t) => t.shape, 'shape', AvatarShape.rectangle),
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
                  child: Avatar.network(
                      imageUrl: bgImage,
                      backgroundColor: FunDsColors.colorPrimary100,
                      foregroundColor: FunDsColors.colorPrimary500,
                      size: AvatarSize.xxl,
                      shape: AvatarShape.rectangle))));

          expect(find.byType(Avatar), findsOneWidget);
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having(
              (t) => t.imageUrl,
              'backgroundImage',
              bgImage,
            ),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.backgroundColor, 'backgroundColor',
                FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.foregroundColor, 'foregroundColor',
                FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.size, 'size', AvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>()
                .having((t) => t.shape, 'shape', AvatarShape.rectangle),
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
              child: Avatar.network(
                  imageUrl: '',
                  name: 'Amartha Microfinance',
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: AvatarSize.xxl,
                  shape: AvatarShape.round),
            ),
          );

          expect(find.byType(Avatar), findsOneWidget);

          expect(find.text('AM'), findsOneWidget);

          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.backgroundColor, 'backgroundColor',
                FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.foregroundColor, 'foregroundColor',
                FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.size, 'size', AvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.shape, 'shape', AvatarShape.round),
          );
        },
      );

      testWidgets(
        'Round Avatar with text Amartha will be A',
        (tester) async {
          await tester.pumpWidget(buildTestableWidget(
              child: Avatar.network(
                  imageUrl: '',
                  name: 'A',
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  size: AvatarSize.xxl,
                  shape: AvatarShape.rectangle)));

          expect(find.byType(Avatar), findsOneWidget);
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.name, 'avatarText', 'A'),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.backgroundColor, 'backgroundColor',
                FunDsColors.colorPrimary100),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.foregroundColor, 'foregroundColor',
                FunDsColors.colorPrimary500),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>().having((t) => t.size, 'size', AvatarSize.xxl),
          );
          expect(
            tester.widget(find.byType(Avatar)),
            isA<Avatar>()
                .having((t) => t.shape, 'shape', AvatarShape.rectangle),
          );
        },
      );
    },
  );
}
