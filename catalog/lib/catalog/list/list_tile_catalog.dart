import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:storybook_flutter/storybook_flutter.dart';

class ListTileCatalog extends StatefulWidget {
  const ListTileCatalog({super.key});

  @override
  State<ListTileCatalog> createState() => _ListTileCatalogState();
}

class _ListTileCatalogState extends State<ListTileCatalog> {
  @override
  Widget build(BuildContext context) {
    final subtitle = context.knobs
        .options<bool>(label: 'Use Subtitle', initial: true, options: [
      const Option(label: 'Yes', value: true),
      const Option(label: 'No', value: false),
    ]);
    final label = context.knobs
        .options<bool>(label: 'Use Label In Subtitle', initial: true, options: [
      const Option(label: 'Yes', value: true),
      const Option(label: 'No', value: false),
    ]);
    final alert = context.knobs
        .options<bool>(label: 'Use Alert Text', initial: true, options: [
      const Option(label: 'Yes', value: true),
      const Option(label: 'No', value: false),
    ]);

    final badge = context.knobs
        .options<bool>(label: 'Use Badge', initial: true, options: [
      const Option(label: 'Yes', value: true),
      const Option(label: 'No', value: false),
    ]);

    final leading = context.knobs.options<bool>(
      label: 'Use Leading',
      initial: true,
      description: 'Widget in left side',
      options: [
        const Option(label: 'Yes', value: true),
        const Option(label: 'No', value: false),
      ],
    );

    void onTileClicked() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('List Tile Clicked'),
        ),
      );
    }

    return CatalogPage(
      title: 'List Tile',
      description: 'Widget name: FunDsListTile',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List Tile Type',
              style: funds.FunDsTypography.body16B,
            ),
            funds.FunDsListTile.chevron(
              title: 'List Title Chevron',
              badge: badge
                  ? const funds.Badge(
                      label: 'Badge',
                      badgeStatus: funds.BadgeStatus.light,
                    )
                  : null,
              subtitle: subtitle ? 'Supporting text' : null,
              alertText: alert ? 'Alert text' : null,
              leading: leading
                  ? const funds.Avatar(
                      name: 'Avatar',
                      size: funds.AvatarSize.large,
                      backgroundColor: funds.FunDsColors.colorNeutral200,
                    )
                  : null,
              label: label
                  ? const funds.Label(
                      'Label',
                      color: funds.LabelColor.purple,
                    )
                  : null,
              onTap: onTileClicked,
            ),
            funds.FunDsListTile.checkbox(
              title: 'List Title Checkbox',
              badge: badge
                  ? const funds.Badge(
                      label: 'Badge',
                      badgeStatus: funds.BadgeStatus.light,
                    )
                  : null,
              subtitle: subtitle ? 'Supporting text' : null,
              alertText: alert ? 'Alert text' : null,
              leading: leading
                  ? const funds.Avatar(
                      name: 'Avatar',
                      size: funds.AvatarSize.large,
                      backgroundColor: funds.FunDsColors.colorNeutral200,
                    )
                  : null,
              label: label
                  ? const funds.Label(
                      'Label',
                      color: funds.LabelColor.purple,
                    )
                  : null,
              value: false,
              onCheckedChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Checked Clicked'),
                  ),
                );
              },
              onTap: onTileClicked,
            ),
            funds.FunDsListTile.radio(
              title: 'List Title Radio',
              badge: badge
                  ? const funds.Badge(
                      label: 'Badge',
                      badgeStatus: funds.BadgeStatus.light,
                    )
                  : null,
              subtitle: subtitle ? 'Supporting text' : null,
              alertText: alert ? 'Alert text' : null,
              leading: leading
                  ? const funds.Avatar(
                      name: 'Avatar',
                      size: funds.AvatarSize.large,
                      backgroundColor: funds.FunDsColors.colorNeutral200,
                    )
                  : null,
              label: label
                  ? const funds.Label(
                      'Label',
                      color: funds.LabelColor.purple,
                    )
                  : null,
              value: 1,
              selectedValue: 1,
              onRadioChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Radio Clicked'),
                  ),
                );
              },
              onTap: onTileClicked,
            ),
            funds.FunDsListTile.label(
              title: 'List Title Label',
              badge: badge
                  ? const funds.Badge(
                      label: 'Badge',
                      badgeStatus: funds.BadgeStatus.light,
                    )
                  : null,
              subtitle: subtitle ? 'Supporting text' : null,
              alertText: alert ? 'Alert text' : null,
              leading: leading
                  ? const funds.Avatar(
                      name: 'Avatar',
                      size: funds.AvatarSize.large,
                      backgroundColor: funds.FunDsColors.colorNeutral200,
                    )
                  : null,
              subTitlelabel: label
                  ? const funds.Label(
                      'Label',
                      color: funds.LabelColor.purple,
                    )
                  : null,
              label: const funds.Label(
                'Label',
                color: funds.LabelColor.orange,
              ),
              onTap: onTileClicked,
            ),
            funds.FunDsListTile.button(
              title: 'List Title Button',
              badge: badge
                  ? const funds.Badge(
                      label: 'Badge',
                      badgeStatus: funds.BadgeStatus.light,
                    )
                  : null,
              subtitle: subtitle ? 'Supporting text' : null,
              alertText: alert ? 'Alert text' : null,
              leading: leading
                  ? const funds.Avatar(
                      name: 'Avatar',
                      size: funds.AvatarSize.large,
                      backgroundColor: funds.FunDsColors.colorNeutral200,
                    )
                  : null,
              label: label
                  ? const funds.Label(
                      'Label',
                      color: funds.LabelColor.purple,
                    )
                  : null,
              button: funds.FunDsButton(
                text: 'Button',
                type: funds.FunDsButtonType.xSmall,
                variant: funds.FunDsButtonVariant.primary,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Button Clicked'),
                    ),
                  );
                },
              ),
              onTap: onTileClicked,
            ),
          ],
        ),
      ),
    );
  }
}
