import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

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
          ],
        ),
      ),
    );
  }

  ListView _buildTextAvatar() {
    List<String> listName = [
      'Anton Budi Citorus',
      'Budi Citorus',
      'Citorus',
      'Dedi',
      'Eko',
      'Fajar',
      'Gita',
      'Hari',
      'Iwan',
      'Joko',
      'Kurnia',
      'Lina',
      'Mega',
      'Nina',
      'Oscar',
      'Purnama',
      'Qiqi',
      'Rahmat',
      'Sari',
      'Tono',
    ];

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
          child: Text('Text Avatar', style: FunDsTypography.heading16),
        ),
        GroupAvatar(
          itemCount: listName.length,
          itemBuilder: (context, index) {
            return Avatar(
              avatarText: listName[index],
              size: AvatarSize.xxl,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: AvatarShape.round,
              border: Border.all(
                color: FunDsColors.colorWhite,
                width: 2,
              ),
            );
          },
        ),
      ],
    );
  }

  ListView _buildImageAvatar() {
    List<String> listAvatar = [
      'packages/flutter_design_system/assets/images/user_1.jpeg',
      'packages/flutter_design_system/assets/images/user_2.jpeg',
      'packages/flutter_design_system/assets/images/user_3.jpeg',
      'packages/flutter_design_system/assets/images/user_4.jpeg',
      'packages/flutter_design_system/assets/images/user_5.jpeg',
      'packages/flutter_design_system/assets/images/user_1.jpeg',
      'packages/flutter_design_system/assets/images/user_2.jpeg',
    ];

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
          child: Text('Image Avatar', style: FunDsTypography.heading16),
        ),
        GroupAvatar(
          itemCount: listAvatar.length,
          itemBuilder: (context, index) {
            if (index >= 4) {
              return Avatar(
                avatarText:
                    '+${(listAvatar.length - 4 > 9) ? 9 : listAvatar.length - 4}',
                size: AvatarSize.xxl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: AvatarShape.round,
                border: Border.all(
                  color: FunDsColors.colorWhite,
                  width: 2,
                ),
              );
            } else {
              return Avatar(
                imagePath: listAvatar[index],
                size: AvatarSize.xxl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: AvatarShape.round,
                border: Border.all(
                  color: FunDsColors.colorWhite,
                  width: 2,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
