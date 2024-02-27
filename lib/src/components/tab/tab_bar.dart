import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/tab/internal_tab.dart';

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
class FunDsTabBar extends StatefulWidget {
  const FunDsTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
    this.isScrollable = false,
    this.applyDefaultPadding = true,
  });

  /// An icon to display as the tab's label.
  final List<FunDsTab> tabs;

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// An optional callback that's called when the [TabBar] is tapped.
  final ValueChanged<int>? onTap;

  /// An optional property for scrollable tabs
  final bool isScrollable;

  /// An optional property to apply default padding for each tab.
  ///
  /// each tab will be applied padding of 12 horizontally, true by default.
  /// set to false to make the padding to 0
  /// or dynamic by screen size automatically
  ///
  ///
  /// if true, may cause width overflow for some smaller device.
  final bool applyDefaultPadding;

  @override
  State<FunDsTabBar> createState() => _FunDsTabBarState();
}

class _FunDsTabBarState extends State<FunDsTabBar> {
  TabController? _controller;
  late List<InternalTab> tabs;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initController(context);
    final tabAlignment =
        widget.isScrollable ? TabAlignment.start : TabAlignment.fill;

    return TabBar(
      tabs: tabs,
      controller: _controller,
      indicatorColor: FunDsColors.colorPrimary500,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: widget.isScrollable,
      tabAlignment: tabAlignment,
      onTap: (index) {
        widget.onTap?.call(index);
      },
    );
  }

  initController(BuildContext context) {
    _controller = widget.controller ?? DefaultTabController.maybeOf(context)!;

    tabs = widget.tabs
        .asMap()
        .map((index, e) {
          return MapEntry(
            index,
            InternalTab(
              key: e.key,
              text: e.text,
              badgeNumber: e.badgeNumber,
              colorIcon: e.colorIcon,
              isSelected: _controller?.index == index,
              isDefaultPaddingApplied: widget.applyDefaultPadding,
            ),
          );
        })
        .values
        .toList();

    _controller?.addListener(() {
      if (_controller == null) return;

      setState(() {
        final currentIndex = _controller!.index;
        final prevIndex = _controller!.previousIndex;

        tabs[currentIndex] = tabs[currentIndex].copyWith(isSelected: true);
        tabs[prevIndex] = tabs[prevIndex].copyWith(isSelected: false);
      });
    });
  }
}
