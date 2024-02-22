import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  group('Group Text FunDsAvatar Test', () {
    List<String> listName = [
      'Anton Budi Citorus',
      'Budi Citorus',
      'Citorus',
      'Dedi',
      'Eko',
      'Fajar',
      'Gita',
      'Hari',
      'Iwan',
      'Joko',
      'Kurnia',
      'Lina',
      'Mega',
      'Nina',
      'Oscar',
      'Purnama',
      'Qiqi',
      'Rahmat',
      'Sari',
      'Tono',
    ];


    testWidgets(
      'Group Text FunDsAvatar with +1',
      (tester) async {
        await tester.pumpWidget(
          buildTestableWidget(
            child:  GroupAvatar(
              maxLength: 3,
              itemCount: listName.length,
              itemBuilder: (context, index) {
                return Avatar(
                  name: listName[index],
                  size: AvatarSize.xxl,
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  shape: AvatarShape.round,
                  border: Border.all(
                    color: FunDsColors.colorWhite,
                    width: 2,
                  ),
                );
              },
            ),
          ),
        );

        expect(find.byType(GroupAvatar), findsOneWidget);
        expect(find.text('+9'), findsOneWidget);
      },
    );
  });
}
