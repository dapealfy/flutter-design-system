import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsChip extends StatefulWidget {
  final Widget? leading;
  final Widget? trailing;
  final FunDsChipType type;
  final String text;
  final Widget? label;
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
            vertical: widget.type == FunDsChipType.large ? 12.w : 8.w,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Visibility(
                visible: widget.leading != null,
                child: Padding(
                  padding: EdgeInsets.only(right: _chipPadding()),
                  child: widget.leading,
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
                  child: widget.label,
                ),
              ),
              Visibility(
                visible: widget.trailing != null,
                child: Padding(
                  padding: EdgeInsets.only(left: _chipPadding()),
                  child: widget.trailing,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _chipPadding(){
    if(widget.type == FunDsChipType.large){
      return 8.h;
    }
    return 4.h;
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
