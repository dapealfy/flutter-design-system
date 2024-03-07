import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

void main() {
  testWidgets(
    'FunDsLocalLoad default widget show correctly',
    (tester) async {
      await tester.pumpWidget(
        buildTestableWidget(
          child: const FunDsLocalLoad(),
        ),
      );

      expect(find.text('Gagal Memuat Konten'), findsOneWidget);
      expect(
        find.text(
          'Terjadi kesalahan sistem, silakan muat ulang untuk mengakses konten.',
        ),
        findsOneWidget,
      );

      expect(find.byKey(LocalLoadKeys.refreshButton), findsNothing);
    },
  );

  testWidgets(
    'FunDsLocalLoad custom param show correctly',
    (tester) async {
      bool isTapped = false;
      await tester.pumpWidget(
        buildTestableWidget(
          child: FunDsLocalLoad(
            titleText: 'title',
            descriptionText: 'description',
            refreshText: 'refresh',
            illustration: const FunDsIcon(
              funDsIconography: FunDsIconography.actionIcCloud,
              size: 24,
            ),
            onRefreshTap: () {
              isTapped = true;
            },
          ),
        ),
      );

      expect(find.text('title'), findsOneWidget);
      expect(find.text('description'), findsOneWidget);
      expect(find.text('refresh'), findsOneWidget);
      expect(find.byKey(LocalLoadKeys.refreshButton), findsOneWidget);

      await tester.tap(find.byKey(LocalLoadKeys.refreshButton));
      expect(isTapped, true);
    },
  );
}

class LocalLoadKeys {
  static const titleText = Key('titleText');
  static const descriptionText = Key('descriptionText');
  static const refreshButton = Key('refreshButton');
}
