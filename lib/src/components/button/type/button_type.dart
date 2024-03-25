import 'package:flutter/painting.dart';
import 'package:flutter_design_system/src/components/button/button.dart';
import 'package:flutter_design_system/src/typography/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonType {
  final double height;
  final double radius;
  final TextStyle textStyle;
  final EdgeInsets padding;

  ButtonType({
    required this.height,
    required this.radius,
    required this.textStyle,
    required this.padding,
  });
}

extension ButtonTypeConverter on FunDsButtonType {
  ButtonType get internalButtonType => switch (this) {
        FunDsButtonType.xLarge => ButtonType(
            height: 52.h,
            radius: 8.r,
            textStyle: FunDsTypography.heading16,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        FunDsButtonType.large => ButtonType(
            height: 48.h,
            radius: 8.r,
            textStyle: FunDsTypography.heading16,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        FunDsButtonType.medium => ButtonType(
            height: 40.h,
            radius: 8.r,
            textStyle: FunDsTypography.heading14,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
        FunDsButtonType.small => ButtonType(
            height: 32.h,
            radius: 6.r,
            textStyle: FunDsTypography.body12B,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
        FunDsButtonType.xSmall => ButtonType(
            height: 24.h,
            radius: 6.r,
            textStyle: FunDsTypography.body12B,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          ),
      };
}
