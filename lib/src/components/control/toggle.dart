import 'package:flutter/cupertino.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FunDsToggleType { small, medium }

class FunDsToggle extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final FunDsToggleType type;
  final bool isActive;
  final bool isEnabled;
  final Function(bool)? onChanged;

  const FunDsToggle({
    super.key,
    required this.type,
    this.title,
    this.subtitle,
    this.isActive = true,
    this.isEnabled = true,
    this.onChanged,
  });

  @override
  State<FunDsToggle> createState() => _FunDsToggleState();
}

class _FunDsToggleState extends State<FunDsToggle> {
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
          child: GestureDetector(
            onTap: () {
              setState(() => _isActive = !_isActive);
              widget.onChanged?.call(_isActive);
            },
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FunDsTypography.heading14
                          .copyWith(color: FunDsColors.colorNeutral900),
                    ),
                  ),
                  Visibility(
                    visible: isTitleNotEmpty && isSubtitleIsNotEmpty,
                    child: Text(
                      widget.subtitle ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FunDsTypography.body14
                          .copyWith(color: FunDsColors.colorNeutral600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildToggle() {
    double width = switch (widget.type) {
      FunDsToggleType.small => 36.h,
      FunDsToggleType.medium => 44.h,
    };

    Color thumbColor =
        widget.isEnabled ? FunDsColors.colorWhite : FunDsColors.colorNeutral50;

    Color activeColor = widget.isEnabled
        ? FunDsColors.colorPrimary
        : FunDsColors.colorNeutral200;

    return SizedBox(
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: CupertinoSwitch(
          thumbColor: thumbColor,
          trackColor: FunDsColors.colorNeutral200,
          activeColor: activeColor,
          value: widget.isEnabled ? _isActive : widget.isActive,
          onChanged: (value) {
            setState(() => _isActive = value);
            widget.onChanged?.call(_isActive);
          },
        ),
      ),
    );
  }
}
