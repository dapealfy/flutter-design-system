import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Switcher extends StatefulWidget {
  const Switcher({
    super.key,
    this.controller,
    required this.tabs,
    this.isScrollable = false,
  });

  final TabController? controller;

  final List<SwitcherTab> tabs;

  final bool isScrollable;

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
          isScrollable: widget.isScrollable,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.transparent,
          dividerHeight: 0.0,
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
                ));
          })
          .values
          .toList();

      _controller.addListener(() {
        setState(() {
          _selectedIndex = _controller.index;
          // _tabs?[_controller.previousIndex] =
          //     _tabs![_controller.previousIndex].copyWith(isSelected: false);
          //
          // _tabs?[_controller.index] =
          //     _tabs![_controller.previousIndex].copyWith(isSelected: true);
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
    return Tab(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
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
            )
          ],
        ),
      ),
    );
  }
}
