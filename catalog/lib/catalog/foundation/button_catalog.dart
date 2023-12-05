import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCatalog extends StatelessWidget {
  const ButtonCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    const List<FunDsButtonVariant> buttonVariant = [
      FunDsButtonVariant.primary,
      FunDsButtonVariant.secondary,
      FunDsButtonVariant.tertiary,
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

    return CatalogPage(
      title: 'Button',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buttonVariant.map((variant){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h,top: 20.h),
                  child: Text('~~${variant.name.toUpperCase()}', style: FunDsTypography.heading24),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buttonType.map((typeButton){
                    return FunDsButton(
                      onPressed: (){},
                      type: typeButton,
                      variant: variant,
                      text: 'Button ${typeButton.name}',
                    );
                  }).toList(),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
