import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/button/button_content.dart';
import 'package:flutter_design_system/src/components/button/type/button_type.dart';

class ButtonSecondary extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final FunDsButtonType type;
  final String text;
  final Widget? leftIcon;
  final EdgeInsets? padding;

  const ButtonSecondary({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.type,
    required this.text,
    this.leftIcon,
    this.padding,
  }) : super(key: key);

  @override
  State<ButtonSecondary> createState() => _ButtonSecondaryState();
}

class _ButtonSecondaryState extends State<ButtonSecondary> {
  bool _isFocused = false;

  ButtonType get internalButtonType => widget.type.internalButtonType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: internalButtonType.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: _isFocused
              ? Border.all(
                  color: FunDsColors.colorPrimary200,
                  width: 1.0,
                  style: BorderStyle.solid,
                )
              : null,
          borderRadius: BorderRadius.circular(internalButtonType.radius),
        ),
        child: OutlinedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          onFocusChange: (isFocused) => setState(() => _isFocused = isFocused),
          style: widget.enabled ? enabledButtonStyle() : disabledButtonStyle(),
          child: ButtonContent(
            icon: widget.leftIcon,
            text: widget.text,
            textStyle: internalButtonType.textStyle.copyWith(
              color: widget.enabled
                  ? FunDsColors.colorPrimary500
                  : FunDsColors.colorNeutral500,
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle disabledButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(internalButtonType.radius),
        ),
      ),
      padding: MaterialStatePropertyAll(
        widget.padding ?? internalButtonType.padding,
      ),
    );
  }

  ButtonStyle enabledButtonStyle() {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 500),
      overlayColor: MaterialStateProperty.all(FunDsColors.colorPrimary100),
      backgroundColor: MaterialStateProperty.all(FunDsColors.colorWhite),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: FunDsColors.colorPrimary500,
          width: 1.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(internalButtonType.radius),
        ),
      ),
      padding: MaterialStatePropertyAll(
        widget.padding ?? internalButtonType.padding,
      ),
    );
  }
}
