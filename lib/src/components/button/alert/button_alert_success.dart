import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/button/button_content.dart';
import 'package:flutter_design_system/src/components/button/type/button_type.dart';

class ButtonAlertSuccess extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final FunDsButtonType type;
  final String text;
  final Widget? leftIcon;

  const ButtonAlertSuccess({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.type,
    required this.text,
    this.leftIcon,
  }) : super(key: key);

  @override
  State<ButtonAlertSuccess> createState() => _ButtonAlertSuccessState();
}

class _ButtonAlertSuccessState extends State<ButtonAlertSuccess> {
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
                  color: FunDsColors.colorGreen200,
                  width: 1.0,
                  style: BorderStyle.solid,
                )
              : null,
          borderRadius: BorderRadius.circular(internalButtonType.radius),
        ),
        child: DecoratedBox(
          decoration: ShapeDecoration(
            gradient: widget.enabled
                ? LinearGradient(
                    begin: const Alignment(0, -1.2),
                    end: const Alignment(0, 0),
                    colors: [
                      Colors.white.withOpacity(0.12),
                      FunDsColors.colorGreen500
                    ],
                  )
                : null,
            shadows: widget.enabled
                ? const [
                    BoxShadow(
                      color: FunDsColors.colorGreen600,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: FunDsColors.colorGreen500,
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    ),
                  ]
                : [],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(internalButtonType.radius),
            ),
          ),
          child: ElevatedButton(
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
                    ? FunDsColors.colorWhite
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
      backgroundColor: MaterialStateProperty.all(FunDsColors.colorNeutral200),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(internalButtonType.radius),
        ),
      ),
      padding: MaterialStatePropertyAll(internalButtonType.padding),
    );
  }

  ButtonStyle enabledButtonStyle() {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 500),
      overlayColor: MaterialStateProperty.all(FunDsColors.colorGreen600),
      backgroundColor: MaterialStateProperty.all(
        FunDsColors.colorGreen500.withOpacity(0.8),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(internalButtonType.radius),
        ),
      ),
      padding: MaterialStatePropertyAll(internalButtonType.padding),
    );
  }
}
