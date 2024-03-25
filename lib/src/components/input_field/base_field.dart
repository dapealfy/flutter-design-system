import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/disable_color_filter.dart';
import 'package:flutter_design_system/src/utils/double_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A base field that can be used to create custom input fields
class FunDsBaseField extends StatefulWidget {
  const FunDsBaseField({
    super.key,
    this.labelText,
    this.label,
    this.descriptionText,
    this.description,
    this.helperText,
    this.helper,
    this.prefix,
    this.leftIcon,
    this.suffix1,
    this.suffix2,
    this.rightIcon1,
    this.rightIcon2,
    this.isError = false,
    this.enabled = true,
    required this.focusNode,
    this.size = FunDsFieldSize.small,
    this.focusOnTap = false,
    this.onTap,
    this.contentPadding,
    this.useColorFilterForDisabled = true,
    required this.child,
  });

  /// The content of the field
  final Widget child;

  /// Will be displayed above the text field
  final String? labelText;

  /// Widget version of [labelText] when you need more customization
  final Widget? label;

  /// Will be displayed below the text field
  final String? descriptionText;

  /// Widget version of [descriptionText] when you need more customization
  final Widget? description;

  /// Will be displayed below the text field
  final String? helperText;

  /// Widget version of [helperText] when you need more customization
  final Widget? helper;

  /// Will be displayed on the left side of the text field
  /// It will be separated by border on the right side
  final Widget? prefix;

  /// Will be displayed on the left side of the text field after [prefix]
  final Widget? leftIcon;

  /// Will be displayed on the right side of the text field
  final Widget? suffix1;

  /// Will be displayed on the right most side of the text field
  /// It will separated by border on the left side
  final Widget? suffix2;

  /// Will be displayed on the right side of the text field after [suffix1]
  final Widget? rightIcon1;

  /// Will be displayed on the right side of the text field after [rightIcon1]
  final Widget? rightIcon2;

  /// Will change the border color to red
  final bool isError;

  /// Will disable the field
  final bool enabled;

  /// Will be used to control the focus of the text field
  final FocusNode focusNode;

  /// Will change the size of the field
  final FunDsFieldSize? size;

  /// Will focus the field when tapped
  final bool focusOnTap;

  /// Will be called when the text field is tapped
  final VoidCallback? onTap;

  // Padding for the content inside the border
  final EdgeInsets? contentPadding;

  /// Will use color filter when in disabled state
  /// Apply color filter to [prefix], [leftIcon], [suffix1], [suffix2],
  /// [rightIcon1], [rightIcon2]
  final bool useColorFilterForDisabled;

  @override
  State<FunDsBaseField> createState() => _FunDsBaseFieldState();
}

class _FunDsBaseFieldState extends State<FunDsBaseField> {
  FocusNode get _effectiveFocusNode => widget.focusNode;

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();

