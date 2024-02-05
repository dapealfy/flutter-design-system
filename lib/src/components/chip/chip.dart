import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsChip extends StatelessWidget {
  final FunDsIcon? leading; //size will always replace to 20
  final FunDsIcon? trailing; //size will always replace to 20
  final FunDsChipType type;
  final String text;
  final Label? label; // label size will always replace to FunDsChipType
  final bool isActive;
  final bool enable;
  final VoidCallback? onPress;

  const FunDsChip({
    super.key,
    required this.type,
    required this.text,
    this.leading,
    this.trailing,
    this.label,
    this.isActive = false,
    this.enable = true,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onPress != null
          ? () {
              onPress!();
            }
          : null,
      child: Container(
        height: _chipHeight(),
        decoration: ShapeDecoration(
            color: enable
                ? isActive
                    ? FunDsColors.colorPrimary100
                    : FunDsColors.colorWhite
                : FunDsColors.colorNeutral50,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.w,
                color: enable
                    ? isActive
                        ? FunDsColors.colorPrimary
                        : FunDsColors.colorNeutral400
                    : FunDsColors.colorNeutral200,
              ),
              borderRadius: BorderRadius.circular(12.r),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: type == FunDsChipType.large ? 16.w : 12.w,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Visibility(
                visible: leading != null,
                child: Padding(
                  padding: EdgeInsets.only(right: _chipPadding()),
                  child: leading?.copyWith(size: 20.r),
                ),
              ),
              Text(
                text,
                style: (type == FunDsChipType.large
                        ? FunDsTypography.body16
                        : FunDsTypography.body14)
                    .copyWith(
                  color: enable
                      ? isActive
                          ? FunDsColors.colorPrimary
                          : FunDsColors.colorNeutral600
                      : FunDsColors.colorNeutral500,
                ),
              ),
              Visibility(
                visible: label != null,
                child: Padding(
                  padding: EdgeInsets.only(left: _chipPadding()),
                  child: label?.copyWith(
                    size: type == FunDsChipType.large
                        ? LabelSize.medium
                        : LabelSize.small,
                  ),
                ),
              ),
              Visibility(
                visible: trailing != null,
                child: Padding(
                  padding: EdgeInsets.only(left: _chipPadding()),
                  child: trailing?.copyWith(size: 20.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _chipPadding() {
    if (type == FunDsChipType.large) {
      return 8.w;
    }
    return 4.w;
  }

  double _chipHeight() {
    switch (type) {
      case FunDsChipType.small:
        return 32.h;
      case FunDsChipType.medium:
        return 40.h;
      case FunDsChipType.large:
        return 48.h;
    }
  }
}

enum FunDsChipType { small, medium, large }
