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
                width: 1.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(_getButtonRadius()),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: ShapeDecoration(
            gradient: widget.enabled
                ? LinearGradient(
                    begin: const Alignment(0, -1.2),
                    end: const Alignment(0, 0),
                    colors: [
                      Colors.white.withOpacity(0.12),
                      FunDsColors.colorPrimary500
                    ],
                  )
                : null,
            shadows: widget.enabled
                ? const [
                    BoxShadow(
                      color: FunDsColors.colorPrimary600,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: FunDsColors.colorPrimary500,
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    )
                  ]
                : [],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(_getButtonRadius()),
            ),
          ),
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
                    backgroundColor: MaterialStateProperty.all(
                      FunDsColors.colorPrimary500.withOpacity(0.8),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_getButtonRadius()),
                    )),
                  )
                : ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_getButtonRadius())),
                    ),
                  ),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: _getTextStyle(
                FunDsColors.colorWhite,
              ),
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
                width: 1.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(_getButtonRadius()),
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
                        borderRadius: BorderRadius.circular(_getButtonRadius())),
                  ),
                )
              : ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_getButtonRadius())),
                  ),
                ),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: _getTextStyle(
              widget.enabled
                  ? FunDsColors.colorPrimary500
                  : FunDsColors.colorNeutral500,
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
                width: 1.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(_getButtonRadius()),
      ),
      height: _getButtonHeight(),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: ShapeDecoration(
            gradient: widget.enabled
                ? LinearGradient(
                    begin: const Alignment(0, -1.2),
                    end: const Alignment(0, 0),
                    colors: [
                      Colors.white.withOpacity(0.12),
                      FunDsColors.colorNeutral200
                    ],
                  )
                : null,
            shadows: widget.enabled
                ? const [
                    BoxShadow(
                      color: FunDsColors.colorNeutral200,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ]
                : [],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(_getButtonRadius()),
            ),
          ),
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
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_getButtonRadius())),
                    ),
                  )
                : ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_getButtonRadius())),
                    ),
                  ),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: _getTextStyle(
                widget.enabled
                    ? FunDsColors.colorNeutral900
                    : FunDsColors.colorNeutral500,
              ),
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
                width: 1.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(_getButtonRadius()),
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
                      borderRadius: BorderRadius.circular(_getButtonRadius())),
                ),
              )
            : ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(
                  color: Colors.transparent,
                )),
              ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: _getTextStyle(
            widget.enabled
                ? FunDsColors.colorPrimary
                : FunDsColors.colorNeutral500,
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
                color: FunDsColors.colorRed500,
                width: 1.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(_getButtonRadius()),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: ShapeDecoration(
            gradient: widget.enabled
                ? LinearGradient(
                    begin: const Alignment(0.00, -1.2),
                    end: const Alignment(0, 0),
                    colors: [
                      Colors.white.withOpacity(0.12),
                      FunDsColors.colorRed500
                    ],
                  )
                : null,
            shadows: widget.enabled
                ? const [
                    BoxShadow(
                      color: FunDsColors.colorRed500,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: FunDsColors.colorRed600,
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    )
                  ]
                : [],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(_getButtonRadius()),
            ),
          ),
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
                          borderRadius: BorderRadius.circular(_getButtonRadius())),
                    ),
                  )
                : ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_getButtonRadius())),
                    ),
                  ),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: _getTextStyle(
                FunDsColors.colorWhite,
              ),
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
                width: 1.0,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: BorderRadius.circular(_getButtonRadius()),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(_getButtonRadius()),
            ),
          ),
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
                          borderRadius: BorderRadius.circular(_getButtonRadius())),
                    ),
                  )
                : ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_getButtonRadius())),
                    ),
                  ),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: _getTextStyle(
                widget.enabled
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

  double _getButtonRadius() {
    switch (widget.type) {
      case FunDsButtonType.small:
      case FunDsButtonType.xSmall:
        return 6.r;
      default:
        return 8.r;
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
