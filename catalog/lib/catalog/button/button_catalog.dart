import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ButtonCatalog extends StatelessWidget {
  const ButtonCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    const List<FunDsButtonVariant> buttonVariants = [
      FunDsButtonVariant.primary,
      FunDsButtonVariant.secondary,
      FunDsButtonVariant.tertiary,
      FunDsButtonVariant.ghost,
      FunDsButtonVariant.destructive,
      FunDsButtonVariant.destructiveOutline,
    ];
    const List<FunDsButtonType> buttonTypes = [
      FunDsButtonType.xSmall,
      FunDsButtonType.small,
      FunDsButtonType.medium,
      FunDsButtonType.large,
      FunDsButtonType.xLarge,
    ];

    final knobEnabled = context.knobs.boolean(
      label: 'Is Enable Button',
      description: 'Enable/Disable button by this knobs',
      initial: true,
    );

    final knobText = context.knobs.text(
      label: 'Button Text',
      initial: '',
    );

    final knobLeftIcon = context.knobs.options<Widget?>(
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buttonTypes.map((type) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ColoredBox(
                      color: FunDsColors.colorPrimaryLight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          type.name,
                          style: FunDsTypography.heading16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buttonVariants.map(
                          (variant) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: FunDsButton(
                                key: Key('$variant ${type.name}'),
                                onPressed: () {},
                                type: type,
                                enabled: knobEnabled,
                                variant: variant,
                                leftIcon: knobLeftIcon,
                                text: knobText.isNotEmpty
                                    ? knobText
                                    : variant.name,
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
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
