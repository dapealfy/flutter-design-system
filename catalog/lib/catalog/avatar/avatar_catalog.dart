import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleAvatarCatalog extends StatelessWidget {
  const SingleAvatarCatalog({super.key});

/*
  /// Create Avatar with text.
  const Avatar.text({
    Key? key,
    required String avatarText,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) : this(
    key: key,
    avatarText: avatarText,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    size: size,
    shape: shape,
    border: border,
  );

  /// Create Avatar with image from network.
  const Avatar.network({
    Key? key,
    required String imageUrl,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) : this(
    key: key,
    imageUrl: imageUrl,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    size: size,
    shape: shape,
    border: border,
  );

  ///Create Avatar with image from asset.
  const Avatar.asset({
    Key? key,
    required String imagePath,
    Color? backgroundColor,
    Color? foregroundColor,
    AvatarSize size = AvatarSize.medium,
    AvatarShape shape = AvatarShape.round,
    BoxBorder? border,
  }) : this(
    key: key,
    imagePath: imagePath,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    size: size,
    shape: shape,
    border: border,
  );
 */

  @override
  Widget build(BuildContext context) {
    return CatalogPage(
      title: 'Single Avatar (size: xxs, xs, small, medium, large, xl, xxl)',
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          children: [
            _buildTextAvatar(),
            _buildIconAvatar(),
            _buildImageAvatar(),
          ],
        ),
      ),
    );
  }

  _buildTextAvatar() {
    List<Widget> listTextAvatarRoundWidget =
        FunDsAvatarSizeExtension.getAllAvatarSize().map((size) {
      return FunDsAvatar.network(
        imageUrl: '',
        name: 'Amartha Microfinance',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.round,
      );
    }).toList();

    List<Widget> listTextAvatarRectangleWidget =
        FunDsAvatarSizeExtension.getAllAvatarSize().map((size) {
      return FunDsAvatar.network(
        imageUrl: '',
        name: 'Amartha Microfinance',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.rectangle,
      );
    }).toList();

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listTextAvatarRoundWidget,
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listTextAvatarRectangleWidget,
          ),
        ),
      ],
    );
  }

  _buildIconAvatar() {
    List<Widget> listFailedImageNetworkAvatarRoundWidget =
        FunDsAvatarSizeExtension.getAllAvatarSize().map((size) {
      return FunDsAvatar.network(
        imageUrl: 'http://error',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.round,
      );
    }).toList();

    List<Widget> listFailedImageNetworkAvatarRoundRectangle =
        FunDsAvatarSizeExtension.getAllAvatarSize().map((size) {
      return FunDsAvatar.network(
        imageUrl: 'http://error',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.rectangle,
      );
    }).toList();

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
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listFailedImageNetworkAvatarRoundWidget,
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listFailedImageNetworkAvatarRoundRectangle,
          ),
        ),
      ],
    );
  }

  _buildImageAvatar() {
    List<Widget> listImageAvatarRoundWidget =
        FunDsAvatarSizeExtension.getAllAvatarSize().map((size) {
      return FunDsAvatar.asset(
        imagePath: 'packages/flutter_design_system/assets/images/user_1.jpeg',
        name: 'Amartha Microfinance',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.round,
      );
    }).toList();

    List<Widget> listImageAvatarRectangleWidget =
        FunDsAvatarSizeExtension.getAllAvatarSize().map((size) {
      return FunDsAvatar(
        imagePath: 'packages/flutter_design_system/assets/images/user_1.jpeg',
        name: 'Amartha Microfinance',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.rectangle,
      );
    }).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
          child: Text('Image Avatar', style: FunDsTypography.heading16),
        ),
        SizedBox(
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listImageAvatarRoundWidget,
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listImageAvatarRectangleWidget,
          ),
        ),
      ],
    );
  }
}
