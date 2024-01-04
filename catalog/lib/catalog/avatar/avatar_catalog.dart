import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleAvatarCatalog extends StatelessWidget {
  const SingleAvatarCatalog({super.key});

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
            _buildImageAvatar(),
          ],
        ),
      ),
    );
  }

  _buildTextAvatar() {
    List<Widget> listTextAvatarRoundWidget =
        AvatarSizeExtension.getAllAvatarSize().map((size) {
      return Avatar.text(
        avatarText: 'Amartha Microfinance',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: AvatarShape.round,
      );
    }).toList();

    List<Widget> listTextAvatarRectangleWidget =
        AvatarSizeExtension.getAllAvatarSize().map((size) {
      return Avatar.text(
        avatarText: 'Amartha',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: AvatarShape.rectangle,
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

  _buildImageAvatar() {
    List<Widget> listImageAvatarRoundWidget =
        AvatarSizeExtension.getAllAvatarSize().map((size) {
      return Avatar.asset(
        imagePath: 'packages/flutter_design_system/assets/images/user_1.jpeg',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: AvatarShape.round,
      );
    }).toList();

    List<Widget> listImageNetworkAvatarRoundWidget =
        AvatarSizeExtension.getAllAvatarSize().map((size) {
      return Avatar.network(
        imageUrl: 'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: AvatarShape.round,
      );
    }).toList();

    List<Widget> listImageAvatarRectangleWidget =
        AvatarSizeExtension.getAllAvatarSize().map((size) {
      return Avatar(
        imagePath: 'packages/flutter_design_system/assets/images/user_1.jpeg',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: AvatarShape.rectangle,
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
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listImageAvatarRoundWidget,
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listImageNetworkAvatarRoundWidget,
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
