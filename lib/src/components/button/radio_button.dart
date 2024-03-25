import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsRadioButton<T> extends StatelessWidget {
  final T value;
  final T selectedValue;
  final String? label;
  final String? helper;
  final bool enabled;
  final Function(T?)? onChanged;

  const FunDsRadioButton({
    Key? key,
    required this.value,
    required this.selectedValue,
    this.label,
    this.onChanged,
    this.enabled = true,
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

    if (label == null && helper == null) {
      return Radio(
        value: value,
        groupValue: selectedValue,
        onChanged: onChanged,
        activeColor: FunDsColors.colorPrimary,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        overlayColor: MaterialStateProperty.resolveWith(getOverlayColor),
        fillColor: MaterialStateProperty.resolveWith(getColor),
        hoverColor: FunDsColors.colorPrimary,
        splashRadius: 12.r,
      );
    } else {
      return InkWell(
        splashFactory:
            enabled ? InkSplash.splashFactory : NoSplash.splashFactory,
        onTap: enabled
            ? () {
                if (value != selectedValue) {
                  onChanged?.call(value);
                }
              }
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20.r,
                  width: 20.r,
                  child: Radio<T>(
                    key: const Key('radio'),
                    groupValue: selectedValue,
                    value: value,
                    activeColor: FunDsColors.colorPrimary,
                    overlayColor:
                        MaterialStateProperty.resolveWith(getOverlayColor),
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    hoverColor: FunDsColors.colorPrimary,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashRadius: 12,
                    visualDensity: VisualDensity.compact,
                    onChanged: enabled
                        ? (T? newValue) {
                            onChanged?.call(newValue);
                          }
                        : null,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label ?? '',
                  key: const Key('label'),
                  style: FunDsTypography.body14,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Visibility(
              visible: helper != null && helper!.isNotEmpty,
              child: Row(
                children: [
                  SizedBox(width: 20.r),
                  const SizedBox(width: 8),
                  Text(
                    helper ?? '',
                    key: const Key('helper'),
                    style: FunDsTypography.body14.copyWith(
                      color: FunDsColors.colorTextCaption,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
