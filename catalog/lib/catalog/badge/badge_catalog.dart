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
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.light,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.light,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.light,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.light,
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
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.info,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.info,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.info,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.info,
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
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.success,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.success,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.success,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.success,
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
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.warning,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.warning,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.warning,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.warning,
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
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.alert,
                  inverted: false,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                const funds.FunDsBadge(
                  badgeStatus: funds.FunDsBadgeStatus.alert,
                  inverted: true,
                  label: 'Label',
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.alert,
                  inverted: false,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.alert,
                  inverted: true,
                  count: 9,
                ),
                const SizedBox(width: 8),
                funds.FunDsBadge.circled(
                  badgeStatus: funds.FunDsBadgeStatus.alert,
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
