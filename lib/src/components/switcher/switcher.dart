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
  TabController? _controller;
  List<_FunDsSwitcherTab>? _tabs;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _initController();
    } else if (oldWidget.tabs != widget.tabs) {
      _generateTabs();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initController();
  }

  _initController() {
    if (widget.tabs.length > 3) {
      throw FlutterError('The tabs of this component is not '
          'designed to handle more than 3 tabs');
    }

    final TabController? newController =
        widget.controller ?? DefaultTabController.maybeOf(context);

    if (_controller != newController) {
      // Remove old controller listener
      _controller?.removeListener(_updateTabSelection);
      _controller = newController;
      _generateTabs();
      // add new listener
      _controller?.addListener(_updateTabSelection);
    }
  }

  _updateTabSelection() {
    setState(() {
      final currentIndex = _controller!.index;
      final prevIndex = _controller!.previousIndex;
      _tabs![currentIndex] = _tabs![currentIndex].copyWith(currentIndex);
      _tabs![prevIndex] = _tabs![prevIndex].copyWith(currentIndex);
    });
  }

  _generateTabs() {
    _tabs = widget.tabs
        .asMap()
        .map((index, value) {
          return MapEntry(
              index,
              _FunDsSwitcherTab(
                key: value.key,
                icon: value.icon,
                text: value.text,
                selectedIndex: _controller?.index ?? 0,
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
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        controller: _controller,
        tabs: _tabs ?? widget.tabs,
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        splashBorderRadius: BorderRadius.circular(10.r),
        dividerHeight: 0.0,
        onTap: (int index) {
          widget.onTap?.call(index);
        },
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

const _duration = Duration(milliseconds: 200);
const _curves = Curves.linear;

/// custom implementation of DecoratedBoxTransition
/// by listening the value of [_FunDsSwitcherTab.selectedIndex] property.
/// https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html
class _FunDsSwitcherTab extends ImplicitlyAnimatedWidget {
  const _FunDsSwitcherTab({
    super.key,
    required this.text,
    this.icon,
    this.selectedIndex = 0,
    this.index = 0,
    this.maxIndex = 0,
  })  : assert(index >= 0),
        super(duration: _duration, curve: _curves);

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
  AnimatedWidgetBaseState<_FunDsSwitcherTab> createState() =>
      _SwitcherTabState();
}

class _SwitcherTabState extends AnimatedWidgetBaseState<_FunDsSwitcherTab> {
  Tween<double>? _isSelected;
  late Animation<double> _selectedAnimation;

  bool get isSelected => widget.selectedIndex == widget.index;

  @override
  void didUpdateTweens() {
    super.didUpdateTweens();
    _selectedAnimation = animation.drive(_isSelected!);
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _isSelected = visitor(
      _isSelected,
      isSelected ? 1.0 : 0.0,
      ((value) => Tween<double>(begin: value as double)),
    ) as Tween<double>?;
  }

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(6.r),
      boxShadow: const <BoxShadow>[],
      color: FunDsColors.colorNeutral50,
    ),
    end: BoxDecoration(
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
  );

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin;
    if (widget.index == 0) {
      margin = const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 2);
    } else if (widget.index == 2) {
      margin = const EdgeInsets.only(top: 4, bottom: 4, left: 2, right: 4);
    } else {
      margin = const EdgeInsets.all(4);
    }

    return Container(
      margin: margin,
      child: IntrinsicHeight(
        child: Row(
          children: [
            // show left divider when :
            // - there's 3 tabs present,
            // - this tab index is 1 / middle
            // - selected Index is 2 / last
            VerticalDivider(
              width: 1,
              color: widget.maxIndex == 2 &&
                      widget.selectedIndex == 2 &&
                      widget.index == 1
                  ? FunDsColors.colorNeutral200
                  : Colors.transparent,
            ),
            Expanded(
              child: Container(
                height: 34.0,
                decoration: decorationTween.evaluate(_selectedAnimation),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FunDsIcon(
                            funDsIconography: widget.icon ?? '',
                            size: 16,
                          )),
                      visible: widget.icon != null,
                    ),
                    Text(
                      widget.text,
                      style: FunDsTypography.body12
                          .copyWith(color: FunDsColors.colorNeutral900),
                    ),
                  ],
                ),
              ),
            ),
            // show right divider when :
            // - there's 3 tabs present,
            // - this tab index is 1 / middle
            // - selected Index is 0 / first
            VerticalDivider(
              width: 1,
              color: widget.maxIndex == 2 &&
                      widget.index == 1 &&
                      widget.selectedIndex != 2
                  ? FunDsColors.colorNeutral200
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
