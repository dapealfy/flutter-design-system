import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

main() {
  Widget crossFadeWithWatcher({
    required FunDsSkeletonType type,
    bool isLoading = true,
  }) {
    return buildTestableWidget(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: FunDsSkeleton(
          key: const Key('FunDsSkeleton'),
          child: const Text(
            'test',
            key: Key('content'),
          ),
          isLoading: isLoading,
          type: type,
        ),
      ),
    );
  }

  testWidgets('Make sure given component is working properly', (tester) async {
    for (int i = 0; i > FunDsSkeletonType.values.length; i++) {
      await tester
          .pumpWidget(crossFadeWithWatcher(type: FunDsSkeletonType.values[i]));

      // show shimmer
      expect(find.byKey(const Key('content')), findsNothing);
      expect(find.byKey(const Key('FunDsSkeleton')), findsOneWidget);

      // show content
      await tester.pumpWidget(
        crossFadeWithWatcher(
          type: FunDsSkeletonType.values[i],
          isLoading: false,
        ),
      );
      expect(find.byKey(const Key('content')), findsOne);
      expect(find.text('test'), findsOne);
    }
  });
}
