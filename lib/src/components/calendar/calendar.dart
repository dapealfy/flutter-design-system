import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/utils/calendar_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Calendar component
/// https://www.figma.com/file/VWK8ra7NhxzTW9iY4MQ9KG/FunDS---Component-Library?type=design&node-id=7831-15923&mode=design&t=QYete7CRUJnPg0fx-0

typedef FunDsRange = ({int start, int end});

class FunDsCalendar extends StatefulWidget {
  static final itemExtent = 48.h;

  const FunDsCalendar({
    super.key,
    this.titleText,
    required this.initialDate,
    required this.onSave,
    required this.onCancel,
    this.minDate,
    this.maxDate,
    this.validation,
  });

  /// The title of the date picker
  final String? titleText;

  /// Initial date to shown for the date picker
  final DateTime initialDate;

  /// Min date to show
  final DateTime? minDate;

  /// Max date to show
  final DateTime? maxDate;

  /// Validation callback to validate the selected date
  final String? Function(DateTime date)? validation;

  /// Callback when save button clicked
  final Function(DateTime date) onSave;

  /// Callback when cancel button clicked
  final Function() onCancel;

  /// Show as Bottom Sheet
  static Future<DateTime?> showSheet(
    BuildContext context, {
    required DateTime initialDate,
    String? titleText,
    DateTime? minDate,
    DateTime? maxDate,
    String? Function(DateTime date)? validation,
  }) {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      elevation: 1.0,
      barrierColor: FunDsColors.colorOverlay.withOpacity(0.8),
      isScrollControlled: true,
      backgroundColor: FunDsColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) {
        return FunDsCalendar(
          titleText: titleText,
          initialDate: initialDate,
          minDate: minDate,
          maxDate: maxDate,
          validation: validation,
          onCancel: () {
            Navigator.of(context).pop(null);
          },
          onSave: (date) {
            Navigator.of(context).pop(date);
          },
        );
      },
    );
  }

  @override
  State<FunDsCalendar> createState() => _FunDsCalendarState();
}

class _FunDsCalendarState extends State<FunDsCalendar> {
  DateTime get effectiveMinDate => widget.minDate ?? DateTime(1950, 1, 1);

  // Month 13 day 0 means last day of the month 12
  DateTime get effectiveMaxDate => widget.maxDate ?? DateTime(3000, 13, 0);

  late DateTime selectedDate;
  late FixedExtentScrollController dayController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

  FunDsRange dayRange = (start: 0, end: 0);
  FunDsRange monthRange = (start: 0, end: 0);
  FunDsRange yearRange = (start: 0, end: 0);
  String? errorText;

  @override
  void initState() {
    super.initState();

    // Make sure initial date not exceed max date
    if (widget.initialDate.isAfter(effectiveMaxDate)) {
      selectedDate = effectiveMaxDate;
    } else {
      selectedDate = widget.initialDate;
    }

    _initDay(selectedDate);
    _initMonth(selectedDate);
    _initYear(selectedDate);

    dayController = FixedExtentScrollController(
      initialItem: selectedDate.day - dayRange.start,
    );
    monthController = FixedExtentScrollController(
      initialItem: selectedDate.month - monthRange.start,
    );
    yearController = FixedExtentScrollController(
      initialItem: selectedDate.year - yearRange.start,
    );
  }

  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  DateTime _getSelectedDate() {
    final selectedDay = dayController.selectedItem + dayRange.start;
    final selectedMonth = monthController.selectedItem + monthRange.start;
    final selectedYear = yearController.selectedItem + yearRange.start;

    final selectedDate = DateTime(
      selectedYear,
      selectedMonth,
      selectedDay,
    );

    // Handle leap year, selected date will be 1 march. So we need to change it to 28 feb
    if (selectedDate.day != selectedDay) {
      return DateTime(
        selectedDate.year,
        selectedDate.month,
        0,
      );
    }

    return selectedDate;
  }

