import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_design_system/src/components/datepicker/view/header_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FunDsYearCalendar extends StatefulWidget {
  final DateTime selectedDay;
  final DateTime? focusedDay;
  final DateTime? firstDay;
  final DateTime? lastDay;
  final Function(DateTime)? onTapYear;

  const FunDsYearCalendar({
    super.key,
    required this.selectedDay,
    this.focusedDay,
    this.firstDay,
    this.lastDay,
    this.onTapYear,
  });

  @override
  State<FunDsYearCalendar> createState() => _FunDsYearCalendarState();
}

class _FunDsYearCalendarState extends State<FunDsYearCalendar> {
  String selectedYear = '';
  String title = '';
  late DateTime _firstDay;
  late DateTime _lastDay;

  late String firstYear;
  late String lastYear;

  late DateTime focusedYear;
  List years = [];

  @override
  void initState() {
    super.initState();
    selectedYear = widget.selectedDay.year.toString();
    _setData(widget.focusedDay ?? widget.selectedDay);
    _firstDay = widget.firstDay ?? DateTime.utc(0001, 1, 1);
    _lastDay = widget.lastDay ?? DateTime.utc(9999, 1, 1);
  }

  void _setData(DateTime year) {
    setState(() {
      focusedYear = year;
      firstYear = DateFormat('yyyy')
          .format(DateTime(focusedYear.year - (focusedYear.year % 10)));
      lastYear = (int.parse(firstYear) + 9).toString();
      title = '$firstYear - $lastYear';
      years = [
        for (var i = int.parse(firstYear) - 1;
            i <= int.parse(lastYear) + 1;
            i++)
          i
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(8.h),
          child: FunDsHeaderCalendar(
            headerTitle: title,
            onTapDoubleLeft: () {
              _setData(DateTime(focusedYear.year - 10));
            },
            onTapDoubleRight: () {
              _setData(DateTime(focusedYear.year + 10));
            },
          ),
        ),
        const FunDsDivider(),
        Flexible(
          child: Container(
            constraints: BoxConstraints(maxHeight: 260.h),
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
                      if (isInRange(DateTime(years[index]))) {
                        setState(() {
                          selectedYear = years[index].toString();
                          _setData(DateTime(years[index], focusedYear.month));
                          widget.onTapYear?.call(focusedYear);
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
                            color: selectedYear == years[index].toString()
                                ? FunDsColors.colorPrimary500
                                : FunDsColors.colorWhite,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: Center(
                            child: Text(
                              years[index].toString(),
                              style: FunDsTypography.body14.copyWith(
                                color: selectedYear == years[index].toString()
                                    ? FunDsColors.colorWhite
                                    : (index == 0 || index == 11)
                                        ? FunDsColors.colorNeutral500
                                        : !isInRange(DateTime(years[index]))
                                            ? FunDsColors.colorNeutral500
                                            : FunDsColors.colorNeutral900,
                              ),
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
    if ((date.compareTo(DateTime(_firstDay.year)) >= 0 &&
        date.compareTo(DateTime(_lastDay.year)) <= 0)) {
      return true;
    }
    return false;
  }
}
