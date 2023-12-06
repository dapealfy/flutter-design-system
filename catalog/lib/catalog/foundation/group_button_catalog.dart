import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupButtonCatalog extends StatelessWidget {
  const GroupButtonCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    List<FunDsButton> listButton = [
      FunDsButton(
        onPressed: () {},
        type: FunDsButtonType.xLarge,
        variant: FunDsButtonVariant.primary,
        text: 'Button Primary',
      ),
      FunDsButton(
        onPressed: () {},
        type: FunDsButtonType.medium,
        variant: FunDsButtonVariant.secondary,
        text: 'Button Secondary',
      ),
      FunDsButton(
        onPressed: () {},
        type: FunDsButtonType.medium,
        variant: FunDsButtonVariant.secondary,
        text: 'Button Secondary',
      ),
      FunDsButton(
        onPressed: () {},
        type: FunDsButtonType.medium,
        variant: FunDsButtonVariant.secondary,
        text: 'Button Secondary',
      ),
      FunDsButton(
        onPressed: () {},
        type: FunDsButtonType.xLarge,
        variant: FunDsButtonVariant.tertiary,
        text: 'Button Tertiary',
      )
    ];
    return CatalogPage(
      title: 'Group Button',
      child: Column(
        children: [
          Text('~~Vertical', style: FunDsTypography.heading24),
          FunDsGroupButton(
            variant: FunDsGroupButtonVariant.vertical,
            listButton: listButton,
          ),
          SizedBox(height: 12.h),
          Text('~~Combo', style: FunDsTypography.heading24),
          FunDsGroupButton(
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
            variant: FunDsGroupButtonVariant.horizontal,
            listButton: listButton,
          ),
        ],
      ),
    );
  }
}
