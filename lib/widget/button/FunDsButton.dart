import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
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
    switch (variant) {
      case ButtonVariant.primary:
        return _buildPrimary();
      case ButtonVariant.secondary:
        return _buildSecondary();
      case ButtonVariant.tertiary:
        return _buildTertiary();
      case ButtonVariant.ghost:
        return _buildGhost();
      case ButtonVariant.destructive:
        return _buildDestructive();
      case ButtonVariant.destructiveOutline:
        return _buildDestructiveOutline();
    }
  }

  Widget _buildPrimary() {
    return SizedBox(
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled
            ? ButtonStyle(
                animationDuration: const Duration(milliseconds: 1000),
                overlayColor:
                    MaterialStateProperty.all(FunDsColors.colorPrimary600),
                backgroundColor:
                    MaterialStateProperty.all(FunDsColors.colorPrimary),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              )
            : null,
        child: Text(text, style: _getTextStyle(FunDsColors.colorWhite)),
      ),
    );
  }

  Widget _buildSecondary() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled
            ? ButtonStyle(
                animationDuration: const Duration(milliseconds: 1000),
                overlayColor:
                    MaterialStateProperty.all(FunDsColors.colorPrimary100),
                backgroundColor:
                    MaterialStateProperty.all(FunDsColors.colorWhite),
                side: MaterialStateProperty.all(const BorderSide(
                  color: FunDsColors.colorPrimary500,
                  width: 1.0,
                  style: BorderStyle.solid,
                )),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              )
            : null,
        child: Text(text, style: _getTextStyle(FunDsColors.colorPrimary500)),
      ),
    );
  }

  Widget _buildTertiary() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled
            ? ButtonStyle(
                animationDuration: const Duration(milliseconds: 1000),
                overlayColor:
                    MaterialStateProperty.all(FunDsColors.colorNeutral50),
                backgroundColor:
                    MaterialStateProperty.all(FunDsColors.colorWhite),
                side: MaterialStateProperty.all(const BorderSide(
                  color: FunDsColors.colorNeutral200,
                  width: 1.0,
                  style: BorderStyle.solid,
                )),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              )
            : null,
        child: Text(text, style: _getTextStyle(FunDsColors.colorNeutral900)),
      ),
    );
  }

  Widget _buildGhost() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled
            ? ButtonStyle(
                animationDuration: const Duration(milliseconds: 1000),
                overlayColor:
                    MaterialStateProperty.all(FunDsColors.colorPrimary100),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                side: MaterialStateProperty.all(const BorderSide(
                  color: Colors.transparent,
                )),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              )
            : null,
        child: Text(text, style: _getTextStyle(FunDsColors.colorNeutral900)),
      ),
    );
  }

  Widget _buildDestructive() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled
            ? ButtonStyle(
                animationDuration: const Duration(milliseconds: 1000),
                overlayColor:
                    MaterialStateProperty.all(FunDsColors.colorRed600),
                backgroundColor:
                    MaterialStateProperty.all(FunDsColors.colorRed500),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              )
            : null,
        child: Text(text, style: _getTextStyle(FunDsColors.colorWhite)),
      ),
    );
  }

  Widget _buildDestructiveOutline() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: enabled
            ? ButtonStyle(
                animationDuration: const Duration(milliseconds: 1000),
                overlayColor: MaterialStateProperty.all(FunDsColors.colorRed50),
                backgroundColor:
                    MaterialStateProperty.all(FunDsColors.colorWhite),
                side: MaterialStateProperty.all(const BorderSide(
                  color: FunDsColors.colorRed500,
                  width: 1.0,
                  style: BorderStyle.solid,
                )),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
              )
            : null,
        child: Text(text, style: _getTextStyle(FunDsColors.colorRed500)),
      ),
    );
  }

  TextStyle _getTextStyle(Color textColor) {
    switch (type) {
      case ButtonType.xLarge:
        return FunDsTypography.heading16.copyWith(
          color: textColor,
        );
      case ButtonType.large:
        return FunDsTypography.heading16.copyWith(
          color: textColor,
        );
      case ButtonType.medium:
        return FunDsTypography.heading14.copyWith(
          color: textColor,
        );
      case ButtonType.small:
        return FunDsTypography.body12B.copyWith(
          color: textColor,
        );
      case ButtonType.xSmall:
        return FunDsTypography.body12B.copyWith(
          color: textColor,
        );
    }
  }

  EdgeInsets _getPaddingButton() {
    switch (type) {
      case ButtonType.xLarge:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h);
      case ButtonType.large:
        return EdgeInsets.all(12.w);
      case ButtonType.medium:
        return EdgeInsets.all(8.w);
      case ButtonType.small:
        return EdgeInsets.all(8.w);
      case ButtonType.xSmall:
        return EdgeInsets.all(4.w);
    }
  }

  double _getButtonHeight() {
    switch (type) {
      case ButtonType.xLarge:
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
