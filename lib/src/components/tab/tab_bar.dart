import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';

/// Creates a Material Design primary tab bar.
///
/// The length of the [tabs] argument must match the [controller]'s
/// [TabController.length].
///
/// If a [TabController] is not provided, then there must be a
/// [DefaultTabController] ancestor.
///
/// usage :
///
/// ```dart
/// FunDsTabBar(
///   isScrollable: true,
///   controller: TabController(initialIndex: 0, length: 3, vsync: this),
///   tabs: const [
///     FunDsTab(text: 'tab 1', icon: FunDsIconography.actionIcDownload),
///     FunDsTab(text: 'tab 2', icon: FunDsIconography.actionIcCheckCircle),
///     FunDsTab(text: 'tab 3', icon: FunDsIconography.actionIcSetting),
///   ],
/// ),
/// ```
///
///
/// usage with [FunDsHeader] :
///
/// ```dart
/// FunDsHeader(
///  title: 'title',
///  useDarkBg: false,
///  tabBar: FunDsTabBar(
///    isScrollable: true,
///    controller: TabController(initialIndex: 0, length: 3, vsync: this),
///    tabs: const [
///      FunDsTab(text: 'tab 1', icon: FunDsIconography.actionIcDownload),
///      FunDsTab(text: 'tab 2', icon: FunDsIconography.actionIcCheckCircle),
///      FunDsTab(text: 'tab 3', icon: FunDsIconography.actionIcSetting),
///    ],
///  ),
/// );
/// ```
class FunDsTabBar extends TabBar {
  const FunDsTabBar({
    super.key,

    /// A list of [FunDsTab] to display as tabs.
    required List<FunDsTab> tabs,

    /// This widget's selection and animation state.
    ///
    /// If [TabController] is not provided, then the value of [DefaultTabController.of]
    /// will be used.
    TabController? controller,

    /// An optional property for scrollable tabs
    bool isScrollable = false,

    /// An optional callback that's called when the [TabBar] is tapped.
    ValueChanged<int>? onTap,
  }) : super(
          tabs: tabs,
          isScrollable: isScrollable,
          controller: controller,
          labelColor: FunDsColors.colorPrimary500,
          unselectedLabelColor: FunDsColors.colorNeutral500,
          padding: EdgeInsets.zero,
          indicatorColor: FunDsColors.colorPrimary500,
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: isScrollable ? TabAlignment.start : TabAlignment.fill,
          onTap: onTap,
        );
}
