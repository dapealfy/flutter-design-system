import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter/services.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsTextField extends StatefulWidget {
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

  /// Will change the size of the text field
  final FunDsFieldSize? size;

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

  const FunDsTextField({
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
    this.size = FunDsFieldSize.small,
    this.readOnly = false,
    this.readOnlyTextOverflow,
    this.onTap,
    this.useColorFilterForDisabled = true,
  }) : super(key: key);

  @override
  State<FunDsTextField> createState() => _FunDsTextFieldState();
}

class _FunDsTextFieldState extends State<FunDsTextField> {
  FocusNode? _focusNode;
  FunDsTextController? _controller;

  FunDsTextController get _effectiveController =>
      widget.controller ?? _controller!;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode!;

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
      style: widget.size == FunDsFieldSize.small
          ? FunDsTypography.body12
          : FunDsTypography.body14,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.size == FunDsFieldSize.small
              ? 6.h
              : widget.size == FunDsFieldSize.medium
                  ? 8.h
                  : 12.h,
          horizontal: widget.size == FunDsFieldSize.small
              ? 10.w
              : widget.size == FunDsFieldSize.medium
                  ? 12.w
                  : 16.w,
        ),
        isDense: true,
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: widget.size == FunDsFieldSize.small
            ? FunDsTypography.body12
                .copyWith(color: FunDsColors.colorTextPlaceholder)
            : FunDsTypography.body14
                .copyWith(color: FunDsColors.colorTextPlaceholder),
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
                style: widget.size == FunDsFieldSize.small
                    ? FunDsTypography.body12
                        .copyWith(color: FunDsColors.colorTextPlaceholder)
                    : FunDsTypography.body14
                        .copyWith(color: FunDsColors.colorTextPlaceholder),
                overflow: widget.readOnlyTextOverflow,
                maxLines: 1,
              );
            }
            return Text(
              value.text,
              maxLines: 1,
              overflow: widget.readOnlyTextOverflow,
              style: widget.size == FunDsFieldSize.small
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
    return FunDsBaseField(
      focusNode: _effectiveFocusNode,
      labelText: widget.labelText,
      label: widget.label,
      descriptionText: widget.descriptionText,
      description: widget.description,
      helperText: widget.helperText,
      helper: widget.helper,
      prefix: widget.prefix,
      leftIcon: widget.leftIcon,
      suffix1: widget.suffix1,
      suffix2: widget.suffix2,
      rightIcon1: widget.rightIcon1,
      rightIcon2: (_isFilled &&
              widget.showClear &&
              widget.enabled &&
              widget.rightIcon2 == null)
          ? GestureDetector(
              key: const Key('clearIcon'),
              onTap: () {
                _clear();
              },
              child: Icon(
                Icons.cancel,
                size: widget.size == FunDsFieldSize.small ? 16.w : 18.w,
                color: FunDsColors.colorNeutral600,
              ),
            )
          : widget.rightIcon2,
      isError: widget.isError,
      enabled: widget.enabled,
      size: widget.size,
      focusOnTap: widget.readOnly,
      onTap: widget.onTap,
      useColorFilterForDisabled: widget.useColorFilterForDisabled,
      child: _buildTextField(),
    );
  }
}
