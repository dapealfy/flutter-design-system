import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Ticker component
/// https://www.figma.com/file/VWK8ra7NhxzTW9iY4MQ9KG/FunDS---Component-Library?type=design&node-id=6811-49888&mode=design&t=QYete7CRUJnPg0fx-0

enum TickerType {
  info,
  success,
  warning,
  danger,
}

class Ticker extends StatelessWidget {
  const Ticker({
    Key? key,
    required this.child,
    required this.type,
    this.iconWidget,
    this.funDsIconography,
  }) : super(key: key);

  final TickerType type;
  final Widget? iconWidget;
  final String? funDsIconography;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = switch (type) {
      TickerType.danger => FunDsColors.colorRed50,
      TickerType.info => FunDsColors.colorBlue50,
      TickerType.success => FunDsColors.colorGreen50,
      TickerType.warning => FunDsColors.colorOrange50,
    };

    final borderColor = switch (type) {
      TickerType.danger => FunDsColors.colorRed500,
      TickerType.info => FunDsColors.colorBlue600,
      TickerType.success => FunDsColors.colorGreen500,
      TickerType.warning => FunDsColors.colorOrange600,
    };

    final defaultIcon = switch (type) {
      TickerType.danger => FunDsIconography.actionIcTrashCan,
      TickerType.info => FunDsIconography.infoIcInformation,
      TickerType.success => FunDsIconography.actionIcCheckCircle,
      TickerType.warning => FunDsIconography.infoIcWarning,
    };

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.spMin,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          iconWidget ??
              FunDsIcon(
                funDsIconography: funDsIconography ?? defaultIcon,
                size: 24.w,
                color: borderColor,
              ),
          SizedBox(width: 8.w),
          Expanded(
            child: DefaultTextStyle(
              style: FunDsTypography.body12.copyWith(color: borderColor),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
