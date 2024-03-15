import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart' as funds;
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A Material Design [TabBar] tab.
///
/// See also:
///
///  * [FunDsTabBar], which displays a row of tabs.
///  * [FunDsHeader], which can be used with a combination of tabBar.
class FunDsTab extends StatelessWidget {
  const FunDsTab({
    super.key,
    this.icon,
    this.text,
    this.badgeNumber,
  }) : assert((text == null && icon != null) ||
            (text != null && icon == null) ||
            (text != null && icon != null));

  /// An icon to display as the tab's label.
  /// if neither icon or text provided, error will be thrown.
  final String? icon;

  /// The text to display as the tab's label.
  /// if neither icon or text provided, error will be thrown.
  final String? text;

  /// To show badgeNumber besides text.
  final int? badgeNumber;

  @override
  Widget build(BuildContext context) {
    final iconTheme = context.dependOnInheritedWidgetOfExactType<IconTheme>();
    Widget suffixIcon;

    if (icon != null) {
      suffixIcon = funds.FunDsIcon(
        key: const Key('funDsTabIcon'),
        funDsIconography: icon!,
        color: iconTheme?.data.color,
        size: 20,
      );
    } else {
      suffixIcon = const SizedBox();
    }

    return Tab(
      height: 52.0,
      child: SizedBox(
        width: 109.w,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              suffixIcon,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    text ?? '',
                    maxLines: 1,
                    style: FunDsTypography.body14
                        .copyWith(color: iconTheme?.data.color // label color
                            ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Visibility(
                visible: badgeNumber != null,
                child: funds.FunDsBadge.circled(
                  key: const Key('funDsTabBadgeNumber'),
                  count: badgeNumber ?? 0,
                  badgeStatus: funds.FunDsBadgeStatus.light,
                  inverted: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
