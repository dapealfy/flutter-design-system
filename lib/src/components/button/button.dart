import 'package:flutter/material.dart';
import 'package:flutter_design_system/src/components/button/variant/button_destructive.dart';
import 'package:flutter_design_system/src/components/button/variant/button_destructive_outline.dart';
import 'package:flutter_design_system/src/components/button/variant/button_ghost.dart';
import 'package:flutter_design_system/src/components/button/variant/button_primary.dart';
import 'package:flutter_design_system/src/components/button/variant/button_secondary.dart';
import 'package:flutter_design_system/src/components/button/variant/button_tertiary.dart';

class FunDsButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final FunDsButtonVariant variant;
  final FunDsButtonType type;
  final String text;
  final Widget? leftIcon;

  const FunDsButton({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.type,
    required this.variant,
    required this.text,
    this.leftIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      FunDsButtonVariant.primary => ButtonPrimary(
            onPressed: onPressed,
            enabled: enabled,
            type: type,
            text: text,
            leftIcon: leftIcon,
        ),
      FunDsButtonVariant.secondary => ButtonSecondary(
          onPressed: onPressed,
          enabled: enabled,
          type: type,
          text: text,
          leftIcon: leftIcon,
        ),
      FunDsButtonVariant.tertiary => ButtonTertiary(
          onPressed: onPressed,
          enabled: enabled,
          type: type,
          text: text,
          leftIcon: leftIcon,
        ),
      FunDsButtonVariant.ghost => ButtonGhost(
          onPressed: onPressed,
          enabled: enabled,
          type: type,
          text: text,
          leftIcon: leftIcon,
        ),
      FunDsButtonVariant.destructive => ButtonDestructive(
          onPressed: onPressed,
          enabled: enabled,
          type: type,
          text: text,
          leftIcon: leftIcon,
        ),
      FunDsButtonVariant.destructiveOutline => ButtonDestructiveOutline(
          onPressed: onPressed,
          enabled: enabled,
          type: type,
          text: text,
          leftIcon: leftIcon,
        )
    };
  }
}

enum FunDsButtonType {
  xLarge,
  large,
  medium,
  small,
  xSmall;
}

enum FunDsButtonVariant {
  primary,
  secondary,
  tertiary,
  ghost,
  destructive,
  destructiveOutline,
}
