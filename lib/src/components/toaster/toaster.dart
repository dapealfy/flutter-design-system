import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/colors/colors.dart';
import 'package:flutter_design_system/src/typography/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToasterType { normal, error }

class Toaster extends SnackBar {
  /// The message to be displayed.
  String message;

  /// The optional label for the [SnackBarAction].
  String? label;

  /// The type of toaster to be displayed.
  ToasterType type;

  /// The optional icon to be displayed on the left of the message.
  Widget? leftIcon;

  Toaster({
    super.key,
    required this.message,
    this.label,
    this.type = ToasterType.normal,
    this.leftIcon,
  }) : super(
          content: Row(
            children: [
              (leftIcon != null)
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: leftIcon,
                    )
                  : const SizedBox.shrink(),
              Text(
                message,
                style: FunDsTypography.body14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          action: (label != null)
              ? SnackBarAction(
                  label: label,
                  textColor: FunDsColors.colorWhite,
                  onPressed: () {},
                )
              : null,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          backgroundColor: (type == ToasterType.normal)
              ? FunDsColors.colorNeutral900
              : FunDsColors.colorRed500,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        );
}
