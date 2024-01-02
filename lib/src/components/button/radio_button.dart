import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsRadioButton<T> extends StatelessWidget {
  final T value;
  final T selectedValue;
  final String? label;
  final String? helper;
  final bool? disabled;
  final Function(T?)? onChanged;
  const FunDsRadioButton({
    Key? key,
    required this.value,
    required this.selectedValue,
    required this.label,
    this.onChanged,
    this.disabled,
    this.helper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.selected,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains) &&
          states.any((element) => element == MaterialState.disabled)) {
        return FunDsColors.colorNeutral500;
      } else if (states.any(interactiveStates.contains)) {
        return FunDsColors.colorPrimary;
      }
      return FunDsColors.colorNeutral500;
    }

    Color? getOverlayColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.hovered,
      };
      if (states.any(interactiveStates.contains)) {
        return FunDsColors.colorPrimaryLight;
      }
      return null;
    }

    return RadioListTile<T>(
      value: value,
      groupValue: selectedValue,
      activeColor: FunDsColors.colorPrimary,
      contentPadding: const EdgeInsets.all(0),
      overlayColor: MaterialStateProperty.resolveWith(getOverlayColor),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      hoverColor: FunDsColors.colorPrimary,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashRadius: 12.r,
      onChanged: disabled ?? false
          ? null
          : ((value) {
              onChanged?.call(value);
            }),
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.r),
        child: Text(
          label ?? '',
          key: const Key('label'),
          style: FunDsTypography.body14,
        ),
      ),
      subtitle: helper == null
          ? null
          : Text(
              helper ?? '',
              key: const Key('helper'),
              style: FunDsTypography.body14,
            ),
    );
  }
}
