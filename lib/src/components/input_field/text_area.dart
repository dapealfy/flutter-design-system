import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter/services.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/disable_color_filter.dart';
import 'package:flutter_design_system/src/utils/double_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FunDsTextAreaSize {
  small(3),
  large(4);

  const FunDsTextAreaSize(this.maxLines);

  final int maxLines;
}

class FunDsTextArea extends StatefulWidget {
  const FunDsTextArea({
    super.key,
    this.labelText,
    this.label,
    this.descriptionText,
    this.description,
    this.hintText,
    this.helperText,
    this.helper,
    this.rightIcon1,
    this.rightIcon2,
    this.maxLines,
    this.textAreaSize = FunDsTextAreaSize.small,
    this.isError = false,
    this.enabled = true,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.onChangedDebounced,
    this.debounceDuration,
    this.maxLength = 250,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.onSubmitted,
    this.useColorFilterForDisabled = true,
  });

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

  /// Will change the border color to red
  final bool isError;

  /// Will disable the text field
  final bool enabled;

  /// Icon that will be displayed at the end bottom of the text area
  final Widget? rightIcon1;

  /// Icon that will be displayed at the end bottom of the text area
  final Widget? rightIcon2;

  /// The lines limit of the text area
  ///
  /// If null, the text size will based on the [textAreaSize] value
  final int? maxLines;

  /// The size of the text area
  /// Will set the [maxLines] value
  ///
  /// If [maxLines] is not null, this will be ignored
  final FunDsTextAreaSize textAreaSize;

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

  /// Will use color filter when in disabled state
  final bool useColorFilterForDisabled;

  @override
  State<FunDsTextArea> createState() => _FunDsTextAreaState();
}

class _FunDsTextAreaState extends State<FunDsTextArea> {
  FocusNode? _focusNode;
  FunDsTextController? _controller;
  ScrollController? _scrollController;

  FunDsTextController get _effectiveController =>
      widget.controller ?? _controller!;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode!;

  bool _hasFocus = false;
  int _counter = 0;

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

    _scrollController = ScrollController();
    _counter = _effectiveController.text.length;
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

  void _focusListener() {
    setState(() {
      _hasFocus = _effectiveFocusNode.hasFocus;
    });
  }

  void _textListener() {
    setState(() {
      _counter = _effectiveController.text.length;
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
    _scrollController?.dispose();
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.labelText != null || widget.label != null)
          DefaultTextStyle(
            style: FunDsTypography.body12B.copyWith(color: labelColor),
            child: widget.label ??
                Text(
                  widget.labelText ?? '',
                  key: const Key('label'),
                ),
          ),
        if (widget.descriptionText != null || widget.description != null)
          DefaultTextStyle(
            style: FunDsTypography.body12.copyWith(color: descriptionColor),
            child: widget.description ??
                Text(
                  widget.descriptionText ?? '',
                  key: const Key('description'),
                ),
          ),
        SizedBox(height: 4.h),
        Container(
          key: const Key('border'),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
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
          child: Stack(
            children: [
              m.RawScrollbar(
                thumbColor: FunDsColors.colorNeutral500,
                radius: const Radius.circular(8),
                controller: _scrollController,
                child: m.TextField(
                  key: const Key('textField'),
                  onChanged: _handleOnChange,
                  focusNode: _effectiveFocusNode,
                  enabled: widget.enabled,
                  controller: _effectiveController,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  onSubmitted: widget.onSubmitted,
                  inputFormatters: [
                    if (widget.maxLength != null)
                      LengthLimitingTextInputFormatter(widget.maxLength),
                    ...widget.inputFormatters ?? [],
                  ],
                  style: _textStyle(),
                  maxLines: widget.maxLines ?? widget.textAreaSize.maxLines,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal:
                          (widget.textAreaSize == FunDsTextAreaSize.small)
                              ? 10
                              : 16,
                      vertical: (widget.textAreaSize == FunDsTextAreaSize.small)
                          ? 6
                          : 12,
                    ),
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: _textStyle()
                        .copyWith(color: FunDsColors.colorNeutral500),
                  ),
                ),
              ),
              Positioned(
                right: 12.w,
                bottom: 8.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.rightIcon1 != null)
                      SizedBox(
                        key: const Key('rightIcon1'),
                        child: DisabledColorFilter(
                          apply: applyDisabledColorFilter,
                          child: widget.rightIcon1!,
                        ),
                      ),
                    SizedBox(width: 8.w),
                    if (widget.rightIcon2 != null)
                      SizedBox(
                        key: const Key('rightIcon2'),
                        child: DisabledColorFilter(
                          apply: applyDisabledColorFilter,
                          child: widget.rightIcon2!,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            if (widget.helperText != null || widget.helper != null)
              DefaultTextStyle(
                style: FunDsTypography.body12.copyWith(color: descriptionColor),
                child: widget.helper ??
                    Text(
                      widget.helperText ?? '',
                      key: const Key('helper'),
                    ),
              ),
            const Spacer(),
            if (widget.maxLength != null)
              Text(
                '${_counter.toString()} / ${widget.maxLength ?? 0}',
                key: const Key('counter'),
                style: FunDsTypography.body12.copyWith(
                  color: FunDsColors.colorNeutral700,
                ),
              ),
          ],
        ),
      ],
    );
  }

  TextStyle _textStyle() {
    switch (widget.textAreaSize) {
      case FunDsTextAreaSize.small:
        return FunDsTypography.body14;
      case FunDsTextAreaSize.large:
        return FunDsTypography.body16;
    }
  }
}
