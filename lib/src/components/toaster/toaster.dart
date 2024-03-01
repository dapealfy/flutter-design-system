import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/colors/colors.dart';
import 'package:flutter_design_system/src/typography/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToasterType { normal, error }

class Toaster extends SnackBar {
  /// Creates a [SnackBar] with some [content] and an [action].
  Toaster({
    Key? key,
    required BuildContext context,

    /// The message to be displayed.
    required String message,

    /// The optional label for the [SnackBarAction].
    String? label,

    /// The type of toaster to be displayed.
    ToasterType type = ToasterType.normal,

    /// The action to be displayed.
    void Function()? onAction,

    /// The optional icon to be displayed on the left of the message.
    Widget? leftIcon,
  }) : super(
          key: key,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              const Spacer(),
              if (label != null)
                Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: Size(
                        16.r,
                        16.r,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).hideCurrentSnackBar(
                          reason: SnackBarClosedReason.dismiss);
                    },
                    child: Text(
                      label,
                      style: FunDsTypography.body14B.copyWith(
                        color: FunDsColors.colorWhite,
                      ),
                    ),
                  ),
                ),
              IconButton(
                style: IconButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  iconSize: 16.r,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(
                    16.r,
                    16.r,
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
                },
                icon: Icon(
                  Icons.close,
                  size: 16.r,
                  color: Colors.white,
                ),
              )
            ],
          ),
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
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
