import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// master label : Invert, medium, purple
enum FunDsLabelSize { small, medium, large }

enum FunDsLabelType { invert, outline, filled }

enum FunDsLabelColor { purple, grey, white, green, blue, red, orange, yellow }

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
class FunDsLabel extends StatelessWidget {
  const FunDsLabel(
    this.text, {
    super.key,
    this.size = FunDsLabelSize.medium,
    this.color = FunDsLabelColor.purple,
    this.type = FunDsLabelType.invert,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });

  final String text;

  /// take icon from [FunDsIconography]
  final String? prefixIcon;

  /// take icon from [FunDsIconography]
  final String? suffixIcon;
  final FunDsLabelSize size;
  final FunDsLabelColor color;
  final FunDsLabelType type;
  final VoidCallback? onTap;

  FunDsLabel copyWith({FunDsLabelSize? size}) {
    return FunDsLabel(
      text,
      key: key,
      size: size ?? this.size,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      color: color,
      type: type,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FunDsLabelType.invert:
        return _buildLabelInvert();
      case FunDsLabelType.filled:
        return _buildLabelFilled();
      case FunDsLabelType.outline:
        return _buildLabelOutline();
    }
  }

  Widget _buildLabel(Color contentColor, Color backgroundColor,
      {Color? borderColor}) {
    double fontSize;
    double containerHeight;
    EdgeInsets padding;

    switch (size) {
      case FunDsLabelSize.small:
        fontSize = 10.sp;
        containerHeight = 20.h;
        double horizontalPadding = 6.w;
        double horizontalPaddingWithIcon = 3.w;

        padding = EdgeInsets.only(
          left: prefixIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
          right: suffixIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
        );
        break;
      case FunDsLabelSize.medium:
        fontSize = 12.sp;
        containerHeight = 22.h;
        double horizontalPadding = 8.w;
        double horizontalPaddingWithIcon = 4.w;

        padding = EdgeInsets.only(
          left: prefixIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
          right: suffixIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
        );
        break;
      case FunDsLabelSize.large:
        fontSize = 12.sp;
        containerHeight = 26.h;
        double horizontalPadding = 8.w;
        double horizontalPaddingWithIcon = 5.w;

        padding = EdgeInsets.only(
          left: prefixIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
          right: suffixIcon == null
              ? horizontalPadding
              : horizontalPaddingWithIcon,
        );
        break;
    }

    return Container(
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
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap != null
                ? () {
                    onTap?.call();
                  }
                : null,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
            ),
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Center(
                        child: prefixIcon != null
                            ? FunDsIcon(
                                funDsIconography: prefixIcon!,
                                size: 16.r,
                                color: contentColor,
                              )
                            : const SizedBox(),
                      ),
                    ),
                    visible: prefixIcon != null,
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
                        child: suffixIcon != null
                            ? FunDsIcon(
                                funDsIconography: suffixIcon!,
                                size: 16.r,
                                color: contentColor,
                              )
                            : const SizedBox(),
                      ),
                    ),
                    visible: suffixIcon != null,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildLabelInvert() {
    Color contentColor;
    Color backgroundColor;

    switch (color) {
      case FunDsLabelColor.purple:
        contentColor = FunDsColors.colorPrimary;
        backgroundColor = FunDsColors.colorPrimary100;
        break;
      case FunDsLabelColor.grey:
        contentColor = FunDsColors.colorNeutral600;
        backgroundColor = FunDsColors.colorNeutral200;
        break;
      case FunDsLabelColor.white:
        contentColor = FunDsColors.colorNeutral900;
        backgroundColor = FunDsColors.colorNeutral50;
        break;
      case FunDsLabelColor.green:
        contentColor = FunDsColors.colorGreen600;
        backgroundColor = FunDsColors.colorGreen50;
        break;
      case FunDsLabelColor.blue:
        contentColor = FunDsColors.colorBlue600;
        backgroundColor = FunDsColors.colorBlue50;
        break;
      case FunDsLabelColor.red:
        contentColor = FunDsColors.colorRed500;
        backgroundColor = FunDsColors.colorRed50;
        break;
      case FunDsLabelColor.orange:
        contentColor = FunDsColors.colorOrange600;
        backgroundColor = FunDsColors.colorOrange50;
        break;
      case FunDsLabelColor.yellow:
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
      case FunDsLabelColor.purple:
        contentColor = FunDsColors.colorPrimary;
        backgroundColor = FunDsColors.colorPrimary100;
        break;
      case FunDsLabelColor.grey:
        contentColor = FunDsColors.colorNeutral600;
        backgroundColor = FunDsColors.colorNeutral200;
        borderColor = FunDsColors.colorNeutral500;
        break;
      case FunDsLabelColor.white:
        contentColor = FunDsColors.colorNeutral900;
        backgroundColor = FunDsColors.colorWhite;
        borderColor = FunDsColors.colorNeutral200;
        break;
      case FunDsLabelColor.green:
        contentColor = FunDsColors.colorGreen600;
        backgroundColor = FunDsColors.colorGreen50;
        break;
      case FunDsLabelColor.blue:
        contentColor = FunDsColors.colorBlue600;
        backgroundColor = FunDsColors.colorBlue50;
        break;
      case FunDsLabelColor.red:
        contentColor = FunDsColors.colorRed500;
        backgroundColor = FunDsColors.colorRed50;
        break;
      case FunDsLabelColor.orange:
        contentColor = FunDsColors.colorOrange600;
        backgroundColor = FunDsColors.colorOrange50;
        break;
      case FunDsLabelColor.yellow:
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
      case FunDsLabelColor.purple:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorPrimary;
        break;
      case FunDsLabelColor.grey:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorNeutral600;
        break;
      case FunDsLabelColor.white:
        contentColor = FunDsColors.colorNeutral900;
        backgroundColor = FunDsColors.colorWhite;
        break;
      case FunDsLabelColor.green:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorGreen600;
        break;
      case FunDsLabelColor.blue:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorBlue600;
        break;
      case FunDsLabelColor.red:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorRed500;
        break;
      case FunDsLabelColor.orange:
        contentColor = FunDsColors.colorWhite;
        backgroundColor = FunDsColors.colorOrange600;
        break;
      case FunDsLabelColor.yellow:
        contentColor = FunDsColors.colorYellow800;
        backgroundColor = FunDsColors.colorYellow500;
        break;
    }

    return _buildLabel(contentColor, backgroundColor,
        borderColor: backgroundColor);
  }
}
