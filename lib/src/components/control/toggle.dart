import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToggleType { small, medium }

class Toggle extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final ToggleType type;
  final bool isActive;
  final bool isEnabled;
  final Function(bool)? onChanged;

  const Toggle({
    super.key,
    required this.type,
    this.title,
    this.subtitle,
    this.isActive = true,
    this.isEnabled = true,
    this.onChanged,
  });

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  late bool _isActive;

  @override
  void initState() {
    _isActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTitleNotEmpty = widget.title?.isNotEmpty == true;
    bool isSubtitleIsNotEmpty = widget.subtitle?.isNotEmpty == true;
    bool showCondition = isTitleNotEmpty || isSubtitleIsNotEmpty;

    return Row(
      children: [
        _buildToggle(),
        Visibility(
          visible: showCondition,
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: isTitleNotEmpty,
                  child: Text(
                    widget.title ?? '',
                    style: FunDsTypography.heading14
                        .copyWith(color: FunDsColors.colorNeutral900),
                  ),
                ),
                Visibility(
                  visible: isTitleNotEmpty && isSubtitleIsNotEmpty,
                  child: Text(
                    widget.subtitle ?? '',
                    style: FunDsTypography.body14
                        .copyWith(color: FunDsColors.colorNeutral600),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildToggle() {
    return SizedBox(
      height: 24.h,
      child: FittedBox(
        child: CupertinoSwitch(
          thumbColor: FunDsColors.colorWhite,
          trackColor: FunDsColors.colorNeutral200,
          activeColor: FunDsColors.colorPrimary,
          value: widget.isEnabled ? _isActive : widget.isActive,
          onChanged: (value) {
            widget.onChanged?.call(value);
            setState(() {
              _isActive = value;
            });
          },
        ),
      ),
    );
  }
}
