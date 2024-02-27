import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/tab/internal_tab.dart';

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
    this.colorIcon,
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

  /// To set custom colorIcon,
  /// by default will the same as text
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return InternalTab(
      key: key,
      text: text,
      icon: icon,
      badgeNumber: badgeNumber,
      colorIcon: colorIcon,
    );
  }
}
