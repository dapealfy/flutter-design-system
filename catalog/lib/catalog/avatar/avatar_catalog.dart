import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleAvatarCatalog extends StatelessWidget {
  const SingleAvatarCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Single Avatar (size: xxl, xl, large, medium, small, xs, xxs)',
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          children: [
            _buildTextAvatar(),
            _buildImageAvatar(),
            _buildIconAvatar(),
          ],
        ),
      ),
    );
  }

  _buildTextAvatar() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
          child: Text('Text Avatar', style: FunDsTypography.heading16),
        ),
        SizedBox(
          height: 100.h,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xxl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.large,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.medium,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.small,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xxs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xxl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.large,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.medium,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.small,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                initialText: 'AF',
                size: FunDsAvatarSize.xxs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildImageAvatar() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
          child: Text('Image Avatar', style: FunDsTypography.heading16),
        ),
        const SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xxl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.large,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.medium,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.small,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xxs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xxl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.large,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.medium,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.small,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
              FunDsAvatar(
                backgroundImage: AssetImage(
                    'packages/flutter_design_system/assets/images/user_1.jpeg'),
                size: FunDsAvatarSize.xxs,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.rectangle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildIconAvatar() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
          child: Text('Icon Avatar', style: FunDsTypography.heading16),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FunDsAvatar(
                size: FunDsAvatarSize.xxl,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.round,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.xl,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.round,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.large,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.round,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.medium,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.round,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.small,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.round,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.xs,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.round,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.xxs,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.round,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FunDsAvatar(
                size: FunDsAvatarSize.xxl,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.rectangle,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.xl,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.rectangle,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.large,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.rectangle,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.medium,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.rectangle,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.small,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.rectangle,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.xs,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.rectangle,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
              FunDsAvatar(
                size: FunDsAvatarSize.xxs,
                backgroundColor: FunDsColors.colorNeutral200,
                shape: FunDsAvatarShape.rectangle,
                child: SvgPicture.asset(
                  FunDsIconography.iconAvatar,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
