import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

class GroupAvatar extends StatelessWidget {
  const GroupAvatar({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.maxLength = 4,
  }) : super(key: key);

  /// The length of the list of avatars.
  final int itemCount;

  /// The number of avatars to display.
  final int maxLength;

  /// The builder for the avatars.
  final IndexedWidgetBuilder itemBuilder;

  /// The ratio of the offset of the last avatar.
  final double offsetRatio = 0.8;

  final maxCount = 9;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    Avatar? avatar;
    for (int i = 0; i <= maxLength; i++) {
      avatar = itemBuilder(context, i) as Avatar;

      /// Count the number of avatars that are not displayed.
      if (i == maxLength) {
        Widget totalCount = Container(
            constraints: BoxConstraints(
              minHeight: avatar.size.value,
              minWidth: avatar.size.value,
              maxWidth: avatar.size.value,
              maxHeight: avatar.size.value,
            ),
            decoration: BoxDecoration(
              color: FunDsColors.colorNeutral200,
              shape: avatar.shape == AvatarShape.round
                  ? BoxShape.circle
                  : BoxShape.rectangle,
              border: avatar.border,
              borderRadius: avatar.shape == AvatarShape.rectangle
                  ? BorderRadius.circular(8)
                  : null,
            ),
            child: Center(
              child: Text(
                '+${(itemCount - maxLength > maxCount) ? maxCount : itemCount - maxLength}',
                style: avatar.textStyle.copyWith(
                  color: FunDsColors.colorNeutral900,
                ),
              ),
            ));
        children.add(
          Positioned(
            left: i * avatar.size.value * offsetRatio,
            child: totalCount,
          ),
        );
      } else {
        children.add(
          Positioned(
            left: i * avatar.size.value * offsetRatio,
            child: avatar,
          ),
        );
      }
    }
    return SizedBox(
      height: avatar?.size.value,
      child: Stack(
        children: children,
      ),
    );
  }
}
