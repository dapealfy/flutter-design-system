import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class FunDsGroupAvatar extends StatelessWidget {
  const FunDsGroupAvatar({
    Key? key,
    this.listAvatar = const [],
    this.size = FunDsAvatarSize.medium,
  }) : super(key: key);

  final List<FunDsAvatar> listAvatar;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: size,
        minHeight: size,
        maxHeight: size,
        maxWidth: size,
      ),
      child: Stack(
        children: [
          for (int index = 0; index < listAvatar.length; index++)
            if (index >= 4)
              Positioned(
                left: 4 * size * 0.8, // Position the summary count
                child: FunDsAvatar(
                  child: Text(
                    '+${(listAvatar.length - 4 > 9) ? 9 : listAvatar.length - 4}',
                  ),
                  size: size,
                  backgroundColor: FunDsColors.colorNeutral200,
                  foregroundColor: FunDsColors.colorNeutral900,
                  border: Border.all(
                    color: FunDsColors.colorWhite,
                    width: 2,
                  ),
                ),
              )
            else
              (listAvatar[index].initialText != null)
                  ? Positioned(
                      left: index * size * 0.8,
                      child: FunDsAvatar(
                        size: size,
                        initialText: listAvatar[index].initialText,
                        backgroundColor: listAvatar[index].backgroundColor,
                        foregroundColor: listAvatar[index].foregroundColor,
                        shape: FunDsAvatarShape.round,
                        border: Border.all(
                          color: FunDsColors.colorWhite,
                          width: 2,
                        ),
                      ),
                    )
                  : Positioned(
                      left: index * size * 0.8,
                      child: listAvatar[index].copyWith(
                        size: size,
                        border: Border.all(
                          color: FunDsColors.colorWhite,
                          width: 2,
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
