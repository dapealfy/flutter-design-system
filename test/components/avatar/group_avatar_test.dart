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
            child: FunDsGroupAvatar(
              maxLength: 3,
              itemCount: listName.length,
              itemBuilder: (context, index) {
                return FunDsAvatar(
                  name: listName[index],
                  size: FunDsAvatarSize.xxl,
                  backgroundColor: FunDsColors.colorPrimary100,
                  foregroundColor: FunDsColors.colorPrimary500,
                  shape: FunDsAvatarShape.round,
                  border: Border.all(
                    color: FunDsColors.colorWhite,
                    width: 2,
                  ),
                );
              },
            ),
          ),
        );

        expect(find.byType(FunDsGroupAvatar), findsOneWidget);
        expect(find.text('+9'), findsOneWidget);
      },
    );
  });
}
