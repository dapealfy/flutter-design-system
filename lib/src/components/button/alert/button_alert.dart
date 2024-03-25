import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/button/alert/button_alert_info.dart';
import 'package:flutter_design_system/src/components/button/alert/button_alert_success.dart';
import 'package:flutter_design_system/src/components/button/alert/button_alert_warning.dart';
import 'package:flutter_design_system/src/components/button/variant/button_destructive.dart';
import 'package:flutter_design_system/src/components/button/variant/button_primary.dart';

class FunDsAlertButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final FunDsAlertType alertType;
  final FunDsButtonType buttonType;
  final String text;
  final Widget? leftIcon;

  const FunDsAlertButton({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.buttonType,
    required this.alertType,
    required this.text,
    this.leftIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return switch (alertType) {
      FunDsAlertType.neutral => ButtonPrimary(
            onPressed: onPressed,
            enabled: enabled,
            type: buttonType,
            text: text,
            leftIcon: leftIcon,
        ),
      FunDsAlertType.success => ButtonAlertSuccess(
          onPressed: onPressed,
          enabled: enabled,
          type: buttonType,
          text: text,
          leftIcon: leftIcon,
        ),
      FunDsAlertType.info => ButtonAlertInfo(
          onPressed: onPressed,
          enabled: enabled,
          type: buttonType,
          text: text,
          leftIcon: leftIcon,
        ),
      FunDsAlertType.warning => ButtonAlertWarning(
          onPressed: onPressed,
          enabled: enabled,
          type: buttonType,
          text: text,
          leftIcon: leftIcon,
        ),
      FunDsAlertType.danger => ButtonDestructive(
          onPressed: onPressed,
          enabled: enabled,
          type: buttonType,
          text: text,
          leftIcon: leftIcon,
        ),
    };
  }
}

