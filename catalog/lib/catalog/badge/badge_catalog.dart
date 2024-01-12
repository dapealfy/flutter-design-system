import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;

class BadgeCatalog extends StatelessWidget {
  const BadgeCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Badge',
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          children: [
            const Text('Badge Status: Light'),
            const SizedBox(height: 8),
            Row(
              children: [
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.light,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.light,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.light,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.light,
                  inverted: true,
                  count: 9,
                ),
              ],
            ),
            const SizedBox(height: 64),
            const Text('Badge Status: Info'),
            const SizedBox(height: 8),
            Row(
              children: [
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.info,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.info,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.info,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.info,
                  inverted: true,
                  count: 9,
                ),
              ],
            ),
            const SizedBox(height: 64),
            const Text('Badge Status: Success'),
            const SizedBox(height: 8),
            Row(
              children: [
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.success,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.success,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.success,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.success,
                  inverted: true,
                  count: 9,
                ),
              ],
            ),
            const SizedBox(height: 64),
            const Text('Badge Status: Warning'),
            const SizedBox(height: 8),
            Row(
              children: [
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.warning,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.warning,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.warning,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.warning,
                  inverted: true,
                  count: 9,
                ),
              ],
            ),
            const SizedBox(height: 64),
            const Text('Badge Status: Alert'),
            const SizedBox(height: 8),
            Row(
              children: [
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.alert,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.Badge(
                  badgeStatus: funds.BadgeStatus.alert,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.alert,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.alert,
                  inverted: true,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.Badge.circled(
                  badgeStatus: funds.BadgeStatus.alert,
                  inverted: false,
                  count: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
