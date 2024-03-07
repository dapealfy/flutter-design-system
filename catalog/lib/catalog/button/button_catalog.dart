import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ButtonCatalog extends StatelessWidget {
  const ButtonCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    const List<FunDsButtonVariant> buttonVariant = [
      FunDsButtonVariant.primary,
      FunDsButtonVariant.secondary,
      FunDsButtonVariant.tertiary,
      FunDsButtonVariant.ghost,
      FunDsButtonVariant.destructive,
      FunDsButtonVariant.destructiveOutline,
    ];
    const List<FunDsButtonType> buttonType = [
      FunDsButtonType.xLarge,
      FunDsButtonType.large,
      FunDsButtonType.medium,
      FunDsButtonType.small,
      FunDsButtonType.xSmall,
    ];

    final toogleKnob = context.knobs.boolean(
      label: 'Is Enable Button',
      description: 'Enable/Disable button by this knobs',
      initial: true,
    );

    final buttonText = context.knobs.text(
      label: 'Button Text',
      initial: '',
    );

    final leftIcon = context.knobs.options<Widget?>(
      label: 'Left Icon',
      initial: null,
      options: [
        const Option(label: 'none', value: null),
        const Option(
          label: 'Icon',
          value: FunDsIcon(
            funDsIconography: FunDsIconography.actionIcRefresh,
            size: 24,
          ),
        ),
      ],
    );

    return CatalogPage(
      title: 'Button',
      description: 'Widget name: FunDsButton',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buttonVariant.map((variant) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h, top: 20.h),
                      child: Text('~~${variant.name.toUpperCase()}',
                          style: FunDsTypography.heading24),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: buttonType.map((typeButton) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: FunDsButton(
                            key: Key('$variant ${typeButton.name}'),
                            onPressed: () {},
                            type: typeButton,
                            enabled: toogleKnob,
                            variant: variant,
                            leftIcon: leftIcon,
                            text: 'Button ${typeButton.name}$buttonText',
                          ),
                        );
                      }).toList(),
                    )
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
