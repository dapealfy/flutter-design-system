import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/datepicker/view/header_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class FunDsDayCalendar extends StatefulWidget {
  /// Single mode: Current selected date
  final DateTime? selectedDay;

  /// Filled this param if use range datepicker
  final bool isRangeMode;

  /// Range mode: Selected range start date
  final DateTime? rangeStart;

  /// Range mode: Selected range end date
  final DateTime? rangeEnd;

  /// Common Param
  /// Make date before this day unclickable
  final DateTime? firstDay;

  /// Make date after this day unclickable
  final DateTime? lastDay;

  /// Currently shown month
  final DateTime? focusedDay;

  final Function(DateTime)? onTapTitle;
  final Function(DateTime)? onSingleChanged;
  final Function(DateTime start, DateTime end)? onRangeChanged;

  const FunDsDayCalendar({
    super.key,
    this.isRangeMode = false,
    this.selectedDay,
    this.firstDay,
    this.lastDay,
    this.rangeStart,
    this.rangeEnd,
    this.onTapTitle,
    this.onSingleChanged,
    this.onRangeChanged,
    this.focusedDay,
  });

  @override
  State<FunDsDayCalendar> createState() => _FunDsDayCalendarState();
}

class _FunDsDayCalendarState extends State<FunDsDayCalendar> {
  final now = DateTime.now();
  // Single Select
  DateTime? _selectedDay;

  // Range Select
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  // Common Field
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late PageController _pageController;

  int get currentPage => _pageController.page!.round();

