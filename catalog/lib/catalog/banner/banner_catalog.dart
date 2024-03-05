import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class BannerCatalog extends StatelessWidget {
  const BannerCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    var showCloseButton = context.knobs.boolean(
      label: 'Show Close Button',
      initial: true,
    );

    var showButton = context.knobs.boolean(
      label: 'Show  Button',
      initial: true,
    );

    return CatalogPage(
      title: 'Banner',
      description: 'Widget name: FunDsBanner',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('Banner General V1 - Normal',
                  style: FunDsTypography.heading16),
            ),
            FunDsBanner.general(
              title: 'This is title',
              description:
                  'This is just an example of a description that is 2 lines long',
              version: FunDsBannerVersion.v1,
              type: FunDsBannerType.normal,
              button: showButton
                  ? FunDsButton(
                      type: FunDsButtonType.xSmall,
                      variant: FunDsButtonVariant.ghost,
                      onPressed: () {},
                      text: 'Button',
                    )
                  : null,
              showCloseButton: showCloseButton,
              leftIcon: Icon(
                Icons.check_circle,
                color: FunDsColors.colorPrimary,
                size: 20.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('Banner General V1 - Highlight',
                  style: FunDsTypography.heading16),
            ),
            FunDsBanner.general(
              title: 'This is title',
              description:
                  'This is just an example of a description that is 2 lines long',
              version: FunDsBannerVersion.v1,
              type: FunDsBannerType.highlight,
              showCloseButton: showCloseButton,
              button: showButton
                  ? FunDsButton(
                      type: FunDsButtonType.xSmall,
                      variant: FunDsButtonVariant.ghost,
                      onPressed: () {},
                      text: 'Button',
                    )
                  : null,
              leftIcon: Icon(
                Icons.check_circle,
                color: FunDsColors.colorPrimary,
                size: 20.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('Banner General V2 - Normal',
                  style: FunDsTypography.heading16),
            ),
            FunDsBanner.general(
              title: 'This is title',
              description:
                  'This is just an example of a description that is 2 lines long',
              version: FunDsBannerVersion.v2,
              type: FunDsBannerType.normal,
              showCloseButton: showCloseButton,
              button: showButton
                  ? FunDsButton(
                      type: FunDsButtonType.xSmall,
                      variant: FunDsButtonVariant.primary,
                      onPressed: () {},
                      text: 'Button',
                    )
                  : null,
              leftIcon: Container(
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  color: FunDsColors.colorPrimaryLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: FunDsColors.colorPrimary,
                  size: 20.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('Banner General V2 - Highlight',
                  style: FunDsTypography.heading16),
            ),
            FunDsBanner.general(
              title: 'This is title',
              description:
                  'This is just an example of a description that is 2 lines long',
              version: FunDsBannerVersion.v2,
              type: FunDsBannerType.highlight,
              showCloseButton: showCloseButton,
              button: showButton
                  ? FunDsButton(
                      type: FunDsButtonType.xSmall,
                      variant: FunDsButtonVariant.primary,
                      onPressed: () {},
                      text: 'Button',
                    )
                  : null,
              leftIcon: Container(
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  color: FunDsColors.colorPrimaryLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: FunDsColors.colorPrimary,
                  size: 20.sp,
                ),
              ),
            ),
            Divider(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('Banner Sticky V1', style: FunDsTypography.heading16),
            ),
            FunDsBanner.sticky(
              text: 'Insert body text to explain the purpose',
              showCloseButton: showCloseButton,
              button: showButton
                  ? const FunDsButton(
                      type: FunDsButtonType.xSmall,
                      variant: FunDsButtonVariant.secondary,
                      text: 'Button',
                    )
                  : null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('Banner Sticky V2', style: FunDsTypography.heading16),
            ),
            FunDsBanner.sticky(
              text: 'Insert body text to explain the purpose',
              version: FunDsBannerVersion.v2,
              showCloseButton: showCloseButton,
              button: showButton
                  ? const FunDsButton(
                      type: FunDsButtonType.xSmall,
                      variant: FunDsButtonVariant.tertiary,
                      text: 'Button',
                    )
                  : null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text('Banner Marketing', style: FunDsTypography.heading16),
            ),
            FunDsBanner.marketing(
              title: 'Title here, max 1 lines',
              description:
                  'This is just an example of a description that is 2 lines long',
              image: Image.asset(
                'assets/images/user_1.jpeg',
                fit: BoxFit.cover,
              ),
              button: showButton
                  ? const FunDsButton(
                      type: FunDsButtonType.xSmall,
                      variant: FunDsButtonVariant.secondary,
                      text: 'Button',
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
