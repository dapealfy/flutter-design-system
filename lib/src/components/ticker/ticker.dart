import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TickerType { outline, nonOutline }

enum TickerVariant {
  info,
  success,
  warning,
  danger,
}

/// Ticker
///
/// Usage :
/// ```dart
/// String? label = 'optional';
/// Ticker(
///  label: label,
///  description: 'a brief description here',
///  variant: TickerVariant.info,
///  type: TickerType.outline,
///  textLink: 'Custom Text Link',
///  onCloseTap: () {
///    // do something
///  },
///  onTextLinkTap: () {
///    // do something
///  },
/// );
/// ```
class Ticker extends StatelessWidget {
  const Ticker(
      {super.key,
      this.label,
      required this.description,
      required this.variant,
      required this.type,
      this.icon,
      this.textLink,
      this.onTextLinkTap,
      this.onCloseTap});

  final TickerVariant variant;
  final TickerType type;
  final String? icon;
  final String? label;
  final String description;
  final String? textLink;
  final VoidCallback? onTextLinkTap;
  final VoidCallback? onCloseTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = switch (variant) {
      TickerVariant.danger => FunDsColors.colorRed50,
      TickerVariant.info => FunDsColors.colorBlue50,
      TickerVariant.success => FunDsColors.colorGreen50,
      TickerVariant.warning => FunDsColors.colorOrange50,
    };

    final fontColor = switch (variant) {
      TickerVariant.danger => FunDsColors.colorRed500,
      TickerVariant.info => FunDsColors.colorBlue600,
      TickerVariant.success => FunDsColors.colorGreen500,
      TickerVariant.warning => FunDsColors.colorOrange600,
    };

    final borderColor = switch (type) {
      TickerType.nonOutline => backgroundColor,
      TickerType.outline => fontColor
    };

    final defaultIcon = switch (variant) {
      TickerVariant.danger => FunDsIconography.actionIcTrashCan,
      TickerVariant.info => FunDsIconography.infoIcInformation,
      TickerVariant.success => FunDsIconography.actionIcCheckCircle,
      TickerVariant.warning => FunDsIconography.infoIcWarning,
    };

    bool isLabelPresent = label != null;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.spMin,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
              child: Visibility(
                visible: isLabelPresent,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50.r),
                    onTap: () {
                      onCloseTap?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 12.w),
                      child: FunDsIcon(
                        funDsIconography: FunDsIconography.actionIcCrossNude,
                        size: 16.w,
                        color: FunDsColors.colorNeutral900,
                      ),
                    ),
                  ),
                ),
              ),
              right: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.w, right: 8.w),
                child: FunDsIcon(
                  funDsIconography: icon ?? defaultIcon,
                  size: 24.w,
                  color: fontColor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                            child: SizedBox(
                              height: 23.h,
                              child: Text(
                                label ?? '',
                                style: FunDsTypography.heading14.copyWith(
                                  color: FunDsColors.colorNeutral900,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            visible: isLabelPresent),
                        RichText(
                          text: TextSpan(
                              style: FunDsTypography.body12.copyWith(
                                  color: FunDsColors.colorNeutral900,
                                  height: 1.4),
                              children: [
                                TextSpan(
                                    text: description + ' ',
                                    style: TextStyle(
                                        color: isLabelPresent
                                            ? FunDsColors.colorNeutral900
                                            : fontColor)),
                                TextSpan(
                                  text: textLink,
                                  style: FunDsTypography.body12B.copyWith(
                                      color: FunDsColors.colorPrimary500),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      onTextLinkTap?.call();
                                    },
                                )
                              ]),
                        )
                      ]),
                ),
              ),
              Visibility(
                child: SizedBox(
                  width: 40.w,
                ),
                visible: isLabelPresent,
              )
            ],
          ),
        ],
      ),
    );
  }
}