  void _onSelectDate({
    bool isMonth = false,
    bool isYear = false,
  }) {
    final activeDate = _getSelectedDate();

    // Re init picker value, in case the selected date is not valid (ex: 31 feb)

    if (isYear) {
      _initDay(activeDate);
      _initMonth(activeDate);
    }

    if (isMonth) {
      _initDay(activeDate);
    }

    setState(() {});

    // The selected date might be changed after re init. Get the real selected date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectedDate = _getSelectedDate();
      if (widget.validation != null) {
        errorText = widget.validation?.call(selectedDate);
      }
      setState(() {});
    });
  }

  void _initDay(DateTime base) {
    final perfectLastDay = DateTime(
      base.year,
      base.month + 1,
      0,
    );

    final firstDay = (base.copyWith(day: 1).isBefore(effectiveMinDate))
        ? effectiveMinDate
        : base.copyWith(day: 1);

    final lastDay = perfectLastDay.isAfter(effectiveMaxDate)
        ? effectiveMaxDate
        : base.copyWith(day: perfectLastDay.day);

    dayRange = (start: firstDay.day, end: lastDay.day);
  }

  void _initMonth(DateTime base) {
    final firstMonth = (base.copyWith(month: 1).isBefore(effectiveMinDate))
        ? effectiveMinDate
        : base.copyWith(month: 1);

    final lastMonth = (base.copyWith(month: 12).isAfter(effectiveMaxDate))
        ? effectiveMaxDate
        : base.copyWith(month: 12);

    monthRange = (start: firstMonth.month, end: lastMonth.month);
  }

  void _initYear(DateTime base) {
    final firstYear = effectiveMinDate;
    final lastYear = effectiveMaxDate;

    yearRange = (start: firstYear.year, end: lastYear.year);
  }

  Widget _buildDayPicker() {
    return _FunDsCalendarList(
      key: const Key('calendar-day'),
      controller: dayController,
      range: dayRange,
      onSelectedItemChanged: (index) {
        _onSelectDate();
      },
      selectedItem: selectedDate.day,
      itemBuilder: (indexInRange) => Text('$indexInRange'),
    );
  }

  Widget _buildMonthPicker() {
    return _FunDsCalendarList(
      key: const Key('calendar-month'),
      controller: monthController,
      range: monthRange,
      onSelectedItemChanged: (indexInRange) {
        _onSelectDate(isMonth: true);
      },
      selectedItem: selectedDate.month,
      itemBuilder: (indexInRange) {
        return Text(CalendarUtils.getMonthName(indexInRange));
      },
    );
  }

  Widget _buildYearPicker() {
    return _FunDsCalendarList(
      key: const Key('calendar-year'),
      controller: yearController,
      range: yearRange,
      onSelectedItemChanged: (indexInRange) {
        _onSelectDate(isYear: true);
      },
      selectedItem: selectedDate.year,
      itemBuilder: (indexInRange) {
        return Text('$indexInRange');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: FunDsColors.colorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Center(
                  child: Container(
                    width: 30.w,
                    height: 4.h,
                    decoration: ShapeDecoration(
                      color: FunDsColors.colorNeutral200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1160.r),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.onCancel();
                          },
                          child: FunDsIcon(
                            key: const Key('calendar-close'),
                            funDsIconography:
                                FunDsIconography.actionIcCrossNude,
                            size: 24.w,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        DefaultTextStyle(
                          style: FunDsTypography.heading20.copyWith(
                            color: FunDsColors.colorNeutral900,
                          ),
                          child: Text(
                            widget.titleText ?? 'Pilih Tanggal',
                            key: const Key('calendar-title'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: FunDsCalendar.itemExtent * 5,
                        padding: EdgeInsets.only(
                          bottom: (errorText == null) ? 0 : 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildMonthPicker(),
                            ),
                            Expanded(
                              child: _buildDayPicker(),
                            ),
                            Expanded(
                              child: _buildYearPicker(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      crossFadeState: errorText == null
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: const SizedBox(),
                      secondChild: Offstage(
                        child: FunDsTicker(
                          key: const Key('calendar-error'),
                          description: errorText ?? '',
                          icon: FunDsIconography.infoIcWarning,
                          variant: FunDsTickerVariant.danger,
                          type: FunDsTickerType.outline,
                        ),
                        offstage: errorText == null,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: FunDsGroupButton(
                  variant: FunDsGroupButtonVariant.horizontal,
                  listButton: [
                    FunDsButton(
                      key: const Key('calendar-cancel'),
                      text: 'Batal',
                      type: FunDsButtonType.medium,
                      variant: FunDsButtonVariant.secondary,
                      onPressed: () {
                        widget.onCancel();
                      },
                    ),
                    FunDsButton(
                      key: const Key('calendar-save'),
                      text: 'Simpan',
                      type: FunDsButtonType.medium,
                      variant: FunDsButtonVariant.primary,
                      enabled: errorText == null,
                      onPressed: () {
                        widget.onSave(selectedDate);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FunDsCalendarList extends StatelessWidget {
  final FixedExtentScrollController controller;
  final FunDsRange range;
  final Function(int index) onSelectedItemChanged;
  final int selectedItem;
  final Widget Function(int indexInRange) itemBuilder;

  const _FunDsCalendarList({
    super.key,
    required this.controller,
    required this.range,
    required this.onSelectedItemChanged,
    required this.selectedItem,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: FunDsCalendar.itemExtent,
      diameterRatio: 10,
      controller: controller,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {
        onSelectedItemChanged(index);
      },
      children: List.generate(
        range.end - range.start + 1,
        (index) {
          final indexInRange = range.start + index;

          return GestureDetector(
            onTap: () {
              controller.animateToItem(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: DefaultTextStyle(
              style: selectedItem == indexInRange
                  ? FunDsTypography.heading20
                      .copyWith(color: FunDsColors.colorPrimary500)
                  : FunDsTypography.body16.copyWith(
                      color: FunDsColors.colorNeutral500,
                    ),
              child: itemBuilder(indexInRange),
            ),
          );
        },
      ),
    );
  }
}
