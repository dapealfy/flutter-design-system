import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/button/button_content.dart';
import 'package:flutter_design_system/src/components/button/type/button_type.dart';

class ButtonDestructiveOutline extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final FunDsButtonType type;
  final String text;
  final Widget? leftIcon;
  final EdgeInsets? padding;

  const ButtonDestructiveOutline({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.type,
    required this.text,
    this.leftIcon,
    this.padding,
  }) : super(key: key);

  @override
  State<ButtonDestructiveOutline> createState() =>
      _ButtonDestructiveOutlineState();
}

class _ButtonDestructiveOutlineState extends State<ButtonDestructiveOutline> {
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
                  color: FunDsColors.colorRed400,
                  width: 1.0,
                  style: BorderStyle.solid,
                )
              : null,
          borderRadius: BorderRadius.circular(internalButtonType.radius),
        ),
        child: DecoratedBox(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(internalButtonType.radius),
            ),
          ),
          child: OutlinedButton(
            onFocusChange: (isFocused) =>
                setState(() => _isFocused = isFocused),
            onPressed: widget.enabled ? widget.onPressed : null,
            style:
                widget.enabled ? enabledButtonStyle() : disabledButtonStyle(),
            child: ButtonContent(
              icon: widget.leftIcon,
              text: widget.text,
              textStyle: internalButtonType.textStyle.copyWith(
                color: widget.enabled
                    ? _isFocused
                        ? FunDsColors.colorRed600
                        : FunDsColors.colorRed500
                    : FunDsColors.colorNeutral500,
              ),
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
      overlayColor: MaterialStateProperty.all(FunDsColors.colorRed50),
      backgroundColor: MaterialStateProperty.all(FunDsColors.colorWhite),
      side: MaterialStateProperty.all(
        BorderSide(
          color: _isFocused ? FunDsColors.colorRed600 : FunDsColors.colorRed500,
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
