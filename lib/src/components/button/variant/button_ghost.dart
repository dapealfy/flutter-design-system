import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/button/button_content.dart';
import 'package:flutter_design_system/src/components/button/type/button_type.dart';

class ButtonGhost extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final FunDsButtonType type;
  final String text;
  final Widget? leftIcon;

  const ButtonGhost({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.type,
    required this.text,
    this.leftIcon,
  }) : super(key: key);

  @override
  State<ButtonGhost> createState() => _ButtonGhostState();
}

class _ButtonGhostState extends State<ButtonGhost> {
  bool _isFocused = false;

  ButtonType get internalButtonType => widget.type.internalButtonType;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: internalButtonType.height,
      child: OutlinedButton(
        onFocusChange: (isFocused) => setState(() => _isFocused = isFocused),
        onPressed: widget.enabled ? widget.onPressed : null,
        style: widget.enabled ? enabledButtonStyle() : disabledButtonStyle(),
        child: ButtonContent(
          icon: widget.leftIcon,
          text: widget.text,
          textStyle: internalButtonType.textStyle.copyWith(
            color: widget.enabled
                ? FunDsColors.colorPrimary
                : FunDsColors.colorNeutral500,
          ),
        ),
      ),
    );
  }

  ButtonStyle disabledButtonStyle() {
    return ButtonStyle(
      side: MaterialStateProperty.all(
        const BorderSide(
          color: Colors.transparent,
        ),
      ),
      padding: MaterialStatePropertyAll(internalButtonType.padding),
    );
  }

  ButtonStyle enabledButtonStyle() {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 500),
      overlayColor: MaterialStateProperty.all(FunDsColors.colorPrimary100),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: Colors.transparent,
        ),
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
