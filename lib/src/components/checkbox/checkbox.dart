import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsCheckbox extends StatelessWidget {
  const FunDsCheckbox({
    super.key,
    this.title,
    this.subtitle,
    this.checked = false,
    this.rightCheckbox = false,
    this.tristate = false,
    required this.variant,
    required this.onChanged,
  });

  final String? title;
  final String? subtitle;
  final bool? checked;
  final bool rightCheckbox;
  final bool tristate;
  final FunDsCheckboxVariant variant;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    if (subtitle == null && title == null) {
      return _getCheckBox();
    } else {
      return GestureDetector(
        onTap: () {
          final newChecked = switch (checked) {
            false => true,
            true => tristate ? null : false,
            _ => false,
          };
          onChanged(newChecked);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!rightCheckbox) ...[
              _getCheckBox(),
              SizedBox(width: 8.w),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title ?? '',
                      style: FunDsTypography.body14.copyWith(
                        color: variant == FunDsCheckboxVariant.disabled
                            ? FunDsColors.colorNeutral500
                            : FunDsColors.colorNeutral900,
                      ),
                    ),
                  if (subtitle != null)
                    Text(
                      subtitle ?? '',
                      style: FunDsTypography.body14.copyWith(
                        color: variant == FunDsCheckboxVariant.disabled
                            ? FunDsColors.colorNeutral500
                            : FunDsColors.colorNeutral600,
                      ),
                    ),
                ],
              ),
            ),
            if (rightCheckbox) ...[
              SizedBox(width: 8.w),
              _getCheckBox(),
            ],
          ],
        ),
      );
    }
  }

  Widget _getCheckBox() {
    return Container(
      width: 20.h,
      height: 20.h,
      decoration: BoxDecoration(
        border: variant == FunDsCheckboxVariant.tertiary
            ? Border.all(
                color: FunDsColors.colorPrimary200,
                width: 2.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: variant == FunDsCheckboxVariant.tertiary
            ? BorderRadius.circular(5.r)
            : null,
      ),
      child: Padding(
        padding: variant == FunDsCheckboxVariant.tertiary
            ? EdgeInsets.symmetric(horizontal: 1.h)
            : const EdgeInsets.only(),
        child: Checkbox(
          tristate: tristate,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
              width: (checked ?? false) ? 0.r : 1.5,
              color: _getBorderColor(),
            ),
          ),
          onChanged: (bool? value) {
            if (variant == FunDsCheckboxVariant.disabled) {
              return;
            }

            onChanged(value);
          },
          value: tristate == true ? checked : (checked ?? false),
          activeColor: _getActiveColor(),
        ),
      ),
    );
  }

  Color _getBorderColor() {
    switch (variant) {
      case FunDsCheckboxVariant.primary:
        if (checked ?? false) {
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

  Color _getActiveColor() {
    switch (variant) {
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
