import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsChip extends StatefulWidget {
  final FunDsIcon? leading; //size will always replace to 20
  final FunDsIcon? trailing; //size will always replace to 20
  final FunDsChipType type;
  final String text;
  final Label? label;// label size will always replace to FunDsChipType
  final bool enable;
  final Function(bool)? onPress;

  const FunDsChip({
    super.key,
    required this.type,
    required this.text,
    this.leading,
    this.trailing,
    this.label,
    this.enable = true,
    this.onPress,
  });

  @override
  State<FunDsChip> createState() => _FunDsChipState();
}

class _FunDsChipState extends State<FunDsChip> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: widget.key,
      onTap: widget.onPress != null
          ? () {
              setState(() {
                isActive = !isActive;
              });
            }
          : null,
      child: Container(
        height: _chipHeight(),
        decoration: ShapeDecoration(
            color: widget.enable
                ? isActive
                    ? FunDsColors.colorPrimary100
                    : FunDsColors.colorWhite
                : FunDsColors.colorNeutral50,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.w,
                color: widget.enable
                    ? isActive
                        ? FunDsColors.colorPrimary
                        : FunDsColors.colorNeutral400
                    : FunDsColors.colorNeutral200,
              ),
              borderRadius: BorderRadius.circular(12.r),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.type == FunDsChipType.large ? 16.w : 12.w,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Visibility(
                visible: widget.leading != null,
                child: Padding(
                  padding: EdgeInsets.only(right: _chipPadding()),
                  child: widget.leading?.copyWith(size: 20.r),
                ),
              ),
              Text(
                widget.text,
                style: (widget.type == FunDsChipType.large
                        ? FunDsTypography.body16
                        : FunDsTypography.body14)
                    .copyWith(
                  color: widget.enable
                      ? isActive
                          ? FunDsColors.colorPrimary
                          : FunDsColors.colorNeutral600
                      : FunDsColors.colorNeutral500,
                ),
              ),
              Visibility(
                visible: widget.label != null,
                child: Padding(
                  padding: EdgeInsets.only(left: _chipPadding()),
                  child: widget.label?.copyWith(
                    size: widget.type == FunDsChipType.large
                        ? LabelSize.medium
                        : LabelSize.small,
                  ),
                ),
              ),
              Visibility(
                visible: widget.trailing != null,
                child: Padding(
                  padding: EdgeInsets.only(left: _chipPadding()),
                  child: widget.trailing?.copyWith(size: 20.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _chipPadding() {
    if (widget.type == FunDsChipType.large) {
      return 8.w;
    }
    return 4.w;
  }

  double _chipHeight() {
    switch (widget.type) {
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
