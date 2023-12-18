import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class GroupButtonCatalog extends StatelessWidget {
  const GroupButtonCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final toogleKnob = context.knobs.boolean(
      label: 'Is Enable Button',
      description: 'Enable/Disable button by this knobs',
      initial: true,
    );

    List<FunDsButton> listButton = [
      FunDsButton(
        onPressed: () {},
        enabled: toogleKnob,
        type: FunDsButtonType.xLarge,
        variant: FunDsButtonVariant.primary,
        text: 'Button Primary',
      ),
      FunDsButton(
        onPressed: () {},
        enabled: toogleKnob,
        type: FunDsButtonType.xLarge,
        variant: FunDsButtonVariant.tertiary,
        text: 'Button Secondary',
      ),
      FunDsButton(
        onPressed: () {},
        enabled: toogleKnob,
        type: FunDsButtonType.xLarge,
        variant: FunDsButtonVariant.destructive,
        text: 'Button Destructive',
      ),
    ];
    return CatalogPage(
      title: 'Group Button',
      description: 'Widget name: FunDsGroupButton',
      child: Column(
        children: [
          Text('~~Vertical', style: FunDsTypography.heading24),
          FunDsGroupButton(
            key: Key('Vertical Group Button'),
            variant: FunDsGroupButtonVariant.vertical,
            listButton: listButton,
          ),
          SizedBox(height: 12.h),
          Text('~~Combo', style: FunDsTypography.heading24),
          FunDsGroupButton(
            key: Key('Combo Group Button'),
            variant: FunDsGroupButtonVariant.combo,
            listButton: listButton,
            childCombo: const Text(
              'Ini Bisa diisi Widget Apapaun',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 12.h),
          Text('~~Horizontal', style: FunDsTypography.heading24),
          FunDsGroupButton(
            key: Key('Horizontal Group Button'),
            variant: FunDsGroupButtonVariant.horizontal,
            listButton: listButton,
          ),
        ],
      ),
    );
  }
}
