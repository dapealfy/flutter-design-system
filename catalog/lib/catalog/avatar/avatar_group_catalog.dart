import 'package:catalog/core/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class GroupAvatarCatalog extends StatelessWidget {
  const GroupAvatarCatalog({super.key});

  /*
  /// Create Avatar Group.
        GroupAvatar(
          maxLength: 4,
          itemCount: listAvatar.length,
          itemBuilder: (context, index) {
            return Avatar.asset(
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
          },
        ),
   */

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
        FunDsGroupAvatar(
          itemCount: listName.length,
          itemBuilder: (context, index) {
            /// Simulate If index 2 don't have image then use text avatar
            if (index == 2) {
              return FunDsAvatar.network(
                imageUrl: '',
                name: listName[index],
                size: FunDsAvatarSize.xxl,
                backgroundColor: FunDsColors.colorPrimary100,
                foregroundColor: FunDsColors.colorPrimary500,
                shape: FunDsAvatarShape.round,
                border: Border.all(
                  color: FunDsColors.colorWhite,
                  width: 2,
                ),
              );
            }

            return FunDsAvatar.network(
              imageUrl: 'https://i.pravatar.cc/150?img=${index + 1}',
              name: listName[index],
              size: FunDsAvatarSize.xxl,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
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
      'assets/images/user_2.jpeg',
      'assets/images/user_3.jpeg',
      'assets/images/user_4.jpeg',
      'assets/images/user_5.jpeg',
      'assets/images/user_1.jpeg',
      'assets/images/user_2.jpeg',
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
        FunDsGroupAvatar(
          maxLength: 4,
          itemCount: listAvatar.length,
          itemBuilder: (context, index) {
            return FunDsAvatar.asset(
              imagePath: listAvatar[index],
              size: FunDsAvatarSize.xxl,
              backgroundColor: FunDsColors.colorPrimary100,
              foregroundColor: FunDsColors.colorPrimary500,
              shape: FunDsAvatarShape.round,
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
}
