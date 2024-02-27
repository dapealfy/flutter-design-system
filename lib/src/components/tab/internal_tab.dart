import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternalTab extends StatelessWidget {
  const InternalTab({
    super.key,
    this.icon,
    this.text,
    this.badgeNumber,
    this.colorIcon,
    this.isSelected = false,
    this.isDefaultPaddingApplied = true,
  });

  final String? icon;
  final String? text;
  final int? badgeNumber;
  final Color? colorIcon;
  final bool isSelected; // internal only
  final bool isDefaultPaddingApplied; // internal only

  InternalTab copyWith(
      {required bool isSelected,
      int? badgeNumber,
      bool? isDefaultPaddingApplied}) {
    return InternalTab(
      key: key,
      icon: icon,
      text: text,
      badgeNumber: badgeNumber ?? this.badgeNumber,
      isSelected: isSelected,
      isDefaultPaddingApplied:
          isDefaultPaddingApplied ?? this.isDefaultPaddingApplied,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color isSelectedColor = isSelected
        ? funds.FunDsColors.colorPrimary500
        : funds.FunDsColors.colorNeutral500;

    Widget suffixIcon;
    if (icon != null) {
      suffixIcon = funds.FunDsIcon(
        key: const Key('funDsTabIcon'),
        funDsIconography: icon!,
        size: 20,
        color: colorIcon ?? isSelectedColor,
      );
    } else {
      suffixIcon = const SizedBox();
    }

    return Tab(
      height: 52.0,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: isDefaultPaddingApplied ? 12 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            suffixIcon,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                text ?? '',
                style: funds.FunDsTypography.body14.copyWith(
                  color: isSelectedColor,
                ),
              ),
            ),
            Visibility(
                visible: badgeNumber != null,
                child: funds.Badge.circled(
                  key: const Key('funDsTabBadgeNumber'),
                  count: badgeNumber ?? 0,
                  badgeStatus: funds.BadgeStatus.light,
                  inverted: true,
                ))
          ],
        ),
      ),
    );
  }
}
