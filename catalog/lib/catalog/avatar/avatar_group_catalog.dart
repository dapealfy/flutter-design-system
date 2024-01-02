import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupAvatarCatalog extends StatelessWidget {
  const GroupAvatarCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Group Avatar (size: xxl, xl, large, medium, small, xs, xxs)',
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
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
          child: Text('Text Avatar', style: FunDsTypography.heading16),
        ),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xxl,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xl,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.large,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.medium,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.small,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xs,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              initialText: 'AF',
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xxs,
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
          padding: const EdgeInsets.fromLTRB(8, 24, 0, 8),
          child: Text('Image Avatar', style: FunDsTypography.heading16),
        ),
        const FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xxl,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xl,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.large,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.medium,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.small,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xs,
        ),
        const SizedBox(height: 16),
        const FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
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
            FunDsAvatar(
              backgroundImage: AssetImage(
                  'packages/flutter_design_system/assets/images/user_1.jpeg'),
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
            ),
          ],
          size: FunDsAvatarSize.xxs,
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
          padding: const EdgeInsets.fromLTRB(8, 24, 0, 8),
          child: Text('Icon Avatar', style: FunDsTypography.heading16),
        ),
        FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
            ),
          ],
          size: FunDsAvatarSize.xxl,
        ),
        const SizedBox(height: 16),
        FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
            ),
          ],
          size: FunDsAvatarSize.xl,
        ),
        const SizedBox(height: 16),
        FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
            ),
          ],
          size: FunDsAvatarSize.large,
        ),
        const SizedBox(height: 16),
        FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
            ),
          ],
          size: FunDsAvatarSize.medium,
        ),
        const SizedBox(height: 16),
        FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
            ),
          ],
          size: FunDsAvatarSize.small,
        ),
        const SizedBox(height: 16),
        FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
            ),
          ],
          size: FunDsAvatarSize.xs,
        ),
        const SizedBox(height: 16),
        FunDsGroupAvatar(
          listAvatar: [
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
            FunDsAvatar(
              size: FunDsAvatarSize.xxs,
              backgroundColor: FunDsColors.colorNeutral200,
              shape: FunDsAvatarShape.round,
              child: SvgPicture.asset(
                FunDsIconography.iconAvatar,
              ),
            ),
          ],
          size: FunDsAvatarSize.xxs,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
