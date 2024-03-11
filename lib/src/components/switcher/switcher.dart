import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Switcher is used to make tabs of screen.
/// same as [FunDsTabs] but with some limitation.
///
/// Usage with [TabController] :
/// ```dart
/// FunDsSwitcher(
///   tabs: [
///     FunDsSwitcherTab(text: 'Tab 1'),
///     FunDsSwitcherTab(text: 'Tab 2'),
///     FunDsSwitcherTab(text: 'Tab 3'),
///   ],
///   controller: TabController,
/// );
/// ```
/// <br/>
/// Usage with [DefaultTabController]
/// ```dart
/// final tabs = [
///   FunDsSwitcherTab(text: 'Tab 0',),
///   FunDsSwitcherTab(text: 'Tab 1',),
///   FunDsSwitcherTab(text: 'Tab ',)
/// ];
///
/// DefaultTabController(
///   length: tabs.length,
///   child: Scaffold(
///     body: Padding(
///       padding: const EdgeInsets.all(32.0),
///       child: Column(children: [
///         FunDsSwitcher(tabs: tabs),
///         Expanded(
///           child: TabBarView(
///             children: tabs.map((FunDsSwitcherTab tab) {
///               final String label = tab.text.toLowerCase();
///               return Center(
///                 child: Text(
///                   'This is the $label tab',
///                   style: const TextStyle(fontSize: 36),
///                 ),
///               );
///             }).toList(),
///           ),
///         )
///       ]),
///     ),
///   ),
/// );
/// ```
class FunDsSwitcher extends StatefulWidget {
  const FunDsSwitcher({
    super.key,
    this.controller,
    required this.tabs,
    this.onTap,
  });

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// List of [FunDsSwitcherTab].
  ///
  /// maximum provided tabs is 3, more than that preferable to use [FunDsTabs]
  final List<FunDsSwitcherTab> tabs;

  /// An optional callback that's called when the [TabBar] is tapped.
  final ValueChanged<int>? onTap;

  @override
  State<FunDsSwitcher> createState() => _FunDsSwitcherState();
}

class _FunDsSwitcherState extends State<FunDsSwitcher> {
  late List<_FunDsSwitcherTab> _tabs;

  @override
  void initState() {
    super.initState();
    if (widget.tabs.length > 3) {
      throw FlutterError('The tabs of this component is not '
          'designed to handle more than 3 tabs');
    }

    _tabs = widget.tabs
        .asMap()
        .map((index, value) {
          return MapEntry(
              index,
              _FunDsSwitcherTab(
                key: value.key,
                icon: value.icon,
                text: value.text,
                selectedIndex: widget.controller?.index ?? 0,
                index: index,
                maxIndex: widget.tabs.length - 1,
              ));
        })
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: FunDsColors.colorNeutral50,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: FunDsColors.colorNeutral200)),
      child: TabBar(
        tabs: _tabs,
        controller: widget.controller,
        onTap: (index) {
          widget.onTap?.call(index);
          setState(() {
            if (_tabs.length == 3) {
              // set middle
              _tabs[1] = _tabs[1].copyWith(index);
            }
          });
        },
        labelPadding: EdgeInsets.zero,
        indicatorPadding:
            const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        padding: EdgeInsets.zero,
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 2,
              color: Color.fromRGBO(148, 157, 172, 0.32),
            ),
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
              color: Color.fromRGBO(164, 172, 185, 0.24),
            ),
          ],
          color: FunDsColors.colorWhite,
        ),
        unselectedLabelStyle:
            FunDsTypography.body12.copyWith(color: FunDsColors.colorNeutral500),
        labelStyle:
            FunDsTypography.body12.copyWith(color: FunDsColors.colorNeutral900),
        splashBorderRadius: BorderRadius.circular(10.r),
        dividerHeight: 0.0,
      ),
    );
  }
}

/// The single Tab of [FunDsSwitcher]
class FunDsSwitcherTab extends StatelessWidget {
  const FunDsSwitcherTab({super.key, this.icon, required this.text});

  final String? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return _FunDsSwitcherTab(icon: icon, text: text);
  }
}

class _FunDsSwitcherTab extends StatelessWidget {
  const _FunDsSwitcherTab({
    super.key,
    required this.text,
    this.icon,
    this.selectedIndex = 0,
    this.index = 0,
    this.maxIndex = 0,
  }) : assert(index >= 0);

  final String text;
  final String? icon;
  final int selectedIndex;
  final int index;
  final int maxIndex;

  _FunDsSwitcherTab copyWith(int selectedIndex) {
    return _FunDsSwitcherTab(
      text: text,
      icon: icon,
      selectedIndex: selectedIndex,
      index: index,
      maxIndex: maxIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconTheme = context.dependOnInheritedWidgetOfExactType<IconTheme>();
    return Container(
      margin: const EdgeInsets.all(4),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // show left divider when :
            // - there's 3 tabs present,
            // - this tab index is 1 / middle
            // - selected Index is 2 / last
            //
            AnimatedOpacity(
              opacity:
                  maxIndex == 2 && selectedIndex == 2 && index == 1 ? 1.0 : 0.0,
              duration: kTabScrollDuration,
              child: const VerticalDivider(
                width: 1,
                color: FunDsColors.colorNeutral200,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 34.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FunDsIcon(
                            funDsIconography: icon ?? '',
                            size: 16,
                            color: iconTheme?.data.color,
                          )),
                      visible: icon != null,
                    ),
                    Text(text),
                  ],
                ),
              ),
            ),
            // show right divider when :
            // - there's 3 tabs present,
            // - this tab index is 1 / middle
            // - selected Index is 0 / first
            AnimatedOpacity(
              opacity:
                  maxIndex == 2 && index == 1 && selectedIndex != 2 ? 1.0 : 0.0,
              duration: kTabScrollDuration,
              child: const VerticalDivider(
                width: 1,
                color: FunDsColors.colorNeutral200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}