  @override
  void initState() {
    super.initState();
    _firstDay = widget.firstDay ?? DateTime.utc(0001, 1, 1);
    _lastDay = widget.lastDay ?? DateTime.utc(9999, 1, 1);
    if (widget.isRangeMode) {
      _rangeStart = widget.rangeStart ?? now;
      _rangeEnd = widget.rangeEnd ?? now;

      _focusedDay = ensureInRange(
          widget.focusedDay ?? widget.rangeStart ?? widget.rangeEnd ?? now);
    } else {
      _focusedDay =
          ensureInRange(widget.focusedDay ?? widget.selectedDay ?? now);

      _selectedDay =
          isInRange(widget.selectedDay ?? now) ? widget.selectedDay : _firstDay;
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    _focusedDay = ensureInRange(focusedDay);

    if (start != null) {
      _rangeStart = ensureInRange(start);
    }

    if (end != null) {
      _rangeEnd = ensureInRange(end);
    }

    setState(() {});

    if (_rangeStart != null &&
        _rangeEnd != null &&
        _rangeStart!.isBefore(_rangeEnd!)) {
      widget.onRangeChanged?.call(_rangeStart!, _rangeEnd!);
    }
  }

  void _onDaySelected(DateTime? selectedDay, DateTime focusedDay) {
    _focusedDay = ensureInRange(focusedDay);
    if (selectedDay != null) {
      _selectedDay = ensureInRange(selectedDay);
    }

    setState(() {});

    if (_selectedDay != null) {
      widget.onSingleChanged?.call(_selectedDay!);
    }
  }

  DateTime ensureInRange(DateTime date) {
    if (date.isBefore(_firstDay)) {
      return _firstDay;
    } else if (date.isAfter(_lastDay)) {
      return _lastDay;
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.all(8.h),
          child: FunDsHeaderCalendar(
            headerTitle: DateFormat('MMM yyyy').format(_focusedDay),
            onTapTitle: () {
              widget.onTapTitle?.call(_focusedDay);
            },
            onTapDoubleLeft: () {
              // Previous year
              _pageController.jumpToPage(currentPage - 12);
            },
            onTapLeft: () {
              // Previous month
              _pageController.jumpToPage(currentPage - 1);
            },
            onTapDoubleRight: () {
              // Next year
              _pageController.jumpToPage(currentPage + 12);
            },
            onTapRight: () {
              // Next month
              _pageController.jumpToPage(currentPage + 1);
            },
          ),
        ),
        const FunDsDivider(),
        Column(
          children: [
            TableCalendar(
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              rangeSelectionMode: widget.isRangeMode
                  ? RangeSelectionMode.toggledOn
                  : RangeSelectionMode.toggledOff,
              onRangeSelected: _onRangeSelected,
              firstDay: _firstDay,
              lastDay: _lastDay,
              focusedDay: _focusedDay,
              headerVisible: false,
              currentDay: DateTime.now(),
              daysOfWeekHeight: 25.h,
              onCalendarCreated: (controller) => _pageController = controller,
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              onDaySelected: _onDaySelected,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarBuilders: CalendarBuilders(
                dowBuilder: _dowBuilder,
                defaultBuilder: _defaultBuilder,
                outsideBuilder: _outsideBuilder,
                selectedBuilder: _selectedBuilder,
                todayBuilder: _todayBuilder,
                withinRangeBuilder: _withinRangeBuilder,
                rangeStartBuilder: _selectedBuilder,
                rangeEndBuilder: _selectedBuilder,
                disabledBuilder: _outsideBuilder,
                rangeHighlightBuilder: _rangeHightlightBuilder,
              ),
            ),
          ],
        ),
        const FunDsDivider(),
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: InkWell(
              onTap: () {
                if (widget.isRangeMode) {
                  _onRangeSelected(now, now, now);
                } else {
                  _onDaySelected(now, now);
                }
              },
              child: Text(
                textAlign: TextAlign.center,
                'Today',
                style: FunDsTypography.body14.copyWith(
                  color: isSameDay(now, _selectedDay)
                      ? FunDsColors.colorNeutral500
                      : FunDsColors.colorPrimary500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _dowBuilder(BuildContext context, day) {
    final text = DateFormat.E().format(day);
    Color color = FunDsColors.colorNeutral600;
    return Center(
      child: ExcludeSemantics(
        child: Text(
          text,
          style: FunDsTypography.body14.copyWith(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _defaultBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: FunDsColors.colorWhite,
        shape: BoxShape.rectangle,
      ),
      child: Text(
        day.day.toString(),
        style: FunDsTypography.body14.copyWith(
          color: FunDsColors.colorNeutral900,
        ),
      ),
    );
  }

  Widget _outsideBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: FunDsColors.colorWhite,
        shape: BoxShape.rectangle,
      ),
      child: Text(
        day.day.toString(),
        style:
            FunDsTypography.body14.copyWith(color: FunDsColors.colorNeutral500),
      ),
    );
  }

  Widget _withinRangeBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    var radius = const BorderRadius.all(Radius.circular(0));
    if (day.weekday == DateTime.sunday) {
      radius = const BorderRadius.horizontal(left: Radius.circular(16));
    }
    if (day.weekday == DateTime.saturday) {
      radius = const BorderRadius.horizontal(right: Radius.circular(16));
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: FunDsColors.colorPrimary100,
        shape: BoxShape.rectangle,
        borderRadius: radius,
      ),
      child: Text(
        day.day.toString(),
        style: FunDsTypography.body14.copyWith(
          color: FunDsColors.colorNeutral900,
        ),
      ),
    );
  }

  Widget? _rangeHightlightBuilder(
      BuildContext context, DateTime day, bool isWithRange) {
    var radius = const BorderRadius.all(Radius.circular(0));
    if (day.weekday == DateTime.sunday) {
      radius = const BorderRadius.horizontal(left: Radius.circular(16));
    }
    if (day.weekday == DateTime.saturday) {
      radius = const BorderRadius.horizontal(right: Radius.circular(16));
    }

    if (isWithRange) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.symmetric(vertical: 2.h),
        padding: EdgeInsets.symmetric(vertical: 2.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: FunDsColors.colorPrimary100,
          shape: BoxShape.rectangle,
          borderRadius: radius,
        ),
      );
    }

    return null;
  }

  Widget _selectedBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: FunDsColors.colorPrimary500,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        day.day.toString(),
        style: FunDsTypography.body14.copyWith(
          color: FunDsColors.colorWhite,
        ),
      ),
    );
  }

  Widget _todayBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: FunDsColors.colorWhite,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          width: 1.w,
          color: FunDsColors.colorPrimary400,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        day.day.toString(),
        style: FunDsTypography.body14.copyWith(
          color: FunDsColors.colorNeutral900,
        ),
      ),
    );
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool isInRange(DateTime date) {
    if (date.compareTo(_firstDay) > 0 && date.compareTo(_lastDay) < 0) {
      return true;
    }
    return false;
  }
}
