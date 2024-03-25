import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/datepicker/view/header_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FunDsMonthCalendar extends StatefulWidget {
  final DateTime selectedDay;
  final DateTime? focusedDay;
  final DateTime? firstDay;
  final DateTime? lastDay;
  final Function(DateTime)? onTapMonth;
  final VoidCallback? onTapTitle;

  const FunDsMonthCalendar({
    super.key,
    required this.selectedDay,
    this.focusedDay,
    this.firstDay,
    this.lastDay,
    this.onTapMonth,
    this.onTapTitle,
  });

  @override
  State<FunDsMonthCalendar> createState() => _FunDsMonthCalendarState();
}

class _FunDsMonthCalendarState extends State<FunDsMonthCalendar> {
  String selectedMonth = '';
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _focusedYear;

  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    super.initState();
    _focusedYear = widget.focusedDay ?? widget.selectedDay;
    _firstDay = widget.firstDay ?? DateTime.utc(0001, 1, 1);
    _lastDay = widget.lastDay ?? DateTime.utc(9999, 1, 1);
    selectedMonth =
        '${months[widget.selectedDay.month - 1]} ${widget.selectedDay.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(8.h),
          child: FunDsHeaderCalendar(
            headerTitle: DateFormat('yyyy').format(_focusedYear),
            onTapTitle: () {
              widget.onTapTitle?.call();
            },
            onTapDoubleLeft: () {
              if (isInRange(
                  DateTime(_focusedYear.year - 1, _focusedYear.month))) {
                setState(() {
                  _focusedYear =
                      DateTime(_focusedYear.year - 1, _focusedYear.month);
                });
              }
            },
            onTapDoubleRight: () {
              if (isInRange(
                  DateTime(_focusedYear.year + 1, _focusedYear.month))) {
                setState(() {
                  _focusedYear =
                      DateTime(_focusedYear.year + 1, _focusedYear.month);
                });
              }
            },
          ),
        ),
        const FunDsDivider(),
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 260.h,
            ),
            child: GridView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemCount: DateTime.monthsPerYear,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 3),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (isInRange(DateTime(_focusedYear.year, index + 1))) {
                        setState(() {
                          _focusedYear = DateTime(_focusedYear.year, index + 1);
                          widget.onTapMonth?.call(_focusedYear);
                          selectedMonth =
                              '${months[index]} ${_focusedYear.year}';
                        });
                      }
                    },
                    child: Container(
                      color: FunDsColors.colorWhite,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 6.w),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: isSameMonth(index)
                                ? FunDsColors.colorPrimary500
                                : FunDsColors.colorWhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: Center(
                            child: Text(
                              months[index],
                              style: FunDsTypography.body14.copyWith(
                                  color: !isInRange(DateTime(
                                          _focusedYear.year, index + 1))
                                      ? FunDsColors.colorNeutral500
                                      : isSameMonth(index)
                                          ? FunDsColors.colorWhite
                                          : FunDsColors.colorNeutral900),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  bool isInRange(DateTime date) {
    if ((date.compareTo(DateTime(_firstDay.year, _firstDay.month)) >= 0 &&
        date.compareTo(DateTime(_lastDay.year, _lastDay.month)) <= 0)) {
      return true;
    }
    return false;
  }

  bool isSameMonth(int index) {
    return selectedMonth == '${months[index]} ${_focusedYear.year}';
  }
}
