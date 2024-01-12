import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BadgeStatus { light, info, success, alert, warning }

class Badge extends StatelessWidget {
  /// BadgeStatus: use this enum to set the badge status.
  final BadgeStatus? badgeStatus;

  /// label: use this to set the badge label.
  final String? label;

  /// count: use this to set the badge count.
  final int? count;

  /// Inverted false: use it with white background for better contrast.
  /// Inverted true: use this type when you want to make it stand out a little.
  final bool inverted;

  /// maxCount: use this constant to limit the count number.
  final maxCount = 99;

  /// Badge: use this constructor when you want to make a badge.
  const Badge({
    Key? key,
    this.badgeStatus,
    this.label,
    this.count,
    this.inverted = false,
  })  : assert(
            (label != null && count == null) ||
                (label == null && count != null),
            'Only either label or count should be provided, not both.'),
        super(key: key);

  /// Circled: use this type when you want to make numbering badge.
  factory Badge.circled({
    Key? key,
    BadgeStatus? badgeStatus,
    bool inverted = false,
    int? count,
  }) {
    return Badge(
      key: key,
      badgeStatus: badgeStatus,
      inverted: inverted,
      count: count,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: (count != null)
            ? EdgeInsets.all(4.r)
            : EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration:
            _buildDecoration(badgeStatus, inverted: inverted, count: count),
        child: _buildText(badgeStatus, count, inverted: inverted),
      ),
    );
  }

  ShapeDecoration _buildDecoration(
    BadgeStatus? badgeStatus, {
    bool inverted = false,
    int? count,
  }) {
    final backgroundColor =
        _getBackgroundColor(badgeStatus, inverted: inverted);
    final borderColor = _getBorderColor(badgeStatus, inverted: inverted);
    final borderWidth = inverted ? 1.0 : 0.0;

    return ShapeDecoration(
      color: backgroundColor,
      shape: count != null
          ? CircleBorder(
              side: BorderSide(color: borderColor, width: borderWidth))
          : StadiumBorder(
              side: BorderSide(color: borderColor, width: borderWidth)),
    );
  }

  Widget _buildText(
    BadgeStatus? badgeStatus,
    int? count, {
    bool inverted = false,
  }) {
    final textStyle = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      color: _getTextColor(badgeStatus, inverted: inverted),
    );

    if (count != null) {
      return Text(
        count > maxCount ? '$maxCount+' : '$count',
        textAlign: TextAlign.center,
        style: textStyle,
      );
    } else {
      return Text(
        label ?? '',
        style: textStyle,
      );
    }
  }

  Color _getTextColor(BadgeStatus? badgeStatus, {bool inverted = false}) {
    final colorMap = {
      BadgeStatus.light:
          inverted ? FunDsColors.colorNeutral900 : FunDsColors.colorWhite,
      BadgeStatus.info:
          inverted ? FunDsColors.colorBlue600 : FunDsColors.colorWhite,
      BadgeStatus.success:
          inverted ? FunDsColors.colorGreen600 : FunDsColors.colorWhite,
      BadgeStatus.alert:
          inverted ? FunDsColors.colorRed500 : FunDsColors.colorWhite,
      BadgeStatus.warning:
          inverted ? FunDsColors.colorOrange600 : FunDsColors.colorWhite,
    };

    return colorMap[badgeStatus] ?? FunDsColors.colorWhite;
  }

  Color _getBackgroundColor(BadgeStatus? badgeStatus, {bool inverted = false}) {
    final colorMap = {
      BadgeStatus.light:
          inverted ? FunDsColors.colorWhite : FunDsColors.colorPrimary500,
      BadgeStatus.info:
          inverted ? FunDsColors.colorBlue50 : FunDsColors.colorBlue600,
      BadgeStatus.success:
          inverted ? FunDsColors.colorGreen50 : FunDsColors.colorGreen600,
      BadgeStatus.warning:
          inverted ? FunDsColors.colorRed50 : FunDsColors.colorOrange500,
      BadgeStatus.alert:
          inverted ? FunDsColors.colorRed50 : FunDsColors.colorRed500,
    };

    return colorMap[badgeStatus] ?? FunDsColors.colorWhite;
  }

  Color _getBorderColor(BadgeStatus? badgeStatus, {bool inverted = false}) {
    final colorMap = {
      BadgeStatus.light:
          inverted ? FunDsColors.colorNeutral200 : FunDsColors.colorPrimary500,
      BadgeStatus.info:
          inverted ? FunDsColors.colorBlue200 : FunDsColors.colorBlue600,
      BadgeStatus.success:
          inverted ? FunDsColors.colorGreen200 : FunDsColors.colorGreen600,
      BadgeStatus.warning:
          inverted ? FunDsColors.colorOrange200 : FunDsColors.colorOrange500,
      BadgeStatus.alert:
          inverted ? FunDsColors.colorRed200 : FunDsColors.colorRed500,
    };

    return colorMap[badgeStatus] ?? FunDsColors.colorWhite;
  }
}
