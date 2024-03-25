import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/datepicker/view/day.dart';
import 'package:flutter_design_system/src/components/datepicker/view/month.dart';
import 'package:flutter_design_system/src/components/datepicker/view/year.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerCalendar extends StatefulWidget {
  /// Single Select: Initial selected day
  final DateTime? initialDay;

  /// Multiple Select: Initial selected range start
  final DateTime? initialRangeStart;

  /// Multiple Select: Initial selected range end
  final DateTime? initialRangeEnd;

  /// Range mode selection
  final bool rangeMode;

  /// First day of available date
  final DateTime? firstDay;

  /// Last day of available date
  final DateTime? lastDay;

  /// Callback when single date selected
  final Function(DateTime)? onSingleChanged;

  /// Callback when range date selected
  final Function(DateTime start, DateTime end)? onRangeChanged;

  const DatePickerCalendar({
    super.key,
    this.initialDay,
    this.initialRangeStart,
    this.initialRangeEnd,
    this.rangeMode = false,
    this.firstDay,
    this.lastDay,
    this.onSingleChanged,
    this.onRangeChanged,
  });

  @override
  State<DatePickerCalendar> createState() => _DatePickerCalendarState();
}

class _DatePickerCalendarState extends State<DatePickerCalendar> {
  bool isVisibleDay = true;
  bool isVisibleMonth = false;
  bool isVisibleYear = false;
  DateTime? focusedDate;

  DateTime? monthYearSelected;

  @override
  void initState() {
    super.initState();
    monthYearSelected = widget.initialDay ?? widget.initialRangeStart;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 500.h),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: FunDsColors.colorWhite,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              border: Border.all(
                color: FunDsColors.colorNeutral200,
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: isVisibleDay,
                    child: FunDsDayCalendar(
                      isRangeMode: widget.rangeMode,
                      rangeStart: widget.initialRangeStart,
                      rangeEnd: widget.initialRangeEnd,
                      selectedDay: widget.initialDay,
                      focusedDay: focusedDate,
                      firstDay: widget.firstDay,
                      lastDay: widget.lastDay,
                      onTapTitle: (date) {
                        _setCalendarView(month: true);
                        focusedDate = date;
                      },
                      onSingleChanged: (date) {
                        widget.onSingleChanged?.call(date);
                        setState(() {
                          monthYearSelected = date;
                        });
                      },
                      onRangeChanged: (start, end) {
                        widget.onRangeChanged?.call(start, end);
                        setState(() {
                          monthYearSelected = start;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: isVisibleMonth,
                    child: FunDsMonthCalendar(
                      selectedDay: monthYearSelected ?? DateTime.now(),
                      focusedDay: focusedDate,
                      firstDay: widget.firstDay,
                      lastDay: widget.lastDay,
                      onTapTitle: () => _setCalendarView(year: true),
                      onTapMonth: (date) {
                        _setCalendarView(day: true);
                        setState(() {
                          focusedDate = date;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: isVisibleYear,
                    child: FunDsYearCalendar(
                      selectedDay: monthYearSelected ?? DateTime.now(),
                      focusedDay: focusedDate,
                      firstDay: widget.firstDay,
                      lastDay: widget.lastDay,
                      onTapYear: (date) {
                        _setCalendarView(month: true);
                        setState(() {
                          focusedDate = date;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void _setCalendarView({
    bool day = false,
    bool month = false,
    bool year = false,
  }) {
    setState(() {
      isVisibleDay = day;
      isVisibleMonth = month;
      isVisibleYear = year;
    });
  }
}
