import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsCheckbox extends StatefulWidget {
  const FunDsCheckbox({
    super.key,
    this.label,
    this.desc,
    this.defaultValue = false,
    required this.variant,
    required this.onChanged,
  });

  final String? label;
  final String? desc;
  final bool defaultValue;
  final FunDsCheckboxVariant variant;
  final Function(bool) onChanged;

  @override
  State<FunDsCheckbox> createState() => _FunDsCheckboxState();
}

class _FunDsCheckboxState extends State<FunDsCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: widget.key,
      highlightColor: widget.variant == FunDsCheckboxVariant.disabled
          ? Colors.transparent
          : FunDsColors.colorNeutral200,
      splashColor: widget.variant == FunDsCheckboxVariant.disabled
          ? Colors.transparent
          : FunDsColors.colorNeutral200,
      onTap: () {
        widget.variant == FunDsCheckboxVariant.disabled
            ? null
            : setState(() {
                isChecked = !isChecked;
                widget.onChanged(isChecked);
              });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 20.h,
                    height: 20.h,
                    decoration: BoxDecoration(
                      border: widget.variant == FunDsCheckboxVariant.tertiary
                          ? Border.all(
                              color: FunDsColors.colorPrimary200,
                              width: 2.0,
                              style: BorderStyle.solid,
                            )
                          : null,
                      borderRadius:
                          widget.variant == FunDsCheckboxVariant.tertiary
                              ? BorderRadius.circular(5.r)
                              : null,
                    ),
                    child: Padding(
                      padding: widget.variant == FunDsCheckboxVariant.tertiary
                          ? EdgeInsets.symmetric(horizontal: 1.h)
                          : const EdgeInsets.only(),
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            width: isChecked ? 0.r : 1.5,
                            color: getBorderColor(),
                          ),
                        ),
                        onChanged: (value) {
                          widget.variant == FunDsCheckboxVariant.disabled
                              ? null
                              : setState(() {
                                  isChecked = value!;
                                  widget.onChanged(value);
                                });
                        },
                        value: isChecked,
                        activeColor: getActiveColor(),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 9,
                  child: Visibility(
                    visible: widget.label != null,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text(
                        widget.label ?? '',
                        style: FunDsTypography.body14.copyWith(
                          color: widget.variant == FunDsCheckboxVariant.disabled
                              ? FunDsColors.colorNeutral500
                              : FunDsColors.colorNeutral900,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Text(
                widget.desc ?? '',
                style: FunDsTypography.body14.copyWith(
                  color: widget.variant == FunDsCheckboxVariant.disabled
                      ? FunDsColors.colorNeutral500
                      : FunDsColors.colorNeutral600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getBorderColor() {
    switch (widget.variant) {
      case FunDsCheckboxVariant.primary:
        if(isChecked){
          return FunDsColors.colorPrimary;
        }
        return FunDsColors.colorNeutral900;
      case FunDsCheckboxVariant.tertiary:
        return FunDsColors.colorNeutral900;
      case FunDsCheckboxVariant.alert:
        return FunDsColors.colorRed500;
      case FunDsCheckboxVariant.disabled:
        return FunDsColors.colorNeutral500;
      case FunDsCheckboxVariant.secondary:
        return FunDsColors.colorPrimary;
    }
  }

  Color getActiveColor() {
    switch (widget.variant) {
      case FunDsCheckboxVariant.primary:
        return FunDsColors.colorPrimary;
      case FunDsCheckboxVariant.tertiary:
        return FunDsColors.colorPrimary;
      case FunDsCheckboxVariant.alert:
        return FunDsColors.colorRed500;
      case FunDsCheckboxVariant.disabled:
        return FunDsColors.colorNeutral500;
      case FunDsCheckboxVariant.secondary:
        return FunDsColors.colorPrimary;
    }
  }
}

enum FunDsCheckboxVariant { primary, secondary, tertiary, alert, disabled }
