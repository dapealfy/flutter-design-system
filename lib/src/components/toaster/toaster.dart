import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/colors/colors.dart';
import 'package:flutter_design_system/src/typography/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToasterType { normal, error }

class Toaster extends SnackBar {
  /// Creates a [SnackBar] with some [content] and an [action].
  Toaster({
    Key? key,

    /// The message to be displayed.
    required String message,

    /// The optional label for the [SnackBarAction].
    String? label,

    /// The type of toaster to be displayed.
    ToasterType type = ToasterType.normal,

    /// The optional icon to be displayed on the left of the message.
    Widget? leftIcon,
  }) : super(
          key: key,
          content: Row(
            children: [
              if (leftIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: leftIcon,
                ),
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
