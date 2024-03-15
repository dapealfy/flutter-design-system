import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_utils.dart';

// flutter test --update-goldens test/components/navbar/navbar_test.dart
void main() {
  testWidgets('NavBar raised center works correctly', (tester) async {
    // Build the widget
    bool isTapped = false;
    await tester.pumpWidget(buildTestableWidget(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            const Spacer(),
            FunDsNavBar(
              items: [
                FunDsNavItem(
                  icon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  activeIcon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  label: 'Home',
                ),
                FunDsNavItem(
                  icon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  activeIcon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  label: 'Test',
                ),
                FunDsNavItem(
                  icon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  activeIcon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                isTapped = true;
              },
              raisedCenter: true,
              currentIndex: 0,
            ),
          ],
        ),
      ),
    ));

    expectLater(
      find.byType(FunDsNavBar),
      matchesGoldenFile('golden/navbar_raised_center.png'),
    );

    // Tap the first item
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    // Verify the interaction
    expect(isTapped, true);
  });

  testWidgets('NavBar normal center works correctly', (tester) async {
    // Build the widget
    bool isTapped = false;
    await tester.pumpWidget(buildTestableWidget(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            const Spacer(),
            FunDsNavBar(
              items: [
                FunDsNavItem(
                  icon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  activeIcon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  label: 'Home',
                ),
                FunDsNavItem(
                  icon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  activeIcon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  label: 'Test',
                ),
                FunDsNavItem(
                  icon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  activeIcon: const FunDsIcon(
                    funDsIconography: FunDsIconography.actionIcCheckCircle,
                    size: 24,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                isTapped = true;
              },
              raisedCenter: false,
              currentIndex: 0,
            ),
          ],
        ),
      ),
    ));

    expectLater(
      find.byType(FunDsNavBar),
      matchesGoldenFile('golden/navbar_normal_center.png'),
    );

    // Tap the first item
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    // Verify the interaction
    expect(isTapped, true);
  });
}
