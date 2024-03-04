import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter/services.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/disable_color_filter.dart';
import 'package:flutter_design_system/src/utils/double_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextField extends StatefulWidget {
  /// Will be displayed above the text field
  final String? labelText;

  /// Widget version of [labelText] when you need more customization
  final Widget? label;

  /// Will be displayed below the text field
  final String? descriptionText;

  /// Widget version of [descriptionText] when you need more customization
  final Widget? description;

  /// Will be displayed inside the text field
  final String? hintText;

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
  ///
  /// [rightIcon2] will replace clear icon when [showClear] is true
  final Widget? rightIcon2;

  /// Will show / hide clear icon on the right side of the text field
  final bool showClear;

  /// Will change the border color to red
  final bool isError;

  /// Will disable the text field
  final bool enabled;

  /// Show / hide text for password field
  final bool obscureText;

  /// Will be used to control the focus of the text field
  final FocusNode? focusNode;

  /// Will be used to control the text of the text field
  final FunDsTextController? controller;

  /// Will be called when the text of the text field is changed
  final ValueChanged<String>? onChanged;

  /// Will be called when the text of the text field is changed
  /// after [debounceDuration]
  final ValueChanged<String>? onChangedDebounced;

  /// Will be used to debounce [onChangedDebounced] callback
  final Duration? debounceDuration;

  /// Will limit the length of the text field
  final int? maxLength;

  /// Will change the keyboard type
  final TextInputType? keyboardType;

  /// Wwill format the text of the text field
  final List<TextInputFormatter>? inputFormatters;

  /// Will change the keyboard action button
  final TextInputAction? textInputAction;

  /// Will be called when the keyboard action button is pressed
  final ValueChanged<String>? onSubmitted;

  /// Will be called when the keyboard action button is pressed
  final TextFieldSize? size;

  /// Will make the text field read only
  final bool readOnly;

  /// Will change the text overflow for read only text field
  final TextOverflow? readOnlyTextOverflow;

  /// Will be called when the text field is tapped
  final VoidCallback? onTap;

  /// Will use color filter when in disabled state
  /// Apply color filter to [prefix], [leftIcon], [suffix1], [suffix2],
  /// [rightIcon1], [rightIcon2]
  final bool useColorFilterForDisabled;

  const TextField({
    Key? key,
    this.labelText,
    this.label,
    this.descriptionText,
    this.description,
    this.hintText,
    this.helperText,
    this.helper,
    this.prefix,
    this.leftIcon,
    this.suffix1,
    this.suffix2,
    this.rightIcon1,
    this.rightIcon2,
    this.showClear = true,
    this.isError = false,
    this.enabled = true,
    this.obscureText = false,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.onChangedDebounced,
    this.debounceDuration,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.onSubmitted,
    this.size = TextFieldSize.small,
    this.readOnly = false,
    this.readOnlyTextOverflow,
    this.onTap,
    this.useColorFilterForDisabled = true,
  }) : super(key: key);

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  FocusNode? _focusNode;
  FunDsTextController? _controller;

  FunDsTextController get _effectiveController =>
      widget.controller ?? _controller!;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode!;

  bool _hasFocus = false;
  bool _isFilled = false;

  Debouncer? _debouncer;

  @override
  void initState() {
    super.initState();

    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    }

    if (widget.controller == null) {
      _controller = FunDsTextController();
    }

    _effectiveFocusNode.addListener(_focusListener);
    _effectiveController.addListener(_textListener);

    if (widget.onChangedDebounced != null) {
      _debouncer = Debouncer(
        duration: widget.debounceDuration ??
            const Duration(
              milliseconds: 500,
            ),
      );
    }
  }

  void _clear() {
    _effectiveController.clear();
    _handleOnChange('');
  }

  void _focusListener() {
    setState(() {
      _hasFocus = _effectiveFocusNode.hasFocus;
    });
  }

  void _textListener() {
    setState(() {
      _isFilled = _effectiveController.text.isNotEmpty;
    });
  }

  void _handleOnChange(String value) {
    widget.onChanged?.call(value);
    _debouncer?.run(() {
      if (mounted) {
        widget.onChangedDebounced?.call(value);
      }
    });
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_focusListener);
    _effectiveController.removeListener(_textListener);
    _focusNode?.dispose();
    _controller?.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  Widget _buildEditableField() {
    return m.TextField(
      key: const Key('textField'),
      obscureText: widget.obscureText,
      onChanged: _handleOnChange,
      focusNode: _effectiveFocusNode,
      enabled: widget.enabled,
      controller: _effectiveController,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      textAlignVertical: TextAlignVertical.center,
      readOnly: widget.readOnly,
      inputFormatters: [
        if (widget.maxLength != null)
          LengthLimitingTextInputFormatter(widget.maxLength),
        ...widget.inputFormatters ?? [],
      ],
      style: widget.size == TextFieldSize.small
          ? FunDsTypography.body12
          : FunDsTypography.body14,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.size == TextFieldSize.small ? 6.h : 8.h,
          horizontal: widget.size == TextFieldSize.small ? 10.w : 12.w,
        ),
        isDense: true,
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: widget.size == TextFieldSize.small
            ? FunDsTypography.body12
            : FunDsTypography.body14
                .copyWith(color: FunDsColors.colorNeutral500),
      ),
    );
  }

  Widget _buildReadOnlyTextField() {
    return Focus(
      focusNode: _effectiveFocusNode,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 10,
        ),
        child: ValueListenableBuilder(
          valueListenable: _effectiveController,
          builder: (context, value, child) {
            if (value.text.isEmpty) {
              // Show hint
              return Text(
                widget.hintText ?? '',
                style: widget.size == TextFieldSize.small
                    ? FunDsTypography.body12
                    : FunDsTypography.body14
                        .copyWith(color: FunDsColors.colorNeutral500),
                overflow: widget.readOnlyTextOverflow,
                maxLines: 1,
              );
            }
            return Text(
              value.text,
              maxLines: 1,
              overflow: widget.readOnlyTextOverflow,
              style: widget.size == TextFieldSize.small
                  ? FunDsTypography.body12
                  : FunDsTypography.body14,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return widget.readOnly && widget.readOnlyTextOverflow != null
        ? _buildReadOnlyTextField()
        : _buildEditableField();
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

    Widget? prefixWidget;
    if (widget.prefix != null) {
      prefixWidget = Row(
        key: const Key('prefix'),
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 12.w),
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
      );
    }

    Widget? suffix2Widget;
    if (widget.suffix2 != null) {
      suffix2Widget = Row(
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
          SizedBox(width: 8.w),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.labelText != null || widget.label != null)
          DefaultTextStyle(
            style: (widget.size == TextFieldSize.medium
                    ? FunDsTypography.body14B
                    : FunDsTypography.body12B)
                .copyWith(color: labelColor),
            child: widget.label ??
                Text(
                  widget.labelText ?? '',
                  key: const Key('label'),
                ),
          ),
        if (widget.descriptionText != null || widget.description != null)
          DefaultTextStyle(
            style: (widget.size == TextFieldSize.medium
                    ? FunDsTypography.body14
                    : FunDsTypography.body12)
                .copyWith(color: descriptionColor),
            child: widget.description ??
                Text(
                  widget.descriptionText ?? '',
                  key: const Key('description'),
                ),
          ),
        SizedBox(
          height: widget.size == TextFieldSize.small ? 4.h : 8.h,
        ),
        GestureDetector(
          onTap: () {
            if (widget.readOnly) {
              _effectiveFocusNode.requestFocus();
            }

            widget.onTap?.call();
          },
          child: Container(
            key: const Key('border'),
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
                      padding: EdgeInsets.only(
                        left: widget.size == TextFieldSize.small ? 10.w : 12.w,
                      ),
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.leftIcon!,
                      ),
                    ),
                  Expanded(
                    child: _buildTextField(),
                  ),
                  if (widget.suffix1 != null)
                    Padding(
                      key: const Key('suffix1'),
                      padding: EdgeInsets.only(
                        right: widget.size == TextFieldSize.small ? 10.w : 12.w,
                      ),
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.suffix1!,
                      ),
                    ),
                  if (widget.rightIcon1 != null)
                    Padding(
                      key: const Key('rightIcon1'),
                      padding: EdgeInsets.only(
                        right: widget.size == TextFieldSize.small ? 10.w : 12.w,
                      ),
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.rightIcon1!,
                      ),
                    ),
                  if (widget.rightIcon2 != null)
                    Padding(
                      key: const Key('rightIcon2'),
                      padding: EdgeInsets.only(
                        right: widget.size == TextFieldSize.small ? 10.w : 12.w,
                      ),
                      child: DisabledColorFilter(
                        apply: applyDisabledColorFilter,
                        child: widget.rightIcon2!,
                      ),
                    ),
                  if (_isFilled &&
                      widget.showClear &&
                      widget.enabled &&
                      widget.rightIcon2 == null)
                    GestureDetector(
                      onTap: () {
                        _clear();
                      },
                      child: Padding(
                        key: const Key('clearIcon'),
                        padding: EdgeInsets.only(
                          right:
                              widget.size == TextFieldSize.small ? 10.w : 12.w,
                        ),
                        child: Icon(
                          Icons.cancel,
                          size:
                              widget.size == TextFieldSize.small ? 16.w : 18.w,
                          color: FunDsColors.colorNeutral600,
                        ),
                      ),
                    ),
                  suffix2Widget ?? const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.size == TextFieldSize.small ? 4.h : 8.h,
        ),
        if (widget.helperText != null || widget.helper != null)
          DefaultTextStyle(
            style: (widget.size == TextFieldSize.small
                    ? FunDsTypography.body12
                    : FunDsTypography.body14)
                .copyWith(
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

enum TextFieldSize {
  small,
  medium,
}
