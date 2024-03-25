import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DatePickerSheetConfig {
  final String title;
  final String closeButtonText;
  final String confirmButtonText;

  const DatePickerSheetConfig({
    this.title = 'Pilih Tanggal',
    this.closeButtonText = 'Tutup',
    this.confirmButtonText = 'Lanjutkan',
  });
}

class FunDsDatePicker extends StatefulWidget {
  // Field Param
  final String? labelText;
  final String? helperText;
  final String? descriptionText;
  final bool enabled;
  final bool isError;
  final String? singleHintText;
  final List<String>? rangeHintText;
  final String? dateFormat;
  final FunDsFieldSize size;

  // Is range mode
  final bool rangeMode;

  /// Single Select: Initial selected day
  final DateTime? selectedDate;

  /// Single Select: Callback when date selected
  final Function(DateTime)? onDateChanged;

  /// Range Select: Initial selected range
  final List<DateTime>? selectedRange;

  /// Range Select: Callback when range date selected
  final Function(DateTime start, DateTime end)? onRangeDateChanged;

  /// Sheet Param
  final DatePickerSheetConfig sheetConfig;

  /// First day of available date
  final DateTime? firstDay;

  /// Last day of available date
  final DateTime? lastDay;

  const FunDsDatePicker({
    super.key,
    this.labelText,
    this.descriptionText,
    this.helperText,
    this.singleHintText,
    this.rangeHintText,
    this.enabled = true,
    this.isError = false,
    this.dateFormat = 'dd-MM-yyyy',
    this.size = FunDsFieldSize.small,
    this.rangeMode = false,
    this.selectedDate,
    this.onDateChanged,
    this.selectedRange,
    this.onRangeDateChanged,
    this.sheetConfig = const DatePickerSheetConfig(),
    this.firstDay,
    this.lastDay,
  });

  factory FunDsDatePicker.single({
    Key? key,
    String? labelText,
    String? descriptionText,
    String? helperText,
    String? hintText,
    bool enabled = true,
    bool isError = false,
    FunDsFieldSize size = FunDsFieldSize.small,
    String dateFormat = 'dd-MM-yyyy',
    DatePickerSheetConfig sheetConfig = const DatePickerSheetConfig(),
    DateTime? firstDay,
    DateTime? lastDay,
    DateTime? selectedDate,
    Function(DateTime)? onChanged,
  }) {
    return FunDsDatePicker(
      key: key,
      rangeMode: false,
      labelText: labelText,
      descriptionText: descriptionText,
      helperText: helperText,
      singleHintText: hintText,
      enabled: enabled,
      isError: isError,
      dateFormat: dateFormat,
      size: size,
      sheetConfig: sheetConfig,
      firstDay: firstDay,
      lastDay: lastDay,
      selectedDate: selectedDate,
      onDateChanged: onChanged,
    );
  }

  factory FunDsDatePicker.range({
    Key? key,
    String? labelText,
    String? descriptionText,
    String? helperText,
    List<String>? hintText,
    bool enabled = true,
    bool isError = false,
    FunDsFieldSize size = FunDsFieldSize.small,
    DatePickerSheetConfig sheetConfig = const DatePickerSheetConfig(),
    String dateFormat = 'dd-MM-yyyy',
    DateTime? firstDay,
    DateTime? lastDay,
    List<DateTime>? selectedRange,
    Function(DateTime, DateTime)? onChanged,
  }) {
    return FunDsDatePicker(
      key: key,
      rangeMode: true,
      labelText: labelText,
      descriptionText: descriptionText,
      helperText: helperText,
      rangeHintText: hintText,
      enabled: enabled,
      isError: isError,
      dateFormat: dateFormat,
      size: size,
      sheetConfig: sheetConfig,
      firstDay: firstDay,
      lastDay: lastDay,
      selectedRange: selectedRange,
      onRangeDateChanged: onChanged,
    );
  }

  @override
  State<FunDsDatePicker> createState() => _FunDsDatePickerState();
}

class _FunDsDatePickerState extends State<FunDsDatePicker> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = switch (widget.size) {
      FunDsFieldSize.small => 16.w,
      FunDsFieldSize.medium => 16.w,
    };

    final contentPadding = switch (widget.size) {
      FunDsFieldSize.small =>
        EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
      FunDsFieldSize.medium =>
        EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
    };

    return FunDsBaseField(
      focusOnTap: true,
      focusNode: _focusNode,
      labelText: widget.labelText,
      descriptionText: widget.descriptionText,
      enabled: widget.enabled,
      helper: Builder(builder: (context) {
        return Text(
          widget.helperText ?? '',
          style: FunDsTypography.body12
              .copyWith(color: DefaultTextStyle.of(context).style.color),
        );
      }),
      isError: widget.isError,
      size: widget.size,
      suffix1: FunDsIcon(
        funDsIconography: FunDsIconography.infoIcCalendar,
        size: iconSize,
      ),
      onTap: () {
        showDatePickerBottomSheet();
      },
      child: Focus(
        focusNode: _focusNode,
        child: Padding(
          padding: contentPadding,
          child: fieldContent(),
        ),
      ),
    );
  }

  Widget fieldContent() {
    final DateFormat formatter = DateFormat(widget.dateFormat, 'ID-id');

    final hasValue = widget.rangeMode
        ? widget.selectedRange?.length == 2
        : widget.selectedDate != null;

    final textColor = widget.enabled
        ? hasValue
            ? FunDsColors.colorTextDefault
            : FunDsColors.colorTextPlaceholder
        : FunDsColors.colorTextPlaceholder;

    final textStyle = switch (widget.size) {
      FunDsFieldSize.small => FunDsTypography.body12,
      FunDsFieldSize.medium => FunDsTypography.body14,
    }
        .copyWith(color: textColor);

    if (widget.rangeMode) {
      return Row(
        children: [
          Expanded(
            child: Text(
              hasValue
                  ? formatter.format(widget.selectedRange!.first)
                  : widget.rangeHintText?.first ?? '',
              style: textStyle,
            ),
          ),
          FunDsIcon(
            funDsIconography: FunDsIconography.swapRight,
            size: 16.w,
          ),
          Expanded(
            child: Text(
              hasValue
                  ? formatter.format(widget.selectedRange!.last)
                  : widget.rangeHintText?.last ?? '',
              style: textStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      );
    } else {
      return Text(
        widget.selectedDate != null
            ? formatter.format(widget.selectedDate!)
            : widget.singleHintText ?? '',
        style: textStyle,
      );
    }
  }

  void showDatePickerBottomSheet() {
    if (widget.rangeMode) {
      FunDsDatePickerSheet.showRange(
        context: context,
        sheetConfig: widget.sheetConfig,
        initialRange: widget.selectedRange,
        firstDay: widget.firstDay,
        lastDay: widget.lastDay,
      ).then((value) {
        if (value is List<DateTime>) {
          widget.onRangeDateChanged?.call(value[0], value[1]);
        }
      });
    } else {
      FunDsDatePickerSheet.showSingle(
        context: context,
        sheetConfig: widget.sheetConfig,
        initialDate: widget.selectedDate,
        firstDay: widget.firstDay,
        lastDay: widget.lastDay,
      ).then((value) {
        if (value is DateTime) {
          widget.onDateChanged?.call(value);
        }
      });
    }
  }
}
