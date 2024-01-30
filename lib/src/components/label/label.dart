import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// master label : Invert, medium, purple
enum LabelSize { small, medium, large }

enum LabelType { invert, outline, filled }

enum LabelColor { purple, grey, white, green, blue, red, orange, yellow }

/// Label
///
/// Usage :
/// ```dart
/// Label(
///   'Label',
///   startIcon: startIcon,
///   endIcon: endIcon,
///   size: size,
///   color: color,
///   type: type,
///   onTap: () { ... },
///);
///```
class Label extends StatelessWidget {
  const Label(
    this.text, {
    super.key,
    this.size = LabelSize.medium,
    this.color = LabelColor.purple,
    this.type = LabelType.invert,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  });

  final String text;
  /// take icon from [FunDsIconography]
  final String? leadingIcon;
  /// take icon from [FunDsIconography]
  final String? trailingIcon;
  final LabelSize size;
  final LabelColor color;
  final LabelType type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LabelType.invert:
        return _buildLabelInvert();
      case LabelType.filled:
        return _buildLabelFilled();
      case LabelType.outline:
        return _buildLabelOutline();
    }
  }

  Widget _buildLabel(Color contentColor, Color backgroundColor,
      {Color? borderColor}) {
    double fontSize;
    double containerHeight;
    EdgeInsets padding;

    switch (size) {
      case LabelSize.small:
        fontSize = 10.sp;
        containerHeight = 20.h;
        double horizontalPadding = 6.w;
        double horizontalPaddingWithIcon = 3.w;

        padding = EdgeInsets.only(
          left: leadingIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
          right: trailingIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
        );
        break;
      case LabelSize.medium:
        fontSize = 12.sp;
        containerHeight = 22.h;
        double horizontalPadding = 8.w;
        double horizontalPaddingWithIcon = 4.w;

        padding = EdgeInsets.only(
          left: leadingIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
          right: trailingIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
        );
        break;
      case LabelSize.large:
        fontSize = 12.sp;
        containerHeight = 26.h;
        double horizontalPadding = 8.w;
        double horizontalPaddingWithIcon = 5.w;

        padding = EdgeInsets.only(
          left: leadingIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
          right: trailingIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
        );
        break;
    }

    return Container(
        padding: padding,
        height: containerHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor ?? backgroundColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
        ),
        child: InkWell(
          onTap: () {
            onTap?.call();
          },
          child: Row(
            children: [
              Visibility(
                child: Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Center(
                    child: leadingIcon != null
                        ? FunDsIcon(
                            funDsIconography: leadingIcon!,
                            size: 16.r,
                            color: contentColor,
                          )
                        : const SizedBox(),
                  ),
                ),
                visible: leadingIcon != null,
              ),
              Center(
                child: Text(
                  text,
                  maxLines: 1,
                  style: FunDsTypography.defB.copyWith(
                    color: contentColor,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Visibility(
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Center(
                    child: trailingIcon != null
                        ? FunDsIcon(
                            funDsIconography: trailingIcon!,
                            size: 16.r,
                            color: contentColor,
                          )
                        : const SizedBox(),
                  ),
                ),
                visible: trailingIcon != null,
              ),
            ],
          ),
        ));
  }

  Widget _buildLabelInvert() {
    Color contentColor;
    Color backgroundColor;

    switch (color) {
      case LabelColor.purple:
        contentColor = FunDsColors.colorPrimary;
        backgroundColor = FunDsColors.colorPrimary100;
        break;
      case LabelColor.grey:
        contentColor = FunDsColors.colorNeutral600;
        backgroundColor = FunDsColors.colorNeutral200;
        break;
      case LabelColor.white:
        contentColor = FunDsColors.colorNeutral900;
        backgroundColor = FunDsColors.colorNeutral50;
        break;
      case LabelColor.green:
        contentColor = FunDsColors.colorGreen600;
        backgroundColor = FunDsColors.colorGreen50;
        break;
      case LabelColor.blue:
        contentColor = FunDsColors.colorBlue600;
        backgroundColor = FunDsColors.colorBlue50;
        break;
      case LabelColor.red:
        contentColor = FunDsColors.colorRed500;
        backgroundColor = FunDsColors.colorRed50;
        break;
      case LabelColor.orange:
        contentColor = FunDsColors.colorOrange600;
        backgroundColor = FunDsColors.colorOrange50;
        break;
      case LabelColor.yellow:
        contentColor = FunDsColors.colorYellow600;
        backgroundColor = FunDsColors.colorYellow50;
        break;
    }

    return _buildLabel(contentColor, backgroundColor);
  }

  Widget _buildLabelOutline() {
    Color contentColor;
    Color backgroundColor;
    Color? borderColor;

    switch (color) {
      case LabelColor.purple:
        contentColor = FunDsColors.colorPrimary;
        backgroundColor = FunDsColors.colorPrimary100;
        break;
      case LabelColor.grey:
        contentColor = FunDsColors.colorNeutral600;
        backgroundColor = FunDsColors.colorNeutral200;
        borderColor = FunDsColors.colorNeutral500;
        break;
      case LabelColor.white:
        contentColor = FunDsColors.colorNeutral900;
        backgroundColor = FunDsColors.colorWhite;
        borderColor = FunDsColors.colorNeutral200;
        break;
      case LabelColor.green:
        contentColor = FunDsColors.colorGreen600;
        backgroundColor = FunDsColors.colorGreen50;
        break;
      case LabelColor.blue:
        contentColor = FunDsColors.colorBlue600;
        backgroundColor = FunDsColors.colorBlue50;
        break;
      case LabelColor.red:
        contentColor = FunDsColors.colorRed500;
        backgroundColor = FunDsColors.colorRed50;
        break;
      case LabelColor.orange:
        contentColor = FunDsColors.colorOrange600;
        backgroundColor = FunDsColors.colorOrange50;
        break;
      case LabelColor.yellow:
        contentColor = FunDsColors.colorYellow600;
        backgroundColor = FunDsColors.colorYellow50;
        borderColor = FunDsColors.colorYellow500;
        break;
    }

    return _buildLabel(contentColor, backgroundColor,
        borderColor: borderColor ?? contentColor);
  }

  Widget _buildLabelFilled() {
    Color contentColor;
    Color backgroundColor;

    switch (color) {
      case LabelColor.purple:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorPrimary;
        break;
      case LabelColor.grey:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorNeutral600;
        break;
      case LabelColor.white:
        contentColor = FunDsColors.colorNeutral900;
        backgroundColor = FunDsColors.colorWhite;
        break;
      case LabelColor.green:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorGreen600;
        break;
      case LabelColor.blue:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorBlue600;
        break;
      case LabelColor.red:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorRed500;
        break;
      case LabelColor.orange:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorOrange600;
        break;
      case LabelColor.yellow:
        contentColor = FunDsColors.colorYellow800;
        backgroundColor = FunDsColors.colorYellow500;
        break;
    }

    return _buildLabel(contentColor, backgroundColor,
        borderColor: backgroundColor);
  }
}