    _effectiveFocusNode.addListener(_focusListener);
  }

  void _focusListener() {
    setState(() {
      _hasFocus = _effectiveFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_focusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color? outerBorderColor;
    Color innerBorderColor = FunDsColors.colorNeutral200;
    Color labelColor = FunDsColors.colorNeutral900;
    Color descriptionColor = FunDsColors.colorNeutral700;
    Color containerColor = FunDsColors.colorWhite;

    final applyDisabledColorFilter =
        !widget.enabled && widget.useColorFilterForDisabled;

    if (widget.isError) {
      innerBorderColor = FunDsColors.colorRed500;
    }

    if (!widget.enabled) {
      innerBorderColor = FunDsColors.colorNeutral200;
      labelColor = FunDsColors.colorNeutral500;
      containerColor = FunDsColors.colorNeutral50;
      descriptionColor = FunDsColors.colorNeutral500;
    }

    if (_hasFocus && !widget.isError && widget.enabled) {
      outerBorderColor = FunDsColors.colorPrimary200;
      innerBorderColor = FunDsColors.colorPrimary400;
    }

    final labelStyle = switch (widget.size) {
      FunDsFieldSize.medium => FunDsTypography.body14B,
      _ => FunDsTypography.body12B,
    };

    final descriptionStyle = switch (widget.size) {
      FunDsFieldSize.medium => FunDsTypography.body14,
      _ => FunDsTypography.body12,
    };

    final leftIconPadding = switch (widget.size) {
      FunDsFieldSize.medium => EdgeInsets.only(left: 12.w),
      _ => EdgeInsets.only(left: 10.w),
    };

    final prefixPadding = switch (widget.size) {
      FunDsFieldSize.medium => EdgeInsets.only(left: 12.w),
      _ => EdgeInsets.only(left: 12.w),
    };

    final suffix1Padding = switch (widget.size) {
      FunDsFieldSize.medium => EdgeInsets.only(right: 12.w),
      _ => EdgeInsets.only(right: 10.w),
    };

    final suffix2Padding = switch (widget.size) {
      FunDsFieldSize.medium => EdgeInsets.only(right: 8.w),
      _ => EdgeInsets.only(right: 8.w),
    };

    final rightIcon1Padding = switch (widget.size) {
      FunDsFieldSize.medium => EdgeInsets.only(right: 12.w),
      _ => EdgeInsets.only(right: 10.w),
    };

    final rightIcon2Padding = switch (widget.size) {
      FunDsFieldSize.medium => EdgeInsets.only(right: 12.w),
      _ => EdgeInsets.only(right: 10.w),
    };

    final helperTextStyle = switch (widget.size) {
      FunDsFieldSize.medium => FunDsTypography.body14,
      _ => FunDsTypography.body12,
    };

    Widget? prefixWidget;
    if (widget.prefix != null) {
      prefixWidget = Padding(
        padding: prefixPadding,
        child: Row(
          key: const Key('prefix'),
          mainAxisSize: MainAxisSize.min,
          children: [
            DisabledColorFilter(
              apply: applyDisabledColorFilter,
              child: Center(
                child: widget.prefix!,
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              height: double.infinity,
              width: 1,
              color: innerBorderColor,
            ),
          ],
        ),
      );
    }

    Widget? suffix2Widget;
    if (widget.suffix2 != null) {
      suffix2Widget = Padding(
        padding: suffix2Padding,
        child: Row(
          key: const Key('suffix2'),
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: double.infinity,
              width: 1,
              color: innerBorderColor,
            ),
            SizedBox(width: 12.w),
            DisabledColorFilter(
              apply: applyDisabledColorFilter,
              child: Center(
                child: widget.suffix2!,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.labelText != null || widget.label != null)
          DefaultTextStyle(
            style: labelStyle.copyWith(color: labelColor),
            child: widget.label ??
                Text(
                  widget.labelText ?? '',
                  key: const Key('label'),
                ),
          ),
        if (widget.descriptionText != null || widget.description != null)
          DefaultTextStyle(
            style: descriptionStyle.copyWith(color: descriptionColor),
            child: widget.description ??
                Text(
                  widget.descriptionText ?? '',
                  key: const Key('description'),
                ),
          ),
        SizedBox(height: 4.h),
        GestureDetector(
          onTap: () {
            if (!widget.enabled) return;

            if (widget.focusOnTap) {
              _effectiveFocusNode.requestFocus();
            }

            widget.onTap?.call();
          },
          child: Container(
            key: const Key('border'),
            padding: widget.contentPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12.r,
              ),
              border: DoubleBorder(
                outerBorder: Border.all(
                  color: outerBorderColor ?? Colors.transparent,
                  width: 2,
                ),
                innerBorder: Border.all(
                  color: innerBorderColor,
                  width: 1,
                ),
              ),
              color: containerColor,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  prefixWidget ?? const SizedBox(),
                  if (widget.leftIcon != null)
                    Padding(
                      key: const Key('leftIcon'),
                      padding: leftIconPadding,
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.leftIcon!,
                      ),
                    ),
                  Expanded(
                    child: widget.child,
                  ),
                  if (widget.suffix1 != null)
                    Padding(
                      key: const Key('suffix1'),
                      padding: suffix1Padding,
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.suffix1!,
                      ),
                    ),
                  if (widget.rightIcon1 != null)
                    Padding(
                      key: const Key('rightIcon1'),
                      padding: rightIcon1Padding,
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.rightIcon1!,
                      ),
                    ),
                  if (widget.rightIcon2 != null)
                    Padding(
                      key: const Key('rightIcon2'),
                      padding: rightIcon2Padding,
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.rightIcon2!,
                      ),
                    ),
                  suffix2Widget ?? const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 4.h),
        if (widget.helperText != null || widget.helper != null)
          DefaultTextStyle(
            style: helperTextStyle.copyWith(
                color: widget.isError
                    ? FunDsColors.colorRed500
                    : descriptionColor),
            child: widget.helper ??
                Text(
                  widget.helperText ?? '',
                  key: const Key('helper'),
                ),
          ),
      ],
    );
  }
}

enum FunDsFieldSize { small, medium }
