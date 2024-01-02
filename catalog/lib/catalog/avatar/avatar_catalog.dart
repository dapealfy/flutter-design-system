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
    List<Widget> listTextAvatarRoundWidget =
        FunDsAvatarSize.getAllFunDsAvatarSize().map((size) {
      return FunDsAvatar(
        initialText: 'AF',
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.round,
      );
    }).toList();

    List<Widget> listTextAvatarRectangleWidget =
        FunDsAvatarSize.getAllFunDsAvatarSize().map((size) {
      return FunDsAvatar(
        initialText: 'AF',
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

  _buildImageAvatar() {
    List<Widget> listImageAvatarRoundWidget =
        FunDsAvatarSize.getAllFunDsAvatarSize().map((size) {
      return FunDsAvatar(
        backgroundImage: const AssetImage(
            'packages/flutter_design_system/assets/images/user_1.jpeg'),
        size: size,
        backgroundColor: FunDsColors.colorPrimary100,
        foregroundColor: FunDsColors.colorPrimary500,
        shape: FunDsAvatarShape.round,
      );
    }).toList();

    List<Widget> listImageAvatarRectangleWidget =
    FunDsAvatarSize.getAllFunDsAvatarSize().map((size) {
      return FunDsAvatar(
        backgroundImage: const AssetImage(
            'packages/flutter_design_system/assets/images/user_1.jpeg'),
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
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listImageAvatarRoundWidget,
          ),
        ), SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listImageAvatarRectangleWidget,
          ),
        ),
      ],
    );
  }

  _buildIconAvatar() {

    List<Widget> listIconAvatarRoundWidget =
    FunDsAvatarSize.getAllFunDsAvatarSize().map((size) {
      return FunDsAvatar(
        size: size,
        backgroundColor: FunDsColors.colorNeutral200,
        shape: FunDsAvatarShape.round,
        child: SvgPicture.asset(
          FunDsIconography.iconAvatar,
        ),
      );
    }).toList();

    List<Widget> listIconAvatarRectangleWidget =
    FunDsAvatarSize.getAllFunDsAvatarSize().map((size) {
      return FunDsAvatar(
        size: size,
        backgroundColor: FunDsColors.colorNeutral200,
        shape: FunDsAvatarShape.rectangle,
        child: SvgPicture.asset(
          FunDsIconography.iconAvatar,
        ),
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
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listIconAvatarRoundWidget,
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: listIconAvatarRectangleWidget,
          ),
        ),
      ],
    );
  }
}
