import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final bool enabled;
  final FunDsButtonVariant variant;
  final FunDsButtonType type;
  final String text;

  const FunDsButton({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.type,
    required this.variant,
    required this.text,
  }) : super(key: key);

  @override
  State<FunDsButton> createState() => _FunDsButtonState();
}

class _FunDsButtonState extends State<FunDsButton> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    switch (widget.variant) {
      case FunDsButtonVariant.primary:
        return _buildPrimary();
      case FunDsButtonVariant.secondary:
        return _buildSecondary();
      case FunDsButtonVariant.tertiary:
        return _buildTertiary();
      case FunDsButtonVariant.ghost:
        return _buildGhost();
      case FunDsButtonVariant.destructive:
        return _buildDestructive();
      case FunDsButtonVariant.destructiveOutline:
        return _buildDestructiveOutline();
    }
  }

  Widget _buildPrimary() {
    return Container(
      height: _getButtonHeight(),
      decoration: BoxDecoration(
        border: _isFocused
            ? Border.all(
                color: FunDsColors.colorPrimary200,
                width: 2.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ElevatedButton(
          onFocusChange: (isFocused) => setState(() {
            _isFocused = isFocused;
          }),
          onPressed: widget.enabled ? widget.onPressed : null,
          style: widget.enabled
              ? ButtonStyle(
                  animationDuration: const Duration(milliseconds: 500),
                  overlayColor:
                      MaterialStateProperty.all(FunDsColors.colorPrimary600),
                  backgroundColor:
                      MaterialStateProperty.all(FunDsColors.colorPrimary),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                )
              : null,
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: _getTextStyle(
              FunDsColors.colorWhite,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondary() {
    return Container(
      height: _getButtonHeight(),
      decoration: BoxDecoration(
        border: _isFocused
            ? Border.all(
                color: FunDsColors.colorPrimary200,
                width: 2.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: OutlinedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          onFocusChange: (isFocused) => setState(() {
            _isFocused = isFocused;
          }),
          style: widget.enabled
              ? ButtonStyle(
                  animationDuration: const Duration(milliseconds: 500),
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
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: _getTextStyle(
              FunDsColors.colorPrimary500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTertiary() {
    return Container(
      decoration: BoxDecoration(
        border: _isFocused
            ? Border.all(
                color: FunDsColors.colorNeutral200,
                width: 2.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      height: _getButtonHeight(),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: OutlinedButton(
          onFocusChange: (isFocused) => setState(() {
            _isFocused = isFocused;
          }),
          onPressed: widget.enabled ? widget.onPressed : null,
          style: widget.enabled
              ? ButtonStyle(
                  animationDuration: const Duration(milliseconds: 500),
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
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: _getTextStyle(
              FunDsColors.colorNeutral900,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGhost() {
    return Container(
      decoration: BoxDecoration(
        border: _isFocused
            ? Border.all(
                color: FunDsColors.colorPrimary200,
                width: 2.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      height: _getButtonHeight(),
      child: OutlinedButton(
        onFocusChange: (isFocused) => setState(() {
          _isFocused = isFocused;
        }),
        onPressed: widget.enabled ? widget.onPressed : null,
        style: widget.enabled
            ? ButtonStyle(
                animationDuration: const Duration(milliseconds: 500),
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
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: _getTextStyle(
            FunDsColors.colorPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildDestructive() {
    return Container(
      height: _getButtonHeight(),
      decoration: BoxDecoration(
        border: _isFocused
            ? Border.all(
                color: FunDsColors.colorRed400,
                width: 2.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ElevatedButton(
          onFocusChange: (isFocused) => setState(() {
            _isFocused = isFocused;
          }),
          onPressed: widget.enabled ? widget.onPressed : null,
          style: widget.enabled
              ? ButtonStyle(
                  animationDuration: const Duration(milliseconds: 500),
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
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: _getTextStyle(
              FunDsColors.colorWhite,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDestructiveOutline() {
    return Container(
      height: _getButtonHeight(),
      decoration: BoxDecoration(
        border: _isFocused
            ? Border.all(
                color: FunDsColors.colorRed400,
                width: 2.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: OutlinedButton(
          onFocusChange: (isFocused) => setState(() {
            _isFocused = isFocused;
          }),
          onPressed: widget.enabled ? widget.onPressed : null,
          style: widget.enabled
              ? ButtonStyle(
                  animationDuration: const Duration(milliseconds: 500),
                  overlayColor:
                      MaterialStateProperty.all(FunDsColors.colorRed50),
                  backgroundColor:
                      MaterialStateProperty.all(FunDsColors.colorWhite),
                  side: MaterialStateProperty.all(BorderSide(
                    color: _isFocused
                        ? FunDsColors.colorRed600
                        : FunDsColors.colorRed500,
                    width: 1.0,
                    style: BorderStyle.solid,
                  )),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                )
              : null,
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: _getTextStyle(
              _isFocused ? FunDsColors.colorRed600 : FunDsColors.colorRed500,
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _getTextStyle(Color textColor) {
    switch (widget.type) {
      case FunDsButtonType.xLarge:
        return FunDsTypography.heading16.copyWith(
          color: textColor,
        );
      case FunDsButtonType.large:
        return FunDsTypography.heading16.copyWith(
          color: textColor,
        );
      case FunDsButtonType.medium:
        return FunDsTypography.heading14.copyWith(
          color: textColor,
        );
      case FunDsButtonType.small:
        return FunDsTypography.body12B.copyWith(
          color: textColor,
        );
      case FunDsButtonType.xSmall:
        return FunDsTypography.body12B.copyWith(
          color: textColor,
        );
    }
  }

  double _getButtonHeight() {
    switch (widget.type) {
      case FunDsButtonType.xLarge:
        return 52.h;
      case FunDsButtonType.large:
        return 48.h;
      case FunDsButtonType.medium:
        return 40.h;
      case FunDsButtonType.small:
        return 32.h;
      case FunDsButtonType.xSmall:
        return 24.h;
    }
  }
}

enum FunDsButtonType {
  xLarge,
  large,
  medium,
  small,
  xSmall,
}

enum FunDsButtonVariant {
  primary,
  secondary,
  tertiary,
  ghost,
  destructive,
  destructiveOutline,
}
