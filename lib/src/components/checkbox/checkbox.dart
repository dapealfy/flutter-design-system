import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsCheckbox extends StatefulWidget {
  const FunDsCheckbox({
    super.key,
    this.title,
    this.subtitle,
    this.defaultValue = false,
    this.rightCheckbox = false,
    this.tristate = false,
    required this.variant,
    required this.onChanged,
  });

  final String? title;
  final String? subtitle;
  final bool defaultValue;
  final bool rightCheckbox;
  final bool tristate;
  final FunDsCheckboxVariant variant;
  final Function(bool?) onChanged;

  @override
  State<FunDsCheckbox> createState() => _FunDsCheckboxState();
}

class _FunDsCheckboxState extends State<FunDsCheckbox> {
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.subtitle == null && widget.title == null) {
      return _getCheckBox(key: widget.key);
    } else {
      return ListTile(
        key: widget.key,
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        isThreeLine: widget.subtitle != null,
        onTap: widget.variant == FunDsCheckboxVariant.disabled
            ? null
            : () {
                setState(() {
                  switch (isChecked) {
                    case false:
                      isChecked = true;
                    case true:
                      isChecked = widget.tristate ? null : false;
                    case null:
                      isChecked = false;
                  }
                  widget.onChanged(isChecked);
                });
              },
        title: widget.title == null
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Text(
                  widget.title ?? '',
                  style: FunDsTypography.body14.copyWith(
                    color: widget.variant == FunDsCheckboxVariant.disabled
                        ? FunDsColors.colorNeutral500
                        : FunDsColors.colorNeutral900,
                  ),
                ),
              ),
        subtitle: widget.subtitle == null
            ? null
            : Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  right: 8.h,
                ),
                child: Text(
                  widget.subtitle ?? '',
                  style: FunDsTypography.body14.copyWith(
                    color: widget.variant == FunDsCheckboxVariant.disabled
                        ? FunDsColors.colorNeutral500
                        : FunDsColors.colorNeutral600,
                  ),
                ),
              ),
        leading: widget.rightCheckbox ? null : _getCheckBox(),
        trailing: widget.rightCheckbox ? _getCheckBox() : null,
      );
    }
  }

  Widget _getCheckBox({Key? key}) {
    return Container(
      key: key,
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
        borderRadius: widget.variant == FunDsCheckboxVariant.tertiary
            ? BorderRadius.circular(5.r)
            : null,
      ),
      child: Padding(
        padding: widget.variant == FunDsCheckboxVariant.tertiary
            ? EdgeInsets.symmetric(horizontal: 1.h)
            : const EdgeInsets.only(),
        child: Checkbox(
          tristate: widget.tristate,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
              width: (isChecked ?? false) ? 0.r : 1.5,
              color: _getBorderColor(),
            ),
          ),
          onChanged: (bool? value) {
            widget.variant == FunDsCheckboxVariant.disabled
                ? null
                : setState(() {
                    isChecked = value;
                    widget.onChanged(value);
                  });
          },
          value: widget.tristate == true ? isChecked : (isChecked ?? false),
          activeColor: _getActiveColor(),
        ),
      ),
    );
  }

  Color _getBorderColor() {
    switch (widget.variant) {
      case FunDsCheckboxVariant.primary:
        if (isChecked ?? false) {
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
