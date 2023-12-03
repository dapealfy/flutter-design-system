import 'package:flutter/material.dart';
import 'package:flutter_design_system/typography/typography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final ButtonVariant variant;
  final ButtonType type;
  final String text;

  const FunDsButton({
    Key? key,
    this.onPressed,
    this.enabled = true,
    this.type = ButtonType.medium,
    required this.variant,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPrimary();
  }

  Widget _buildPrimary() {
    return SizedBox(
      width: double.infinity,
      height: _getButtonHeight(),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled ? ButtonStyle(
          animationDuration: const Duration(milliseconds: 1000),
          overlayColor: MaterialStateProperty.all(Color(0xFF732C7C)),
          backgroundColor: MaterialStateProperty.all(Color(0xFF853291)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          )),
        ) : null,
        child: Text(text,
            style: FunDsTypography.heading16.copyWith(color: Colors.white)),
      ),
    );
  }

  Widget _buildSecondary() {
    return SizedBox(
      width: double.infinity,
      height: _getButtonHeight(),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled ? ButtonStyle(
          animationDuration: const Duration(milliseconds: 1000),
          overlayColor: MaterialStateProperty.all(Color(0xFF732C7C)),
          backgroundColor: MaterialStateProperty.all(Color(0xFF853291)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          )),
        ) : null,
        child: Text(text,
            style: FunDsTypography.heading16.copyWith(color: Colors.white)),
      ),
    );
  }


  double _getButtonHeight() {
    switch (type) {
      case ButtonType.xLarge :
        return 52.h;
      case ButtonType.large:
        return 48.h;
      case ButtonType.medium:
        return 40.h;
      case ButtonType.small:
        return 32.h;
      case ButtonType.xSmall:
        return 24.h;
    }
  }
}

enum ButtonType {
  xLarge,
  large,
  medium,
  small,
  xSmall,
}

enum ButtonVariant {
  primary,
  secondary,
  tertiary,
  ghost,
  destructive,
  destructiveOutline,
}
