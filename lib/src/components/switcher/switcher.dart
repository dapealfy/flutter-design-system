import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Switcher extends StatefulWidget {
  const Switcher({
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

  /// List of [SwitcherTab].
  ///
  /// maximum provided tabs is 3, more than that preferable to use [FunDsTabs]
  final List<SwitcherTab> tabs;

  /// An optional callback that's called when the [TabBar] is tapped.
  final ValueChanged<int>? onTap;

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  late TabController _controller;
  List<_SwitcherTab>? _tabs;
  int _selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initController(context);

    return Container(
      decoration: BoxDecoration(
          color: FunDsColors.colorNeutral50,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: FunDsColors.colorNeutral200)),
      child: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: TabBar(
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          controller: _controller,
          tabs: _tabs ?? widget.tabs,
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.transparent,
          dividerHeight: 0.0,
          onTap: (int index) {
            widget.onTap?.call(index);
          },
        ),
      ),
    );
  }

  _initController(BuildContext context) {
    try {
      _controller = widget.controller ?? DefaultTabController.maybeOf(context)!;
      _tabs = widget.tabs
          .asMap()
          .map((index, value) {
            return MapEntry(
                index,
                _SwitcherTab(
                  icon: value.icon,
                  text: value.text,
                  isSelected: _selectedIndex == index,
                  index: index,
                ));
          })
          .values
          .toList();

      _controller.addListener(() {
        setState(() {
          _selectedIndex = _controller.index;
        });
      });
    } catch (e) {
      // taken from TabBar source code
      throw FlutterError(
        'No TabController for ${widget.runtimeType}.\n'
        'When creating a ${widget.runtimeType}, you must either provide an explicit '
        'TabController using the "controller" property, or you must ensure that there '
        'is a DefaultTabController above the ${widget.runtimeType}.\n'
        'In this case, there was neither an explicit controller nor a default controller.',
      );
    }
  }
}

class SwitcherTab extends StatelessWidget {
  const SwitcherTab({super.key, this.icon, required this.text});

  final String? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return _SwitcherTab(icon: icon, text: text);
  }
}

const _duration = Duration(milliseconds: 300);
const _curves = Curves.fastOutSlowIn;

// https://api.flutter.dev/flutter/widgets/DecoratedBoxTransition-class.html
class _SwitcherTab extends ImplicitlyAnimatedWidget {
  const _SwitcherTab({
    required this.text,
    this.icon,
    this.isSelected = false,
    this.index = 0,
  })  : assert(index >= 0),
        super(duration: _duration, curve: _curves);

  final String text;
  final String? icon;
  final bool isSelected;
  final int index;

  _SwitcherTab copyWith({required bool isSelected}) {
    return _SwitcherTab(
      isSelected: isSelected,
      icon: icon,
      text: text,
      index: index,
    );
  }

  @override
  AnimatedWidgetBaseState<_SwitcherTab> createState() => _SwitcherTabState();
}

class _SwitcherTabState extends AnimatedWidgetBaseState<_SwitcherTab> {
  Tween<double>? _isSelected;
  late Animation<double> _selectedAnimation;

  @override
  void didUpdateTweens() {
    super.didUpdateTweens();
    _selectedAnimation = animation.drive(_isSelected!);
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _isSelected = visitor(
      _isSelected,
      widget.isSelected ? 1.0 : 0.0,
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
            Visibility(
              child: const VerticalDivider(
                width: 1,
                color: FunDsColors.colorNeutral200,
              ),
              visible: widget.index == 1 && !widget.isSelected,
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
            Visibility(
              child: const VerticalDivider(
                width: 1,
                color: FunDsColors.colorNeutral200,
              ),
              visible: widget.index == 1 && !widget.isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
