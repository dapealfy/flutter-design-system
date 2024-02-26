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
    this.label,
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

    return label == null && helper == null
        ? Radio(
            value: value,
            groupValue: selectedValue,
            onChanged: onChanged,
            activeColor: FunDsColors.colorPrimary,
            hoverColor: FunDsColors.colorPrimary,
            splashRadius: 12.r,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          )
        : ListTileTheme.merge(
            horizontalTitleGap: 8.w,
            minLeadingWidth: 8.w,
            titleAlignment: ListTileTitleAlignment.top,
            child: RadioListTile<T>(
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
              title: Text(
                label ?? '',
                key: const Key('label'),
                style: FunDsTypography.body14,
              ),
              subtitle: helper == null
                  ? null
                  : Text(
                      helper ?? '',
                      key: const Key('helper'),
                      style: FunDsTypography.body14.copyWith(
                        color: FunDsColors.colorTextCaption,
                      ),
                    ),
            ),
          );
  }
}
